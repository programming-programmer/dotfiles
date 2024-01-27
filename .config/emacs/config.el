(defvar mt/home (concat (getenv "HOME") "/") "My home directory.")
(defvar mt/org-notes "/home/undefined_user/Notes" "Org Notes directory")

(setq bookmark-default-file (concat mt/home ".cache/emacs/bookmarks"))

(setq gc-cons-threshold (* 50 1000 1000) 
      gc-cons-percentage 0.6)

(setq gcmh-idle-delay 'auto  ; default is 15s
      gcmh-auto-idle-delay-factor 10
      gcmh-high-cons-threshold (* 16 1024 1024))  ; 16mb

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-percentage 0.1))) ;; Default value for `gc-cons-percentage'

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(require 'use-package)
(setq use-package-always-ensure t)

(setq-default
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 inhibit-splash-screen t                          ; No splash screen
 sentence-end-double-space nil                    ; Double space after a period!? Inhumane!
 cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
 initial-scratch-message "Welcome to the Church of Emacs!!\n     ^\nʕ•́ᴥ•̀ʔっ"
 fill-column 100                                  ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode t                               ; Prefer tabs over inferior spaces
 inhibit-startup-screen t                         ; Disable start-up screen
 load-prefer-newer t                              ; Prefer the newest version of a file
 mark-ring-max 128                                ; Maximum length of mark ring
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 tab-width 4                                      ; Set width for tabs
 vc-follow-symlinks t                             ; Always follow the symlinks
 view-read-only t                                 ; Always open read only files in view mode
 display-time-default-load-average nil
 display-line-numbers-type 'visual
 display-time-mail-string ""
 warning-minimum-level :emergency
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/qutebrowser")

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
(display-line-numbers-mode -1)                    ; No line numbers
(display-time-mode 1)                             ; Display time in cwispy modeline

(setq org-link-frame-setup
      '((vm . vm-visit-folder-other-frame)
        (vm-imap . vm-visit-imap-folder-other-frame)
        (gnus . org-gnus-no-new-news)
        (file . find-file)
        (wl . wl-other-frame)))

(set-frame-parameter nil 'alpha-background 85)

(add-to-list 'default-frame-alist '(alpha-background . 85))

(use-package git-auto-commit-mode
  :config
  (setq
   gac-ask-for-summary-p nil
   gac-automatically-add-new-files-p t
   gac-automatically-push-p t
   gac-silent-message-p t))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ; one line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ; scroll window under mouse
(setq scroll-step 1)                                ; keyboard scroll one line at a time

(setq create-lockfiles nil
      make-backup-files nil
      ;; But in case the user does enable it, some sensible defaults:
      version-control t     ; number each backup file
      backup-by-copying t   ; instead of renaming current file (clobbers links)
      delete-old-versions t ; clean up after itself
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))

(load "/home/undefined_user/.config/emacs/lisp/funcs.el")

(setq trash-directory (concat mt/home ".Trash"))
(setq delete-by-moving-to-trash t)

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

(use-package which-key
  :init (which-key-mode)
  :defer 2
  :config
  (setq which-key-idle-delay 0.4))

(use-package super-save
  :diminish super-save-mode
  :defer 2
  :config
  (setq super-save-auto-save-when-idle t
        super-save-idle-duration 5 ;; after 5 seconds of not typing autosave
        super-save-triggers ;; Functions after which buffers are saved (switching window, for example)
        '(evil-window-next evil-window-prev balance-windows other-window next-buffer previous-buffer)
        super-save-max-buffer-size 10000000)
  (super-save-mode +1))

;; After super-save autosaves, wait __ seconds and then clear the buffer. I don't like
;; the save message just sitting in the echo area.
(defun jib-clear-echo-area-timer ()
  (run-at-time "2 sec" nil (lambda () (message " "))))
(advice-add 'super-save-command :after 'jib-clear-echo-area-timer)

(setq register-preview-delay 0) ;; Show registers ASAP

(set-register ?c (cons 'file (concat user-emacs-directory "config.org")))

(set-register ?1 (cons 'file (concat mt/org-notes "/refile.org")))
(set-register ?2 (cons 'file (concat mt/org-notes "/personal.org")))
(set-register ?3 (cons 'file (concat mt/org-notes "/work.org")))
(set-register ?4 (cons 'file (concat mt/org-notes "/watchlist.org")))

;; Classes
(set-register ?F (cons 'file (concat mt/org-notes "/FALL_2023/fall_2023.org")))
(set-register ?d (cons 'file (concat mt/org-notes "/FALL_2023/Drivers_ED/driver_s_education.org")))
(set-register ?e (cons 'file (concat mt/org-notes "/FALL_2023/ENGL_C102/engl_c102.org")))
(set-register ?m (cons 'file (concat mt/org-notes "/FALL_2023/MATH_C151/math_c151.org")))
(set-register ?p (cons 'file (concat mt/org-notes "/FALL_2023/POLS_C101/pols_c101.org")))

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package magit
  :commands (magit-status)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package openwith
  :defer t
  :config
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv"))
               "mpv"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf"))
               "zathura"
               '(file))))
  (openwith-mode))

(set-face-attribute 'default t :weight 'medium :height 100 :font "Source Code Pro")

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Source Code Pro" :weight medium))))
 '(fixed-pitch ((t ( :family "Source Code Pro" :height 200)))))

(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-night t))

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

(use-package doom-modeline
  :config
  (doom-modeline-mode)
  (setq doom-modeline-project-detection 'file-name
        doom-modeline-highlight-modified-buffer-name t
        ;; Icons ---
        doom-modeline-modal t
        doom-modeline-icon nil
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon nil
        doom-modeline-unicode-fallback nil
        doom-modeline-bar-width 3))

(doom-modeline-def-modeline 'minimal
  '(bar modals buffer-info buffer-position)
  '(time major-mode))
(doom-modeline-set-modeline 'minimal t)

(use-package hide-mode-line
  :defer t
  :commands (hide-mode-line-mode))

(use-package nyan-mode 
  :init (nyan-mode)
  :config
  (setq nyan-wavy-trail nil))

(use-package general)

(use-package evil
  :init
  (setq evil-want-keybinding nil) ;; load Evil keybindings in other modes
  (setq evil-want-fine-undo t)
  (setq evil-want-Y-yank-to-eol t)
  (setq evil-mode-line-format nil)
  (setq evil-disable-insert-state-bindings t)

  :config
  (define-key evil-motion-state-map "/" 'swiper)
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (global-set-key [remap evil-quit] 'kill-buffer-and-window)

  (setq evil-emacs-state-cursor    '("#649bce" box))
  (setq evil-normal-state-cursor   '("#d9a871" box))
  (setq evil-operator-state-cursor '("#ebcb8b" hollow))
  (setq evil-visual-state-cursor   '("#677691" box))
  (setq evil-insert-state-cursor   '("#eb998b" box))
  (setq evil-replace-state-cursor  '("#eb998b" hbar))
  (setq evil-motion-state-cursor   '("#ad8beb" box))

  (evil-set-undo-system 'undo-fu)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package undo-fu)

(general-define-key
 :states '(normal motion visual)
 :keymaps 'override
 :prefix "SPC"

"." '(counsel-find-file :which-key "find file")
"r" '(counsel-recentf :which-key "recent files")
"TAB" '(switch-to-prev-buffer :which-key "previous buffer")
"SPC" '(counsel-M-x :which-key "M-x")
"RET" '(counsel-bookmark :which-key "bookmarks")
"," '(counsel-switch-buffer :which-key "switch buffers")
"c" '(org-capture :which-key "org-capture")
"z" '(repeat :which-key "repeat")
"j" '(jump-to-register :which-key "jump to register")

"o" '(nil :which-key "open")

"oa" '(org-agenda :which-key "org-agenda")
"oc" '(calendar :which-key "calendar")
"oC" '(calc :which-key "calc")
"o-" '(dired :which-key "dired")
"od" '(dired-jump :which-key "dired jump")
"of" '(make-frame :which-key "new frame")
"oF" '(select-frame-by-name :which-key "select frame")

"b" '(nil :which-key "buffer")

"bb" '(counsel-switch-buffer :which-key "switch buffers")
"bd" '(evil-delete-buffer :which-key "delete buffer")
"bn" '(evil-next-buffer :which-key "next buffer")
"bp" '(previous-buffer :which-key "previous buffer")
"bm" '(bookmark-save :which-key "set bookmark")
"bM" '(bookmark-delete  :which-key "delete bookmark")
"bN" '(evil-buffer-new :which-key "new empty buffer")

"f" '(nil :which-key "files")

"fb" '(counsel-bookmark :which-key "bookmarks")
"fC" '(copy-file :which-key "copy this file")
"fD" '(delete-file :which-key "delete this file")
"ff" '(counsel-find-file :which-key "find file")
"fr" '(counsel-recentf :which-key "recent files")
"fR" '(rename-file :which-key "rename/move file")
"fs" '(save-buffer :which-key "save buffer")
"fS" '(evil-write-all :which-key "save all buffers")
"fl" '(org-babel-load-file :which-key "org-babel load file")

"q" '(nil :which-key "quit/session")

"qd" '(nil :which-key "restart emacs server")
"qf" '(delete-frame :which-key "delete frame")
"qF" '(delete-other-frames :which-key "delete other frames")
"ql" '(recover-session :which-key "restore last session")

"n" '(nil :which-key "notes")

"nc" '(org-clock-in-last :which-key "toggle last org-clock")
"nC" '(org-clock-out :which-key "clock out of current org-clock")
"n C-c" '(org-clock-cancel :which-key "cancel current org-clock")
"no" '(org-clock-goto :which-key "active org-clock")
"np" '(org-pomodoro :which-key "start pomodoro")
"nd" '(deft :which-key "open deft")

"nr" '(nil :which-key "org-roam")
"nrl" '(org-roam-buffer-toggle :which-key "toggle buffer")
"nrf" '(org-roam-node-find :which-key "find node")
"nrc" '(org-roam-capture :which-key "capture node")
"nri" '(org-roam-node-insert :which-key "insert node")
"nrI" '(org-roam-node-insert-immediate :which-key "immediately insert node")

"h" '(nil :which-key "help/emacs")

"h RET" '(info-emacs-manual :which-key "info-emacs-manual")
"h'" '(describe-char :which-key "describe-char")
"h." '(display-local-help :which-key "desplay-local-help")
"h?" '(help-for-help :which-key "help-for-help")
"hC" '(describe-coding-system :which-key "describe-coding-system")
"he" '(view-echo-area-messages :which-key "view-echo-area-messages")
"hf" '(counsel-describe-function :which-key "describe function")
"hF" '(counsel-describe-face :which-key "describe-face")
"hg" '(describe-gnu-project :which-key "describe-gnu-project")
"hi" '(info :which-key "info")
"hv" '(describe-variable :which-key "describe variable")
"hI" '(describe-input-method :which-key "describe-input-method")
"hk" '(describe-key :which-key "describe-key")
"hm" '(describe-mode :which-key "describe-mode")

"hp" '(nil :which-key "packages")
"hpr" '(package-refresh-contents :which-key "refresh packages")
"hpi" '(package-install :which-key "install packages")
"hpd" '(package-delete :which-key "delete package")
"hpD" '(describe-package :which-key "describe package")

"i" '(nil :which-key "insert")

"ie" '(emoji-search :which-key "emoji")
"iu" '(counsel-unicode-char :which-key "unicode")
"iy" '(counsel-yank-pop :which-key "from clipboard")
"ij" '(point-to-register :which-key "insert register")
"ii" '(org-id-get-create :which-key "insert org-id")
"il" '(org-insert-link :which-key "insert link")
"is" '(nil :which-key "insert stamp")
"iss" '((lambda () (interactive) (call-interactively (org-time-stamp-inactive))) :which-key "org-time-stamp-inactive")
"isS" '((lambda () (interactive) (call-interactively (org-time-stamp nil))) :which-key "org-time-stamp")

"t" '(nil :which-key "toggles")
"ty" '(counsel-load-theme 'doom-spacegray :which-key "lighter theme")
"tt" '(toggle-truncate-lines :which-key "truncate lines")
"tv" '(visual-line-mode :which-key "visual line mode")
"tn" '(display-line-numbers-mode :which-key "display line numbers")
"tR" '(read-only-mode :which-key "read only mode")
"tw" '(writeroom-mode :which-key "writeroom mode")
"tm" '(hide-mode-line-mode :which-key "hide modeline mode")

)

(general-def
  :keymaps 'override
  )

;; Insert keymaps
(general-def
  :states '(insert)

  "C-c" 'evil-normal-state

  ;; Emacs ---
  "C-x C-m" 'counsel-M-x

  ;; Utility ---
  "C-s" 'swiper

  "M-k" 'org-metaup
  "M-j" 'org-metadown
  "S-M-l" 'org-shiftmetaright
  "S-M-h" 'org-shiftmetaleft
  "M-l" 'org-metaright
  "M-h" 'org-metaleft

  "<tab>" 'org-cycle
  "TAB" 'org-cycle

  "<S-up>" 'org-increase-number-at-point
  "<S-down>" 'org-decrease-number-at-point

  )

;; Insert keymaps
(general-def
  :states '(normal)
  "$" 'evil-end-of-visual-line
  "0" 'evil-beginning-of-visual-line

  "gf" 'org-open-at-point

  ;;Windows
  "C-w m" '(jib/toggle-maximize-buffer :which-key "maximize window")

  "<S-up>" 'org-increase-number-at-point
  "<S-down>" 'org-decrease-number-at-point

  )

(general-define-key
 :prefix "SPC m"
 :states '(normal visual motion)
 :keymaps '(org-mode-map)
 "" nil
 "A" '(org-archive-subtree-default :which-key "org-archive")
 "g" '(counsel-org-goto :which-key "goto heading")
 ":" '(counsel-org-tag :which-key "set tags")
 "P" '(org-set-property :which-key "set property")
 "E" '(org-export-dispatch :which-key "export org")
 "C-e" '(export-org-email :which-key "export org email")
 "e" '(org-set-effort :which-key "set effort")
 "." '(org-toggle-narrow-to-subtree :which-key "toggle narrow to subtree")

 "s" '(org-schedule :which-key "schedule")
 "S" '(jib/org-schedule-tomorrow :which-key "schedule tmrw")
 "d" '(org-deadline :which-key "deadline")

 "t" '(org-todo :which-key "toggle TODO state")
 "C" '(org-toggle-checkbox :which-key "toggle checkbox")

 "1" '(org-toggle-link-display :which-key "toggle link display")
 "2" '(org-toggle-inline-images :which-key "toggle images")
 "6" '(org-sort :which-key "sort")

 "T" '(nil :which-key "org-transclusion")
 "Ta" '(org-transclusion-add :which-key "add org-transclusion")
 "Tt" '(org-transclusion-mode :which-key "org-transclusion mode")
 )

(general-define-key
 :prefix ","
 :states '(normal motion visual)
 :keymaps '(org-agenda-mode-map)
 "" nil
 "c" '(org-capture :which-key "org-capture")
 "d" '(org-agenda-deadline :which-key "deadline")
 "s" '(org-agenda-schedule :which-key "schedule") 
 "t" '(org-agenda-set-tags :which-key "set tags")

 "c" '(nil :which-key "clocking")
 "ci" '(org-agenda-clock-in :which-key "clock in")
 "co" '(org-agenda-clock-out :which-key "clock out")
 "cj" '(org-clock-goto :which-key "jump to clock")
 )

(evil-define-key 'motion org-agenda-mode-map
  (kbd "f") 'org-agenda-later
  (kbd "b") 'org-agenda-earlier)

(evil-define-key 'normal dired-mode-map
  (kbd "M-RET") 'dired-display-file
  (kbd "h") 'dired-up-directory
  (kbd "l") 'dired-find-alternate-file)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-extra-directories nil) ;; Hides . and .. directories
  (setq ivy-initial-inputs-alist nil) ;; Removes the ^ in ivy searches
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-wrap t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)

  (ivy-mode 1))

(use-package ivy-rich
 :init
 (setq ivy-rich-path-style 'abbrev)
 (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-x b" . 'counsel-switch-buffer))
  :config
  (counsel-mode 1))

(require 'org-indent)

(require 'org-habit)
(setq org-habit-graph-column 60)
(add-to-list 'org-modules 'org-habit)

(use-package org-roam
  :after org
  :config
  (org-roam-setup)
  (setq org-roam-completion-system 'ivy-mode)

  :custom
  (org-roam-directory (concat mt/org-notes))
  (org-roam-completion-everywhere t)

(org-roam-capture-templates '(

("d" "default" plain
 "%?"
 :if-new (file+head "${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)

("s" "school note" plain (file "/home/undefined_user/.config/emacs/org/school_template.org")
 :if-new (file+head "${slug}.org" "#+title: ${title}\n")
 :unnarrowed t)

)))

(defun org-roam-node-insert-immediate (arg &rest args)
  (interactive "P")
  (let ((args (push arg args))
        (org-roam-capture-templates (list (append (car org-roam-capture-templates)
                                                  '(:immediate-finish t)))))
    (apply #'org-roam-node-insert args)))

(use-package org-roam-ui
  :defer t
  )

(use-package org-superstar
  :defer t
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◈" "○" "◉" "○" "◆" "○")))

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src sh"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))

(use-package org-transclusion
  :defer t
  :after org)

(use-package org-appear
  :defer t
  :after org)
(add-hook 'org-mode-hook 'org-appear-mode)

(use-package evil-org
  :diminish evil-org-mode
  :defer t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda () (evil-org-set-key-theme))))

(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(defun dw/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (auto-fill-mode))

(use-package org
  :hook (org-mode . dw/org-mode-setup)
  :config
  (setq
   org-ellipsis " ▾"
   org-src-fontify-natively t
   org-fontify-quote-and-verse-blocks t
   org-src-tab-acts-natively t
   org-edit-src-content-indentation 3
   org-hide-block-startup nil
   org-src-preserve-indentation nil
   org-startup-folded 'content
   org-cycle-separator-lines 2
   org-startup-with-inline-images t
   org-hide-emphasis-markers t
   org-tags-column 0
   org-adapt-indentation nil
   org-indent-indentation-per-level 3
   prettify-symbols-unprettify-at-point 'right-edge

org-todo-keywords
'((sequence "TODO" "PROG" "|" "DONE" "WAITING" "CANCELLED"))

org-todo-keyword-faces
'(("PROG" . (:foreground "dark red" :weight bold))
  ("DONE" . (:foreground "gray" :weight bold))
  ("WAITING" . (:foreground "dark slate gray" :weight bold))
  ("CANCELLED" . (:foreground "dark gray" :weight bold)))

(setq org-archive-location (concat mt/org-notes "archive.org"))

org-agenda-overriding-columns-format
"%TODO %ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM"

org-global-properties
(quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")))

org-clock-mode-line-total 'current ;; Show only timer from current clock session in modeline
org-clock-clocked-in-display 'both
org-clock-out-when-done t
org-clock-in-switch-to-state "PROG"

)

;; Removes that annoying bookmark for most recent bookmark (hopefully) - IT WORKS YAYAYAA!!!!!!!!!
(setq org-bookmark-names-plist nil)

(setq org-capture-templates '(

("t" "Todo" entry (file+headline "/home/undefined_user/Notes/refile.org" "Tasks")
 "* TODO  %?\n ")

("T" "Todo for today" entry (file+headline "/home/undefined_user/Notes/refile.org" "Tasks")
 "* TODO  %?\nDEADLINE: %<<%Y-%m-%d>>")

("n" "Notes" entry (file+headline "/home/undefined_user/Notes/refile.org" "Notes")
"* %?  \n ")

("E" "Errand" entry (file+headline "/home/undefined_user/Notes/personal.org" "Tasks")
 "* TODO  %?\n ")

("w" "To Watchlist")

("wm" "Movie" entry (file+headline "/home/undefined_user/Notes/watchlist.org" "Movies")
 "* TODO  %?\n ")

("ws" "Show / Anime" entry (file+headline "/home/undefined_user/Notes/watchlist.org" "Shows / Anime")
 "* TODO  %?\n ")

("wb" "Book" entry (file+headline "/home/undefined_user/Notes/watchlist.org" "Not Started")
 "** TODO  %?\n ")

))

(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
(setq org-refile-use-outline-path nil)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 )

(setq-default prettify-symbols-alist '(("#+BEGIN_SRC" . "†")
                                       ("#+END_SRC" . "†")
                                       ("#+begin_src" . "†")
                                       ("#+end_src" . "†")
                                       ("=>" . "⇨")))

(add-hook 'org-mode-hook 'prettify-symbols-mode)

)

(setq org-deadline-warning-days 3)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-timegrid-use-ampm t)
(setq org-agenda-block-separator ?-)

(add-hook 'org-agenda-mode-hook
          '(lambda () (hl-line-mode 1))
          'append)
