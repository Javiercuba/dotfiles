# elixir and phoenix
alias phx_api="mix phx.new --no-html --no-webpack --binary-id $argv"
alias mes="mix ecto.setup"
alias megm="mix ecto.gen.migration $argv"
alias mem="mix ecto.migrate"
alias mdg="mix deps.get"
alias mdc="mix deps.compile"
alias mpr="mix phx.routes"
alias mpn="mix phx.new $argv"
alias mpgh="mix phx.gen.html $argv"
alias mpgc="mix phx.gen.context $argv"
alias mpgj="mix phx.gen.json $argv"
alias mpgs="mix phx.gen.schema $argv"
alias ies="iex -S mix"
alias mps="mix phx.server"

# docker
alias start_postgres="docker start e5a72beffd9c"

# git
alias gt="git status"
alias ga="git add ."
alias gp="git push origin $argv"
alias gpr="git pull.rebase origin $argv"
alias gc="git commit -m $argv"
alias co="git checkout $argv"
alias gb="git branch $argv"
alias gac="ga && gc"

# replace software
alias lg="lazygit"
alias ps="procs"
alias top="ytop"
alias ls="exa -l"
alias cheat="tldr $argv"
alias prettyjson="python -m json.tool | bat"
alias d="rm -rf $argv"

# system
alias fsource="source ~/.config/fish/config.fish"
alias fedit="vim ~/.config/fish/aliases.fish"
alias v="nvim $argv"

alias dev="cd /mnt/c/Dev"

alias cd="builtin cd $argv"
