$env:CDPATH = "d:/git"
$env:GIT_EDITOR = "emacsclientw.exe -t"
$env:EDITOR = "emacsclientw.exe -t"
$env:CONFIG_TARGET = "C:\\Users\\cherr\\AppData\\Roaming\\git"
$env:PATH = "$env:PATH;C:\Users\cherr\.cargo\bin"

Set-Alias -Name c -Value Clear-Host

function Set-CdIntoProjectFolder { & cd D:/git }
Set-Alias -Force -Name dot -Value Set-CdIntoProjectFolder

function GeneralGitAlias { & git $args }
Set-Alias -Force -Name g -Value GeneralGitAlias

function GeneralYarnAlias { & yarn $args }
Set-Alias -Force -Name y -Value GeneralYarnAlias

function Set-GitAdd { & git add $args }
Set-Alias -Force -Name ga -Value Set-GitAdd
function Get-GitStatus { & git status $args }
Set-Alias -Force -Name gs -Value Get-GitStatus
function Set-GitCommit { & git commit -am $args }
Set-Alias -Force -Name gc -Value Set-GitCommit
function  Set-GitPush { & git push origin $(git rev-parse --abbrev-ref HEAD) $args }
Set-Alias -Force -Name gps -Value Set-GitPush
function  Set-GitPull { & git pull origin $(git rev-parse --abbrev-ref HEAD) $args }
Set-Alias -Force -Name gpl -Value Set-GitPull
function  Set-GitCheckout { & git checkout $args }
Set-Alias -Force -Name gco -Value Set-GitCheckout
function  Get-GitDiff { & git diff }
Set-Alias -Force -Name gd -Value Get-GitDiff
function  Get-GitFetch { & git fetch -u }
Set-Alias -Force -Name gfe -Value Get-GitFetch
function  Set-GitRebase { & git rebase $args }
Set-Alias -Force -Name gr -Value Set-GitRebase

function  Set-RunEmacsclient { & emacsclientw.exe -t $args }
Set-Alias -Force -Name e -Value Set-RunEmacsclient

function cd2 {
    param($path)
    if(-not $path){return;}

    if((test-path $path) -or (-not $env:CDPATH)){
        Set-Location $path
        return
    }
    $cdpath = $env:CDPATH.split(";") | % { $ExecutionContext.InvokeCommand.ExpandString($_) }
    $npath = ""
    foreach($p in $cdpath){
        $tpath = join-path $p $path
        if(test-path $tpath){$npath = $tpath; break;}
    }
    if($npath){
        #write-host -fore yellow "Using CDPATH"
        Set-Location $npath
        return
    }

    set-location $path
}

set-alias -Name cd -value cd2 -Option AllScope
