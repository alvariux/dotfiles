config.load_autoconfig()

c.fonts.default_size = "14pt"
c.fonts.web.size.minimum = 20

c.url.searchengines = {
        "DEFAULT":"https://duckduckgo.com/?q={}",
        "g":"https://google.com/search?q={}",
        "ml":"https://mercadolibre.com.mx/jm/search?as_word={}",
        }

c.editor.command = ['termite','-e','vim','{file}']
