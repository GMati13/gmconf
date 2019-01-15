case "$1" in
bashrc)
    if [ -z "$2" ]; then
        cp bashrc ~/.bashrc
    else
        cp bashrc-$2 ~/.bashrc-$2
    fi
    ;;
source)
    echo "source ~/.bashrc-$2" >> ~/.bashrc
    ;;
install)
    case "$2" in
    plugin)
        case "$3" in
        git-prompt)
            git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
            ;;
        *)
            echo unknown option \"$3\"
            ;;
        esac
        ;;
    *)
        echo unknown option \"$2\"
        ;;
    esac
    ;;
*)
    echo unknown option \"$1\"
    ;;
esac
