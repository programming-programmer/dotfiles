(setq gc-cons-threshold (* 50 1000 1000) 
      gc-cons-percentage 0.6)

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold 16777216 ; 16mb
                  gc-cons-percentage 0.1)))

(setq gcmh-idle-delay 'auto  ; default is 15s
      gcmh-auto-idle-delay-factor 10
      gcmh-high-cons-threshold (* 16 1024 1024))  ; 16mb

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(require 'use-package)
(setq use-package-always-ensure t)

(server-start)

(setq-default
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 sentence-end-double-space nil                    ; Double space after a period!? Inhumane!
 cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
 fill-column 80                                   ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode t                               ; Prefer tabs over inferior spaces
 inhibit-startup-screen t                         ; Disable start-up screen
 load-prefer-newer t                              ; Prefer the newest version of a file
 mark-ring-max 128                                ; Maximum length of mark ring
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 tab-width 4                                      ; Set width for tabs
 vc-follow-symlinks t                             ; Always follow the symlinks
 view-read-only t)                                ; Always open read only files in view mode


(setq display-line-numbers-type 'relative)              ; Relative line numbers 
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
(show-paren-mode 1)                               ; Show parent paranthesis
(global-visual-line-mode nil)                     ; Turn off that silly visual line mode
(savehist-mode t)                                 ; Save history
(menu-bar-mode -1)                                ; Remove that menubar pls :)
(tool-bar-mode -1)                                ; Remove toolbar too
(scroll-bar-mode -1)                              ; Disable visible scrollbar
(tooltip-mode -1)                                 ; Disable tooltips
(set-fringe-mode 10)                              ; Give some breathing room

(setq initial-scratch-message
 " 




















                                                             ███████╗███╗   ███╗ █████╗  ██████╗███████╗
                                                             ██╔════╝████╗ ████║██╔══██╗██╔════╝██╔════╝
                                                             █████╗  ██╔████╔██║███████║██║     ███████╗
                                                             ██╔══╝  ██║╚██╔╝██║██╔══██║██║     ╚════██║
                                                             ███████╗██║ ╚═╝ ██║██║  ██║╚██████╗███████║
                                                             ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝

 "                                           
  )

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ; scroll window under mouse
(setq scroll-step 1)                                ; keyboard scroll one line at a time

(dolist (mode '(org-mode-hook
                prog-mode-hook
                text-mode
                conf-mode))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq create-lockfiles nil
      make-backup-files nil
      ;; But in case the user does enable it, some sensible defaults:
      version-control t     ; number each backup file
      backup-by-copying t   ; instead of renaming current file (clobbers links)
      delete-old-versions t ; clean up after itself
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(setq default-frame-alist '((undecorated . t)))

(set-frame-parameter (selected-frame) 'alpha '(90 . 90))
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

(load "/home/mthich/.config/emacs/lisp/funcs.el")
(load "/home/mthich/.config/emacs/lisp/var.el")

(setq trash-directory (concat mt/home ".Trash"))
(setq delete-by-moving-to-trash t)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package nyan-mode 
  :init (nyan-mode) 
  :config (setq nyan-wavy-trail nil))

(use-package emojify
  :config
  (when (member "Noto Color Emoji" (font-family-list))
    (set-fontset-font
     t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))
  (setq emojify-display-style 'unicode)
  (setq emojify-emoji-styles '(unicode))
  (bind-key* (kbd "C-c e") #'emojify-insert-emoji)) ; override binding in any mode

(use-package evil
  :init
  (setq evil-want-keybinding nil) ;; load Evil keybindings in other modes
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-mode-line-format nil)
  :config
  ;; ----- Keybindings
  (define-key evil-motion-state-map "/" 'swiper)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)


  ;; ----- Setting cursor colors
  (setq evil-emacs-state-cursor    '("#649bce" box))
  (setq evil-normal-state-cursor   '("#d9a871" box))
  (setq evil-operator-state-cursor '("#ebcb8b" hollow))
  (setq evil-visual-state-cursor   '("#677691" box))
  (setq evil-insert-state-cursor   '("#eb998b" (bar . 2)))
  (setq evil-replace-state-cursor  '("#eb998b" hbar))
  (setq evil-motion-state-cursor   '("#ad8beb" box))

  ;; ----- Redo Functionality
  (evil-set-undo-system 'undo-tree)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

(use-package hide-mode-line
  :commands (hide-mode-line-mode))

(use-package doom-modeline
  :config
  (doom-modeline-mode)
  (setq doom-modeline-enable-word-count nil
        doom-modeline-buffer-encoding nil
        doom-modeline-project-detection 'file-name
        doom-modeline-highlight-modified-buffer-name t

        ;; Icons ---
        doom-modeline-modal nil
        doom-modeline-icon nil ; Enable/disable all icons
        doom-modeline-modal-icon nil ;; Icon for Evil mode
        doom-modeline-major-mode-icon nil
        doom-modeline-major-mode-color-icon nil
        doom-modeline-buffer-state-icon nil

        doom-modeline-bar-width 3))

(set-face-attribute 'default t :height 100 :weight 'medium)
(set-face-attribute 'default t :font "Source Code Pro")

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Code Pro" :height 100 :weight medium))))
 '(fixed-pitch ((t ( :family "Source Code Pro" :height 100)))))

(use-package doom-themes
  :config
  (load-theme 'doom-spacegrey t))

(use-package visual-fill-column
  :defer t
  :config
  (setq visual-fill-column-center-text t)
  (setq visual-fill-column-width 80)
  (setq visual-fill-column-center-text t))

(use-package writeroom-mode
  :defer t
  :config
  (setq writeroom-maximize-window nil
        writeroom-mode-line nil
        writeroom-global-effects nil ;; No need to have Writeroom do any of that silly stuff
        writeroom-extra-line-spacing 3) 
  (setq writeroom-width visual-fill-column-width)
  )

(use-package general)

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

"f" '(counsel-find-file :which-key "find file")
"r" '(counsel-recentf :which-key "recent files")
"TAB" '(switch-to-prev-buffer :which-key "previous buffer")
"SPC" '(counsel-M-x :which-key "M-x")
"C-c" '(save-buffers-kill-terminal :which-key "quit emacs")
"c" '(org-capture :which-key "org-capture")
"u" '(universal-argument :which-key "universal-argument")
"z" '(repeat :which-key "repeat")
"C-d" '(dired-jump :which-key "dired jump")
"C-b" '(counsel-bookmark :which-key "bookmarks")
"C-o" '(org-agenda :which-key "org agenda")

;; "Applications"
"a" '(nil :which-key "applications")
"ao" '(org-agenda :which-key "org-agenda")
;; "am" '(mu4e :which-key "mu4e") ; I wanna get this setup up so bad >.<
;; "aC" '(calc :which-key "calc")

"ad" '(dired :which-key "dired")
"a C-d" '(dired-jump :which-key "dired jump")

"b" '(nil :which-key "buffer")
"bb" '(counsel-switch-buffer :which-key "switch buffers")
"bd" '(evil-delete-buffer :which-key "delete buffer")

;; Files
"f" '(nil :which-key "files")
"fb" '(counsel-bookmark :which-key "bookmarks")
"ff" '(counsel-find-file :which-key "find file")
"fr" '(counsel-recentf :which-key "recent files")
"fR" '(rename-file :which-key "rename file")
"fs" '(save-buffer :which-key "save buffer")
"fS" '(evil-write-all :which-key "save all buffers")

;; Help/emacs
"h" '(nil :which-key "help/emacs")

"hv" '(counsel-describe-variable :which-key "des. variable")
"hb" '(counsel-descbinds :which-key "des. bindings")
"hM" '(describe-mode :which-key "des. mode")
"hf" '(counsel-describe-function :which-key "des. func")
"hF" '(counsel-describe-face :which-key "des. face")
"hk" '(describe-key :which-key "des. key")

"hm" '(nil :which-key "switch mode")
"hme" '(emacs-lisp-mode :which-key "elisp mode")
"hmo" '(org-mode :which-key "org mode")
"hmt" '(text-mode :which-key "text mode")

"hp" '(nil :which-key "packages")
"hpr" 'package-refresh-contents
"hpi" 'package-install
"hpd" 'package-delete

;; Toggles
"t" '(nil :which-key "toggles")
"tt" '(toggle-truncate-lines :which-key "truncate lines")
"tv" '(visual-line-mode :which-key "visual line mode")
"tn" '(display-line-numbers-mode :which-key "display line numbers")
"tR" '(read-only-mode :which-key "read only mode")
"tw" '(writeroom-mode :which-key "writeroom mode")
"tm" '(hide-mode-line-mode :which-key "hide modeline mode")
"tM" '(toggle-frame-maximized :which-key "toggle maximized")
"tF" '(toggle-frame-fullscreen :which-key "toggle fullscreen")

"w" '(nil :which-key "window")
"wm" '(jib/toggle-maximize-buffer :which-key "maximize buffer")
"wN" '(make-frame :which-key "make frame")
"wd" '(evil-window-delete :which-key "delete window")
"wD" '(delete-other-windows :which-key "delete other windows")
"w-" '(jib/split-window-vertically-and-switch :which-key "split below")
"w/" '(jib/split-window-horizontally-and-switch :which-key "split right")
"w{" '(enlarge-window-horizontally :which-key "expand horizon")
"w}" '(shrink-window-horizontally :which-key "shrink horizon")
"w+" '(balance-windows :which-key "balance windows")
"w^" '(enlarge-window :which-key "enlarge verizon")
"wl" '(evil-window-right :which-key "evil-window-right")
"wh" '(evil-window-left :which-key "evil-window-left")
"wj" '(evil-window-down :which-key "evil-window-down")
"wk" '(evil-window-up :which-key "evil-window-up")
"wz" '(text-scale-adjust :which-key "text zoom")

)

(general-def
  :keymaps 'override
  ;"C-g" 'evil-force-normal-state
  )

;; Insert keymaps
(general-def
  :states '(insert)
  "C-a" 'evil-beginning-of-visual-line
  "C-e" 'evil-end-of-visual-line
  "C-S-a" 'evil-beginning-of-line
  "C-S-e" 'evil-end-of-line
  "C-n" 'evil-next-visual-line
  "C-p" 'evil-previous-visual-line
  "C-y" 'yank
  "C-d" 'delete-char
  "C-g" 'evil-normal-state

  ;; Emacs ---
  "C-x C-m" 'counsel-M-x

  ;; Utility ---
  "C-c c" 'org-capture
  "C-c a" 'org-agenda
  "C-s" 'swiper
  )

;; Insert keymaps
(general-def
  :states '(normal)
  "$" 'evil-end-of-visual-line
  "0" 'evil-beginning-of-visual-line
  )

(defun duplicate-line()
    (interactive)
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank))

(global-set-key (kbd "C-c d") 'duplicate-line)

(global-set-key "\C-x\C-m" 'execute-extended-command)

(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-extra-directories nil) ;; Hides . and .. directories
  (setq ivy-initial-inputs-alist nil) ;; Removes the ^ in ivy searches
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :general
  (general-define-key
   ;; Also put in ivy-switch-buffer-map b/c otherwise switch buffer map overrides and C-k kills buffers
   :keymaps '(ivy-minibuffer-map ivy-switch-buffer-map)
   "S-SPC" 'nil
   "C-SPC" 'ivy-restrict-to-matches ;; Default is S-SPC, changed this b/c sometimes I accidentally hit S-SPC
   ;; C-j and C-k to move up/down in Ivy
   ;; I'm not sure if this is redundant but it's whatever
   "C-k" 'ivy-previous-line
   "C-j" 'ivy-next-line)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  (ivy-mode 1)
  )

(use-package ivy-rich
 :init
 (setq ivy-rich-path-style 'abbrev)
 (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-x b" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (counsel-mode 1))

(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode))

(use-package org
   :defer t
   :hook (org-mode . dw/org-mode-setup)

:config
(setq

org-ellipsis " ▾"

;; Keywords
org-todo-keywords
'((sequence "TODO" "PROG" "|" "DONE" "CANCELLED"))

;; Faces
org-todo-keyword-faces
'(("PROG" . (:foreground "red" :weight bold))
  ("DONE" . (:foreground "gray" :weight bold))
  ("CANCELLED" . (:foreground "black" :weight bold)))

;; Source Fontify
org-src-fontify-natively t

;; Quote and Verse Blocks
org-fontify-quote-and-verse-blocks t

;; Org Tab Behaviors
org-src-tab-acts-natively t

;; Source Code indentation
org-edit-src-content-indentation 2

;; Block Startup
org-hide-block-startup nil

;; Org Indentation
org-src-preserve-indentation nil

;; Folded Org Headers
org-startup-folded 'content

;; Seperator Lines
org-cycle-separator-lines 2

;; Inline Images
org-startup-with-inline-images t

;; Emphasis Markers
org-hide-emphasis-markers t

;; Show only timer from current clock session in modeline
org-clock-mode-line-total 'current
org-clock-clocked-in-display 'both

;; Org Agenda Column View
org-agenda-overriding-columns-format
"%TODO %80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM" 

org-global-properties
(quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))


;; CLOCKING-----
;; Clock out when moving task to a done state
org-clock-out-when-done t
;; Change tasks to NEXT when clocking in
org-clock-in-switch-to-state "PROG"

)

(use-package evil-org
  :diminish evil-org-mode
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda () (evil-org-set-key-theme))))

(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(general-define-key
 :prefix ","
 :states 'motion
 :keymaps '(org-mode-map)
 "" nil
 "A" '(org-archive-subtree-default :which-key "org-archive")
 "a" '(org-agenda :which-key "org agenda")
 "6" '(org-sort :which-key "sort")
 "c" '(org-capture :which-key "org-capture")
 "s" '(org-schedule :which-key "schedule")
 "S" '(jib/org-schedule-tomorrow :which-key "schedule tmrw")
 "d" '(org-deadline :which-key "deadline")
 "g" '(counsel-org-goto :which-key "goto heading")
 ":" '(counsel-org-tag :which-key "set tags")
 "p" '(org-set-property :which-key "set property")
 "," '(org-todo :which-key "toggle TODO state")
 "e" '(org-export-dispatch :which-key "export org")
 "." '(org-toggle-narrow-to-subtree :which-key "toggle narrow to subtree")

 "1" '(org-toggle-link-display :which-key "toggle link display")
 "2" '(org-toggle-inline-images :which-key "toggle images")

 ;; insert
 "i" '(nil :which-key "insert")

 "il" '(org-insert-link :which-key "org-insert-link")
 "iL" '(counsel-org-link :which-key "counsel-org-link")

 "is" '(nil :which-key "insert stamp")
 "iss" '((lambda () (interactive) (call-interactively (org-time-stamp-inactive))) :which-key "org-time-stamp-inactive")
 "isS" '((lambda () (interactive) (call-interactively (org-time-stamp nil))) :which-key "org-time-stamp")

 ;; clocking
 "c" '(nil :which-key "clocking")
 "ci" '(org-clock-in :which-key "clock in")
 "co" '(org-clock-out :which-key "clock out")
 "cj" '(org-clock-goto :which-key "jump to clock")
 )

(general-define-key
 :prefix ","
 :states 'motion
 :keymaps '(org-agenda-mode-map)
 "" nil
 "a" '(org-agenda :which-key "org agenda")
 "c" '(org-capture :which-key "org-capture")
 "d" '(org-agenda-deadline :which-key "deadline")
 "s" '(org-agenda-schedule :which-key "schedule") 
 "," '(org-agenda-deadline :which-key "deadline") ;; quick access
 "t" '(org-agenda-set-tags :which-key "set tags")
 ;; clocking
 "c" '(nil :which-key "clocking")
 "ci" '(org-agenda-clock-in :which-key "clock in")
 "co" '(org-agenda-clock-out :which-key "clock out")
 "cj" '(org-clock-goto :which-key "jump to clock")
 )

(evil-define-key 'motion org-agenda-mode-map
  (kbd "f") 'org-agenda-later
  (kbd "b") 'org-agenda-earlier)

;; Removes that annoying bookmark for most recent bookmark (hopefully)
(setq org-bookmark-names-plist nil)

(setq org-capture-templates '(

("t" "Todo" entry (file+headline "/home/mthich/.config/emacs/org/refile.org"  "Tasks")
 "* TODO  %?\n ")

("n" "Notes" entry (file+headline "/home/mthich/.config/emacs/org/refile.org" "Notes")
"* %?  \n ")

))

; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))

; Use full outline paths for refile targets
(setq org-refile-use-outline-path nil)

(require 'org-indent)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 )

(require 'org-tempo)

(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

;; Prettifying src blocks
(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
                                       ("#+END_SRC" . "†")
                                       ("#+begin_src" . "†")
                                       ("#+end_src" . "†")
                                       (">=" . "≥")
                                       ("=>" . "⇨")))

(setq prettify-symbols-unprettify-at-point 'right-edge)
(add-hook 'org-mode-hook 'prettify-symbols-mode)

)

;; Only show upcoming deadlines for the next X days. By default it shows
;; 14 days into the future, which seems excessive.
(setq org-deadline-warning-days 3)
;; If something is done, don't show its deadline
(setq org-agenda-skip-deadline-if-done t)
;; If something is done, don't show when it's scheduled for
(setq org-agenda-skip-scheduled-if-done t)
;; If something is scheduled, don't tell me it is due soon
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)

;; use AM-PM and not 24-hour time
(setq org-agenda-timegrid-use-ampm t)

(setq org-agenda-block-separator ?-)

(setq org-agenda-custom-commands
      `(("u" "Daily agenda and top priority tasks"
         ((tags-todo "*"
                     ((org-agenda-skip-function '(org-agenda-skip-if nil '(timestamp)))
                      (org-agenda-skip-function
                       `(org-agenda-skip-entry-if
                         'notregexp ,(format "\\[#%s\\]" (char-to-string org-priority-highest))))
                      (org-agenda-block-separator nil)
                      (org-agenda-overriding-header "Tasks without a date")))

          (agenda "" ((org-agenda-span 1)
                      (org-deadline-warning-days 0)
                      (org-agenda-block-separator nil)
                      (org-scheduled-past-days 0)
                      (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
                      (org-agenda-format-date "%A %-e %B %Y")
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "\nToday's agenda")))

          (agenda "" ((org-agenda-start-on-weekday nil)
                      (org-agenda-start-day "+1d")
                      (org-agenda-span 3)
                      (org-deadline-warning-days 0)
                      (org-agenda-block-separator nil)
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "\nNext three days")))

          (agenda "" ((org-agenda-time-grid nil)
                      (org-agenda-start-on-weekday nil)
                      (org-agenda-start-day "+4d")
                      (org-agenda-span 14)
                      (org-agenda-show-all-dates nil)
                      (org-deadline-warning-days 0)
                      (org-agenda-block-separator nil)
                      (org-agenda-entry-types '(:deadline))
                      (org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "\nUpcoming deadlines (+14d)")))

          ))

         ("t" "Daily agenda"
          ((agenda "" ((org-agenda-span 1)
                       (org-deadline-warning-days 0)
                       (org-agenda-block-separator nil)
                       (org-scheduled-past-days 0)
                       (org-agenda-day-face-function (lambda (date) 'org-agenda-date))
                       (org-agenda-format-date "%A %-e %B %Y")
                       (org-agenda-overriding-header "Today's agenda")))

           ))
         ))

(use-package latex ;; This is a weird one. Package is auctex but needs to be managed like this.
  :ensure nil
  :defer t
  :init
  (setq TeX-parse-self t ; parse on load
        TeX-auto-save t  ; parse on save
        ;; Use directories in a hidden away folder for AUCTeX files.
        TeX-auto-local (concat user-emacs-directory "auctex/auto/")
        TeX-style-local (concat user-emacs-directory "auctex/style/")

        TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex

        TeX-show-compilation nil

        ;; Don't start the Emacs server when correlating sources.
        TeX-source-correlate-start-server nil

        ;; Automatically insert braces after sub/superscript in `LaTeX-math-mode'.
        TeX-electric-sub-and-superscript t
        ;; Just save, don't ask before each compilation.
        TeX-save-query nil)

  :general
  (general-define-key
   :prefix ","
   :states 'normal
   :keymaps 'LaTeX-mode-map
   "" nil
   "a" '(TeX-command-run-all :which-key "TeX run all")
   "c" '(TeX-command-master :which-key "TeX-command-master")
   "e" '(LaTeX-environment :which-key "Insert environment")
   "s" '(LaTeX-section :which-key "Insert section")
   "m" '(TeX-insert-macro :which-key "Insert macro")
   )

  )

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer) ;; Standard way
(setq org-latex-listings 't) ;; Enable using listings for code highlighting in export

(use-package evil-tex)
(add-hook 'LaTeX-mode-hook #'evil-tex-mode)

(use-package pdf-tools
  :defer t
  :pin manual
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :init
  (evil-set-initial-state 'pdf-view-mode 'normal)
  :config
  (pdf-loader-install)
  (setq-default pdf-view-display-size 'fit-height)
  (setq pdf-view-continuous t) ;; Makes it so scrolling down to the bottom/top of a page switches to the next page
  (setq pdf-view-midnight-colors '("#ffffff" . "#121212" )) ;; I use midnight mode as dark mode, dark mode doesn't seem to work
  :general
  (general-define-key :states 'motion :keymaps 'pdf-view-mode-map
                      "H" 'pdf-view-fit-height-to-window
                      "0" 'pdf-view-fit-height-to-window
                      "W" 'pdf-view-fit-width-to-window
                      "C-s" 'isearch-forward
                      )
  )

;; Use pdf-tools to open PDF files
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;; Update PDF buffers after successful LaTeX runs
(add-hook 'TeX-after-compilation-finished-functions
           #'TeX-revert-document-buffer)

(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
               "\\documentclass{article}
           [NO-DEFAULT-PACKAGES]
           [PACKAGES]
           [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(use-package org-roam

:custom
(org-roam-directory (concat mt/roam))

(org-roam-completion-everywhere t)

(org-roam-capture-templates '(

("d" "default" plain
 "%?"
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)

("b" "book notes" plain (file "/home/mthich/.config/emacs/org/book_template.org")
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)

("c" "class" plain (file "/home/mthich/.config/emacs/org/class_template.org")
 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)

))

:bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       ("C-c n I" . org-roam-node-insert-immediate)

       :map org-mode-map
       ("C-M-i" . completion-at-point))
:config
(org-roam-setup)
(org-roam-db-autosync-mode)

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit
  :commands (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))
