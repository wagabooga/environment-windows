function config {
    if (-Not $Env:POWERSHELL_PROFILE_PATH) {
        Write-Host "Error: PowerShell profile path not set. Please set the POWERSHELL_PROFILE_PATH environment variable."
        return
    }
    $ProfilePath = $Env:POWERSHELL_PROFILE_PATH
    if (-Not (Test-Path -Path $ProfilePath)) {
        Write-Host "Error: The specified profile path does not exist."
        return
    }
    if (-Not (Test-Path -Path $ProfilePath -IsValid)) {
        Write-Host "Error: The specified profile path is not a valid file path."
        return
    }
    if (-Not (Test-Path -Path $ProfilePath -PathType Leaf)) {
        Write-Host "Error: The specified profile path is not a file."
        return
    }
    Start-Process "nvim" $ProfilePath
}

function touch {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$FileName
    )
    $path = Join-Path $PWD $FileName
    if (-Not (Test-Path -Path $path)) {
        New-Item -ItemType File -Path $path -Force
    }
}
Set-Alias vi nvim
Set-Location C:\code

