case "$1" in
    install|remove)
        `dirname $0`/scripts/gmpkg.sh "$1" "$2"
        ;;
    vimrc)
        cp "vimrc-$2" ~/.vimrc
        ;;
    *)
        echo $0: unknown option \"$1\"
        ;;
esac
