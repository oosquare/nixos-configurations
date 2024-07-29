RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"
FZF_DEFAULT_COMMAND="if [[ -n \"$INITIAL_QUERY\" ]]; then; $RG_PREFIX $(printf %q \"$INITIAL_QUERY\"); fi || true" \
fzf --ansi \
    --disabled --query "$INITIAL_QUERY" \
    --bind "change:reload:sleep 0.2; if [[ -n {q} ]]; then; $RG_PREFIX {q}; fi || true" \
    --bind="enter:execute($EDITOR {1} +{2})" \
    --delimiter=":" \
    --preview="if [[ -n {1} ]]; then; bat --style=numbers,header --color=always --highlight-line={2} {1}; fi" \
    --preview-window=border-left

