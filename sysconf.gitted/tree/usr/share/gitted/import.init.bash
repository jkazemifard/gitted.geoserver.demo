
. /usr/share/nef-common/shell-command || exit 2

PATH=/sbin:/usr/sbin:$PATH

_git()
{
    nef_log GIT "$@"
    git "$@" || nef_fatal "fatal: git failed"
}

gitted_state_ref_name()
{
    name=$1
    echo refs/gitted-state/$GITTED_GIT_BRANCH/$name
}

gitted_new_commit=$(git show-ref -s refs/heads/$GITTED_GIT_BRANCH)
