# theme
starship init fish | source

#aliases
source $HOME/.config/fish/aliases.fish 

# env vars
source $HOME/.config/fish/env_vars.fish

# asdf
source ~/.asdf/asdf.fish

function __fish_git_prompt
  set branch (git symbolic-ref HEAD 2> /dev/null)
  
  if test -n "$branch"
    echo "$branch" | sed 's!refs/heads/!!'
  end
end
