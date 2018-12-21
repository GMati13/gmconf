CONF_FOLDER=`dirname $BASH_SOURCE`

cp -r $CONF_FOLDER/bin $HOME
for i in `ls $HOME/bin`; do chmod +x $HOME/bin/$i; done;

cp -r $CONF_FOLDER/.tmux $HOME
cp $CONF_FOLDER/.tmux.conf $HOME
cp $CONF_FOLDER/.vimrc $HOME
cp $CONF_FOLDER/.bashrc $HOME
cp $CONF_FOLDER/.i3 $HOME/.config/i3/config

git clone https://github.com/shikherverma/i3lock-multimonitor.git
mv i3lock-multimonitor ~/.i3
chmod +x ~/.i3/i3lock-multimonitor/lock

apt install scrot
