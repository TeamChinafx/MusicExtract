$dir1 = ".\new"
$dir2 = ".\old"
$dir3 = ".\OutputData"

$hashes1 = Get-ChildItem -Path $dir1 -Recurse | Get-FileHash
$hashes2 = Get-ChildItem -Path $dir2 -Recurse | Get-FileHash

$hashes1 | Where-Object { $_.Hash -notin $hashes2.Hash } | ForEach-Object {
    $file = Get-ChildItem $_.Path
    Write-Host "New file: $file "
    Copy-Item $($file.FullName) $dir3
}
pause