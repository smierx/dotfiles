# ise $profile

# Style default PowerShell Console
$shell = $Host.UI.RawUI

#$shell.WindowTitle= "PS"

$shell.BackgroundColor = "Black"
$shell.ForegroundColor = "Gray"

Import-Module -Name Terminal-Icons
#oh-my-posh init pwsh --config "C:\Users\anitj\scoop\apps\oh-my-posh\17.12.0\themes\craver.omp.json" | Invoke-Expression
Set-Location C:/Users/miche/

$env:Path += ";$env:HOMEPATH\scripts\test"

function psconfig {Set-Location "$env:HOMEPATH/Documents/WindowsPowerShell"}
function nvconfig {Set-Location "$env:HOMEPATH/AppData/Local/nvim"}
function home {Write-Host $env:HOMEPATH}
function smopen {
    param(
        [Parameter(Mandatory=$true)][string]$projekt
    )
    if (Test-Path -Path $env:HOMEPATH/Projekte/$projekt) {
        $wtcommand = "--window 0 new-tab --title $projekt"
        Start-Process "wt.exe" -ArgumentList $wtcommand
    } else { Write-Host "not exist"}
}

function New-Project {
    param(
        [string]$Name
    )
    wsl --import $Name $env:HOMEPATH/projects $env:HOMEPATH/template.tar
}

function Backup-Template-Project {
    wsl --export template $env:HOMEPATH/template.tar
}

function Open-Project {
    param(
        [string]$Name
    )
    wsl -d $Name
}

function Git-Config {
    git --git-dir="$HOME/.cfg/" --work-tree="$HOME" @args
}


# So funktioniert ein alias
Set-Alias psconfig1 ls 

Set-Alias np New-Project
Set-Alias btp Backup-Template-Project
Set-Alias op Open-Project
Set-Alias config Git-Config

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


#https://medium.com/@anitjha31/elevate-your-windows-powershell-my-personal-customization-guide-b2dbbe9d766c