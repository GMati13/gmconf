case "$1" in
    install)
        ~/.vim/plugged/YouCompleteMe/install.py --$4-completer
        ;;
    *)
        echo $0: unknown option \"$1\"
        ;;
esac
