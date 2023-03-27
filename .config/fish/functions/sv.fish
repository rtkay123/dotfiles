function sv --wraps='vim ' --description 'alias sv vim '
  alacritty -e tmux new 'vim $(find .  | sk -m)'
end
