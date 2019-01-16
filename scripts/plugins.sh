case "$1" in
    install)
        vim -c ':PlugInstall | qa'
        ;;
    *)
        echo $0: unknown option \"$1\"
        ;;
esac
