function la --wraps=ls --wraps='exa -alh --group-directories-first --git' --wraps='exa -alh --icons --group-directories-first --git' --description 'alias la exa -alh --icons --group-directories-first --git'
  exa -alh --icons --group-directories-first --git $argv; 
end
