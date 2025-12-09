Import-Module posh-git
Import-Module oh-my-posh
$global:DefaultUser = [System.Environment]::UserName
Set-PoshPrompt -Theme $Home\dotfiles\powershell\.ryanclarke.omp.json


function global:InstallOrUpdateModule {
    param ([string]$ModuleName)
    
    if (!(Get-Module $ModuleName)) {
        Install-Module -Name $ModuleName -Scope CurrentUser -Force -AllowPrerelease
    } else {
        Update-Module -Name $ModuleName -Scope CurrentUser -Force
    }
}

function global:SetupProfile {
    InstallOrUpdateModule -ModuleName posh-git
    InstallOrUpdateModule -ModuleName oh-my-posh
    InstallOrUpdateModule -ModuleName PSReadLine
}

function global:.. { Set-Location .. }
function global:... { Set-Location ..\.. }
function global:.... { Set-Location ..\..\.. }

function global:cdd { Set-Location c:\dev }
function global:editTheme { code $Home\dotfiles\powershell\.ryanclarke.omp.json }
function global:reload { & $PROFILE.CurrentUserAllHosts }
function global:psg { code $HOME\dotfiles\powershell\profile.ps1 }
function global:psl { code $PROFILE.CurrentUserAllHosts }
function global:vars { gci env:* | sort-object name }

#---------
# GIT
#---------
function global:gitH { git log --graph --full-history --color --branches --remotes }
function global:gitHb { git log --graph --full-history --color }
function global:gitHbt { git log --graph --full-history --color --simplify-by-decoration }
function global:gitHt { git log --graph --full-history --color --branches --remotes --simplify-by-decoration }
function global:gitSanitize {
    git clean -fXd

    while ((Get-ChildItem -Directory -Recurse | Where-Object {$_.GetFileSystemInfos().Count -eq 0 }).Count -gt 0) {
        Get-ChildItem -Directory -Recurse | Where-Object {$_.GetFileSystemInfos().Count -eq 0 } | Remove-Item
    }
}

