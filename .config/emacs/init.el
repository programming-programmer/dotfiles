(require 'package)

(package-initialize)
(org-babel-load-file "~/.config/emacs/config.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" default))
 '(org-agenda-files
   '("~/Notes/watchlist.org" "/home/undefined_user/Notes/work.org" "/home/undefined_user/Notes/personal.org" "/home/undefined_user/Notes/refile.org"))
 '(package-selected-packages
   '(langtool ivy-postframe ivy-posframe git-auto-commit-mode yasnippet dired-x deft gcmh evil-tex auctex evil-org org-fragtog org-appear org-transclusion org-superstar org-roam-ui org-roam org-pomodoro which-key writeroom-mode websocket use-package undo-fu super-save simple-httpd rainbow-delimiters org nyan-mode magit ivy-rich hide-mode-line general evil-collection emojify emacsql doom-themes doom-modeline diminish counsel alert))
 '(warning-suppress-log-types '((comp) (use-package) (use-package)))
 '(warning-suppress-types '((use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Source Code Pro" :height 100))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(variable-pitch ((t (:family "Source Code Pro" :height 100 :weight medium)))))
