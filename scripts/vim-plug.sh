case "$i" in
    install)
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        ;;
    *)
        echo $0: unknown option \"$1\"
        ;;
esac
