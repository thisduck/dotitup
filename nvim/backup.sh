# backup init.lua to init-[date].lua
date=$(date +%Y-%m-%d-%H-%M-%S)
cp ~/.config/nvim/init.lua ~/.config/nvim/init-$date.lua
