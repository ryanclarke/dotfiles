Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

function global:SetupProfile {
    if (!(Get-Module posh-git)) { Install-Module posh-git -Scope CurrentUser }
    if (!(Get-Module oh-my-posh)) { Install-Module oh-my-posh -Scope CurrentUser }
    if (!(Get-Module PSReadLine)) { Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck }
}

function global:.. { Set-Location .. }
function global:... { Set-Location ..\.. }
function global:.... { Set-Location ..\..\.. }

function global:cdd { Set-Location c:\dev }

function global:psg { code $HOME\dotfiles\powershell\profile.ps1 }
function global:psl { code $PROFILE }

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

function global:reload { & $PROFILE }
