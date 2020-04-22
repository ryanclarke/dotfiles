Import-Module posh-git
Import-Module oh-my-posh
Set-Theme Paradox

function global:cdd { Set-Location c:\dev }

function global:psg { code $HOME\dotfiles\powershell\profile.ps1 }
function global:psl { code $PROFILE }

function global:gith { git log --graph --full-history --color --branches --remotes }
function global:githb { git log --graph --full-history --color }
function global:githbt { git log --graph --full-history --color --simplify-by-decoration }
function global:githt { git log --graph --full-history --color --branches --remotes --simplify-by-decoration }