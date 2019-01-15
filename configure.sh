case "$1" in
    install)
        case "$2" in
            vim-plug)
                curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                ;;
            plugins)
                vim -c ':PlugInstall | qa'
                ;;
            plugin)
                case "$3" in
                    ag)
                        apt install silversearcher-ag
                        ;;
                *)
                    echo unknown option \"${*: -1}\"
                    ;;
                esac
                ;;
            *)
                echo unknown option \"${*: -1}\"
                ;;
        esac
        ;;
    vimrc)
        cp "vimrc-$2" ~/.vimrc
        ;;
    *)
        echo unknown option \"${*: -1}\"
        ;;
esac
