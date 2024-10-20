
function download-from-reddit([Parameter(ValueFromRemainingArguments = $true)]$params) {
    docker run -v 'C:\Users\andre\Downloads\RedditDownloader:/code/output' spanching/reddit-downloader $params
}
Set-Alias redditdownloader download-from-reddit 

Set-Alias python3 python

$ENV:STARSHIP_CONFIG = "C:\Users\AndreasK\OneDrive - MaibornWolff GmbH\Dokumente\PowerShell\starship.toml"
Invoke-Expression (&starship init powershell)

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

$ENV:FZF_DEFAULT_OPTS=@"
--preview "bat -n --color=always --line-range :500 {}"
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284
"@
$ENV:FZF_DEFAILT_COMMAND='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_T_OPTS='--preview "bat -n --color=always --line-range :500 {}"'
$ENV:FZF_CTRL_R_OPTS='--preview "bat -n --color=always --line-range :500 {}"'

function Git-Pull {
    git pull
}
Set-Alias gitp Git-Pull

function Git-CheckoutMaster {
    git checkout master
    git pull
}
Set-Alias gitcm Git-CheckoutMaster

function Git-SwitchRemoteBranch {
    # Make sure we have an up-to-date list of branches
    git fetch

    # Get the branch name using fzf. We list both local (heads) and remote (remotes) branches.
    $branch = git for-each-ref --format="%(refname:short)" refs/heads refs/remotes | fzf --height=40% --reverse --info=inline --preview='echo {}'

    if (-not $branch) {
        Write-Host "No branch selected."
        return
    }

    $branch = $branch.Trim()

    # Strip 'origin/' if present
    if ($branch -like 'origin/*') {
        $branch = $branch -replace '^origin/', ''
    }

    # Attempt to check out the branch
    $local_ref = git show-ref --verify refs/heads/$branch | out-null
    if (!($local_ref -like 'fatal: * - not a valid ref')) {
        git switch $branch
        return
    } 
    $remote_ref = git show-ref --verify refs/remotes/origin/$branch | out-null
    if (!($remote_ref -like 'fatal: * - not a valid ref')) {
        git switch $branch
        return
    } else {
      Write-Host "Could not find local or remote branch ref"
      return
    }

    git pull
}
Set-Alias gitcb Git-SwitchRemoteBranch

. "C:\Users\AndreasK\Miele\helper\tools\miele.ps1"

function Go-Notes {
    Set-Location -Path "C:\Users\AndreasK\Notes"
}
Set-Alias notes Go-Notes

$ENV:K9S_EDITOR='nvim'
$ENV:EDITOR='nvim'
