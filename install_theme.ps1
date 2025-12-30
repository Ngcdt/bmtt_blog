$ErrorActionPreference = "Stop"
try {
    Write-Host "Creating themes directory..."
    New-Item -ItemType Directory -Force -Path "themes" | Out-Null

    $url = "https://github.com/theNewDynamic/gohugo-theme-ananke/archive/refs/heads/master.zip"
    $output = "theme.zip"
    
    Write-Host "Downloading theme from $url..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $url -OutFile $output
    
    Write-Host "Extracting theme..."
    Expand-Archive -Path $output -DestinationPath "themes" -Force
    
    $extracted = Get-ChildItem -Path "themes" -Filter "gohugo-theme-ananke-*" | Select-Object -First 1
    if ($extracted) {
        $target = Join-Path "themes" "ananke"
        if (Test-Path $target) { Remove-Item -Recurse -Force $target }
        Rename-Item -Path $extracted.FullName -NewName "ananke"
        Write-Host "Theme installed to themes/ananke"
    } else {
        Write-Error "Could not find extracted folder."
    }
    
    if (Test-Path $output) { Remove-Item $output }
    if (Test-Path "config.toml") { Remove-Item "config.toml" }
    
    Write-Host "Setup complete."
} catch {
    Write-Error $_.Exception.Message
    exit 1
}
