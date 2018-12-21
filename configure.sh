case "$1" in
    all)
        cp -r bin $HOME
        for i in `ls $HOME/bin`; do chmod +x $HOME/bin/$i; done;
        cp -r .tmux $HOME
        cp .tmux.conf $HOME
        cp .vimrc $HOME
        cp .bashrc $HOME
        cp .i3 $HOME/.config/i3/config
        git clone https://github.com/shikherverma/i3lock-multimonitor.git
        cp -r i3lock-multimonitor ~/.i3
        chmod +x ~/.i3/i3lock-multimonitor/lock
        apt install scrot
        ;;
    bin)
        cp -r bin $HOME
        for i in `ls $HOME/bin`; do chmod +x $HOME/bin/$i; done;
        ;;
    tmux)
        cp -r .tmux $HOME
        cp .tmux.conf $HOME
        ;;
    vim)
        cp .vimrc $HOME
        ;;
    bash)
        cp .bashrc $HOME
        ;;
    i3)
        cp .i3 $HOME/.config/i3/config
        git clone https://github.com/shikherverma/i3lock-multimonitor.git
        cp -r i3lock-multimonitor ~/.i3
        chmod +x ~/.i3/i3lock-multimonitor/lock
        apt install scrot
        ;;
esac;

