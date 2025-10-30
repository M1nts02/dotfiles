DIR="$( cd "$( dirname "$0" )" && pwd )"
echo ${DIR}
echo '' > ${HOME}/.aria2.session

mkdir -p ${HOME}/.config
ln -s ${DIR}/config/nvim    ${HOME}/.config/nvim
ln -s ${DIR}/config/yazi    ${HOME}/.config/yazi
ln -s ${DIR}/config/ghostty ${HOME}/.config/ghostty
ln -s ${DIR}/config/mpv     ${HOME}/.config/mpv
ln -s ${DIR}/config/aria2   ${HOME}/.config/aria2

ln -s ${DIR}/hammerspoon   ${HOME}/.hammerspoon

mkdir -p ${HOME}/.vim
ln -s ${DIR}/vim/vimrc   ${HOME}/.vim/
ln -s ${DIR}/vim/gvimrc  ${HOME}/.vim/
