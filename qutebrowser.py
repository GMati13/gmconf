config.bind('<Alt-h>', 'tab-prev')
config.bind('<Alt-l>', 'tab-next')
config.bind('<Alt-j>', 'back')
config.bind('<Alt-k>', 'forward')

c.url.start_pages      = ["https://google.com/"]
c.url.searchengines    = {"DEFAULT": "https://google.com/search?q={}"}
c.editor.command       = ["urxvt", "-e", "vim", "{file}", "-c", "normal {line}G{column0}l"]
c.session.default_name = "default"

c.aliases = {
    "w":         "session-save",
    "q":         "quit",
    "wq":        "quit --save",
    "translate": "open https://translate.google.com/#view=home&op=translate&sl=en&tl=ru&text="
}

