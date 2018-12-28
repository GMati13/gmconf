config.bind('<Alt-h>', 'back')
config.bind('<Alt-l>', 'forward')
config.bind('<Alt-j>', 'tab-prev')
config.bind('<Alt-k>', 'tab-next')

c.url.start_pages = ["https://google.com/"]
c.url.searchengines = {"DEFAULT": "https://google.com/search?q={}"}

c.editor.command = ["urxvt", "-e", "vim", "{file}", "-c", "normal {line}G{column0}l"]
