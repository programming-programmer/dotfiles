# Web Browsers:
c.url.searchengines = {
    "DEFAULT": "https://search.brave.com/search?q={}", 
    "g": "https://www.google.com/search?q={}", 
    "yt": "https://www.youtube.com/results?search_query={}",
    "myt": "https://music.youtube.com/search?q={}",
    "dict": "https://www.merriam-webster.com/dictionary/{}",
    "syn": "https://www.merriam-webster.com/thesaurus/{}",
    "nix": "https://search.nixos.org/packages?channel=23.05&from=0&size=50&sort=relevance&type=packages&query={}"
}

# Start and Default pages
c.url.default_page = "about:blank"
c.url.start_pages = "about:blank"

# Theme and Dark Mode
config.source("nord-qutebrowser.py")
c.colors.webpage.preferred_color_scheme = 'dark'
c.colors.webpage.darkmode.enabled = True

c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = False
c.input.insert_mode.leave_on_load = True
c.hints.chars = "dhtns"
c.hints.uppercase = True
c.tabs.last_close = "startpage"
c.tabs.mode_on_change = "normal"
c.tabs.title.format = "{audio}{index}: {current_title}{private}"
c.window.hide_decoration = True
c.bindings.key_mappings = {"<Ctrl-c>": "<Escape>"}
c.content.autoplay = False
c.window.transparent = True
c.statusbar.widgets = ['keypress', 'history', 'tabs']
c.statusbar.show = "always"
c.statusbar.padding = {'bottom': 0, 'left': 0, 'right': 0, 'top': 0}
c.spellcheck.languages = ['en-US']
c.content.tls.certificate_errors = "load-insecurely"
c.scrolling.bar = "never"
c.completion.quick = True
c.completion.height = "20%"
c.content.pdfjs = True
c.content.mute = True
c.completion.use_best_match = True
c.content.notifications.presenter = "messages"
c.messages.timeout = 1000

# General Bindings
config.bind(";M", "hint --rapid links spawn umpv {hint-url}")
config.bind(",m", "hint links spawn -v --detach umpv '{hint-url}'") 
config.bind(",M", "spawn -v --detach umpv '{url}'") 
config.bind("C", "clear-messages")
config.bind(",F", "hint links spawn -v firefox {hint-url}")
config.bind(",a", "adblock-update")

config.bind("o", "set-cmd-text -s :open -s")
config.bind("O", "set-cmd-text -s :open -s -t")
config.bind("wo", "set-cmd-text -s :open -s -w")
config.bind("xo", "set-cmd-text -s :open -s -b")
config.bind("f", "hint all")
config.bind("gD", "set-cmd-text -s :tab-give")
config.bind(";f", "hint --rapid")
config.unbind("+")
config.unbind("-")
config.unbind("=")
config.bind("<Ctrl-0>", "zoom")
config.bind("<Ctrl-=>", "zoom-in")
config.bind("<Ctrl-->", "zoom-out")
config.unbind("d")
config.bind("X", "tab-close --force")
config.bind("K", "tab-next")
config.bind("J", "tab-prev")

# Insert Bindings
config.bind("<Ctrl-f>", "fake-key <Right>", mode="insert")
config.bind("<Ctrl-b>", "fake-key <Left>", mode="insert")
config.bind("<Ctrl-a>", "fake-key <Home>", mode="insert")
config.bind("<Ctrl-e>", "fake-key <End>", mode="insert")
config.bind("<Ctrl-n>", "fake-key <Down>", mode="insert")
config.bind("<Ctrl-p>", "fake-key <Up>", mode="insert")
config.bind("<Alt-f>", "fake-key <Ctrl-Right>", mode="insert")
config.bind("<Alt-b>", "fake-key <Ctrl-Left>", mode="insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", mode="insert")
config.bind("<Alt-d>", "fake-key <Ctrl-Delete>", mode="insert")
config.bind("<Alt-backspace>", "fake-key <Ctrl-Backspace>", mode="insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-backspace>", mode="insert")
config.bind("<Ctrl-y>", "insert-text {clipboard}", mode="insert")
config.bind("<Escape>", "mode-leave", mode="insert")

# Command Bindings
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
config.bind("<Alt-b>", "rl-backward-word", mode="command")
config.bind("<Alt-d>", "rl-kill-word", mode="command")
config.bind("<Alt-f>", "rl-forward-word", mode="command")
config.bind("<Ctrl-a>", "rl-beginning-of-line", mode="command")
config.bind("<Ctrl-b>", "rl-backward-char", mode="command")
config.bind("<Ctrl-d>", "rl-delete-char", mode="command")
config.bind("<Ctrl-e>", "rl-end-of-line", mode="command")
config.bind("<Ctrl-f>", "rl-forward-char", mode="command")
config.bind("<Ctrl-h>", "rl-backward-delete-char", mode="command")
config.bind("<Ctrl-k>", "rl-kill-line", mode="command")
config.bind("<Ctrl-c>", "mode-leave", mode="command")

# Caret mode
config.bind("$", "move-to-end-of-line", mode="caret")
config.bind("0", "move-to-start-of-line", mode="caret")
config.bind("<Escape>", "mode-leave", mode="caret")
config.bind("G", "move-to-end-of-document", mode="caret")
config.bind("H", "scroll left", mode="caret")
config.bind("J", "scroll down", mode="caret")
config.bind("K", "scroll up", mode="caret")
config.bind("L", "scroll right", mode="caret")
config.bind("V", "selection-toggle --line", mode="caret")
config.bind("Y", "yank selection -s", mode="caret")
config.bind("b", "move-to-prev-word", mode="caret")
config.bind("e", "move-to-end-of-word", mode="caret")
config.bind("gg", "move-to-start-of-document", mode="caret")
config.bind("h", "move-to-prev-char", mode="caret")
config.bind("j", "move-to-next-line", mode="caret")
config.bind("k", "move-to-prev-line", mode="caret")
config.bind("l", "move-to-next-char", mode="caret")
config.bind("o", "selection-reverse", mode="caret")
config.bind("v", "selection-toggle", mode="caret")
config.bind("w", "move-to-next-word", mode="caret")
config.bind("y", "yank selection", mode="caret")

# Bindings for yesno mode
config.bind("<Escape>", "mode-leave", mode="yesno")
config.bind("<Return>", "prompt-accept", mode="yesno")
config.bind("N", "prompt-accept --save no", mode="yesno")
config.bind("Y", "prompt-accept --save yes", mode="yesno")
config.bind("n", "prompt-accept no", mode="yesno")
config.bind("y", "prompt-accept yes", mode="yesno")

config.bind("<Escape>", "mode-leave", mode="hint")
config.bind('<Ctrl-g>', 'mode-leave', mode='passthrough')

# Load Autoconfig
config.load_autoconfig(True)
