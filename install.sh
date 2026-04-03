DIR="$( cd "$( dirname "$0" )" && pwd )"
echo ${DIR}
echo '' > ${HOME}/.aria2.session

mkdir -p ${HOME}/.config
ln -s ${DIR}/config/nvim        ${HOME}/.config/nvim
ln -s ${DIR}/config/yazi        ${HOME}/.config/yazi
ln -s ${DIR}/config/ghostty     ${HOME}/.config/ghostty
ln -s ${DIR}/config/mpv         ${HOME}/.config/mpv
ln -s ${DIR}/config/gitui       ${HOME}/.config/gitui
ln -s ${DIR}/config/stylua      ${HOME}/.config/stylua

ln -s ${DIR}/hammerspoon   ${HOME}/.hammerspoon

mkdir -p ${HOME}/.vim
ln -s ${DIR}/vim/vimrc  ${HOME}/.vim/vimrc
ln -s ${DIR}/vim/gvimrc ${HOME}/.vim/gvimrc
