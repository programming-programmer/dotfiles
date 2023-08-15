# Web Browsers:
# Brave - DEFAULT
# Youtube
c.url.searchengines = {"DEFAULT": "https://search.brave.com/search?q={}", "g": "https://www.google.com/search?q={}", "yt": "https://www.youtube.com/results?search_query={}"}

# Start and Def pages
c.url.default_page = "https://search.brave.com/"
c.url.start_pages = "https://search.brave.com/"

# Theme
config.source("nord-qutebrowser.py")
config.set("colors.webpage.darkmode.enabled", True)

c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True
c.input.insert_mode.leave_on_load = True
c.hints.chars = "aoeuidhtns"
c.hints.uppercase = True
c.tabs.last_close = "startpage"
c.tabs.mode_on_change = "normal"
c.tabs.title.format = "{audio}{index}: {current_title}"
c.window.hide_decoration = False
c.bindings.key_mappings = {"<Ctrl-c>": "<Escape>"}
c.content.autoplay = False

# General Bindings
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("tb", "config-cycle statusbar.show always never")
config.bind("tt", "config-cycle tabs.show always never")
config.unbind("+")
config.unbind("-")
config.unbind("=")
config.bind("<Ctrl-=>", "zoom-in")
config.bind("<Ctrl-->", "zoom-out")
config.bind("K", "tab-next")
config.bind("J", "tab-prev")
config.bind("<Ctrl-F>", "hint links spawn garcon-url-handler {hint-url}")

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
config.bind("<Ctrl-y>", "insert-text {primary}", mode="insert")
config.bind("<Escape>", "mode-leave", mode="insert")

# Command Bindings
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
config.bind("<Alt-b>", "rl-backward-word", mode="command")
config.bind("<Alt-d>", "rl-kill-word", mode="command")
config.bind("<Alt-f>", "rl-forward-word", mode="command")
config.bind("<Ctrl-a>", "rl-beginning-of-line", mode="command")
config.bind("<Ctrl-b>", "rl-backward-char", mode="command")
config.bind("<Ctrl-c>", "completion-item-yank", mode="command")
config.bind("<Ctrl-d>", "completion-item-del", mode="command")
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
config.bind("[", "move-to-start-of-prev-block", mode="caret")
config.bind("]", "move-to-start-of-next-block", mode="caret")
config.bind("b", "move-to-prev-word", mode="caret")
config.bind("c", "mode-enter normal", mode="caret")
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
config.bind("{", "move-to-end-of-prev-block", mode="caret")
config.bind("}", "move-to-end-of-next-block", mode="caret")

# Bindings for yesno mode
config.bind("<Escape>", "mode-leave", mode="yesno")
config.bind("<Return>", "prompt-accept", mode="yesno")
config.bind("N", "prompt-accept --save no", mode="yesno")
config.bind("Y", "prompt-accept --save yes", mode="yesno")
config.bind("n", "prompt-accept no", mode="yesno")
config.bind("y", "prompt-accept yes", mode="yesno")

config.bind("<Escape>", "mode-leave", mode="hint")
config.load_autoconfig(False)
