case "$1" in
    install)
        apt install build-essential cmake python3-dev
        ~/.vim/plugged/YouCompleteMe/install.py --$2-completer
        ;;
    *)
        echo $0: unknown option \"$1\"
        ;;
esac
