(require 'package)

(package-initialize)
(org-babel-load-file "~/.config/emacs/config.org")
(put 'dired-find-alternate-file 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("~/Notes/watchlist.org" "/home/undefined_user/Notes/work.org" "/home/undefined_user/Notes/personal.org" "/home/undefined_user/Notes/FALL_2023/POLS_C101/pols_c101.org" "/home/undefined_user/Notes/FALL_2023/MATH_C151/math_c151.org" "/home/undefined_user/Notes/FALL_2023/ENGL_C102/engl_c102.org" "/home/undefined_user/Notes/refile.org" "/home/undefined_user/Notes/FALL_2023/Drivers_ED/driver_s_education.org"))
 '(package-selected-packages
   '(evil-tex auctex evil-org org-fragtog org-appear org-transclusion org-superstar org-roam-ui org-roam org-pomodoro counsel ivy-rich writeroom-mode which-key undo-fu super-save rainbow-delimiters openwith nyan-mode magit langtool hide-mode-line git-auto-commit-mode general flyspell-correct-ivy evil-collection doom-themes doom-modeline deft)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Source Code Pro" :height 200))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.3))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.2))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.1))))
 '(variable-pitch ((t (:family "Source Code Pro" :weight medium)))))
