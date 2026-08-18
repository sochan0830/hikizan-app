
Add-Type -AssemblyName System.Drawing
$path = "c:\Users\socha\.gemini\antigravity\scratch\kakezan-app\assets\seal.png"
$tempPath = "c:\Users\socha\.gemini\antigravity\scratch\kakezan-app\assets\seal_temp.png"

try {
    $img = [System.Drawing.Bitmap]::FromFile($path)
    $img.MakeTransparent([System.Drawing.Color]::White)
    $img.Save($tempPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $img.Dispose()
    
    Move-Item -Force $tempPath $path
    Write-Host "Success"
} catch {
    Write-Error $_.Exception.Message
}
