<?php

/**
 * 从目录名提取版本号，生成aria2下载文件
 */

// 从目录名提取版本信息
$dirName = 'tw_20260604_1';
preg_match('/tw_(\d+)_(\d+)/', $dirName, $matches);
$date = $matches[1]; // 20260604
$versionNum = $matches[2]; // 1

echo "目录名: {$dirName}\n";
echo "日期: {$date}\n";
echo "版本号: {$versionNum}\n\n";

$baseUrl = "http://cwres.feimogames.com/{$dirName}/android/bundles/";

// 先读取version文件获取时间戳
echo "=== 读取version文件获取时间戳 ===\n";

$versionFiles = [
    'ResPackage' => $baseUrl . 'PackageManifest_ResPackage.version',
    'MediaPackage' => $baseUrl . 'PackageManifest_MediaPackage.version',
];

$version = '';

foreach ($versionFiles as $name => $url) {
    echo "读取 {$name}: {$url}\n";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 30);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode === 200) {
        $version = trim($response);
        echo "时间戳: {$version}\n\n";
        break;
    }
}

if (empty($version)) {
    echo "无法获取时间戳\n";
    exit(1);
}

// 解析JSON文件
echo "=== 解析JSON文件 ===\n";

$jsonFiles = [
    'ResPackage' => $baseUrl . "PackageManifest_ResPackage_{$version}.json",
    'MediaPackage' => $baseUrl . "PackageManifest_MediaPackage_{$version}.json",
];

$ariaLines = [];
$totalSize = 0;
$count = 0;

foreach ($jsonFiles as $name => $url) {
    echo "处理 {$name}...\n";

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 60);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);

    if ($httpCode !== 200) {
        echo "请求失败，跳过\n";
        continue;
    }

    $data = json_decode($response, true);

    if (!isset($data['BundleList'])) {
        echo "未找到BundleList，跳过\n";
        continue;
    }

    $bundles = $data['BundleList'];
    echo "找到 " . count($bundles) . " 个bundle\n";

    foreach ($bundles as $bundle) {
        $bundleName = $bundle['BundleName'];
        $fileHash = $bundle['FileHash'];
        $fileSize = $bundle['FileSize'];

        // 构建URL: {BundleName去掉.bundle}_{FileHash}.bundle
        $baseName = preg_replace('/\.bundle$/', '', $bundleName);
        $downloadUrl = $baseUrl . $baseName . '_' . $fileHash . '.bundle';


        // aria2格式: URL\n  out=本地文件名
        $ariaLines[] = $downloadUrl;
        $ariaLines[] = "  out={$bundleName}";

        $totalSize += $fileSize;
        $count++;
    }
}

// 写入aria2文件
$ariaContent = implode("\n", $ariaLines);
file_put_contents('downloads.txt', $ariaContent);

echo "\n=== 完成 ===\n";
echo "共生成 {$count} 个下载任务\n";
echo "总大小: " . round($totalSize / 1024 / 1024, 2) . " MB\n";
echo "已保存到: downloads.txt\n";

// 显示前10个示例
echo "\n前5个下载任务示例:\n";
for ($i = 0; $i < min(10, count($ariaLines)); $i++) {
    echo $ariaLines[$i] . "\n";
}
