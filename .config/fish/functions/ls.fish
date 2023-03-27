function ls --wraps='exa -alh --icons --group-directories-first --git' --wraps='exa -lh --icons --group-directories-first --git' --description 'alias ls exa -lh --icons --group-directories-first --git'
  exa -lh --icons --group-directories-first --git $argv; 
end
