# Functions used by fzf to generate a list of files or directories

function _fzf_compgen_path() {
    eval "fd --follow --color=always -E '.git' -E 'build' -E 'target' -E 'node_modules' . \"$1\""
}

function _fzf_compgen_dir() {
    eval "fd --type d --follow --color=always -E '.git' -E 'build' -E 'target' -E 'node_modules' . \"$1\""
}

