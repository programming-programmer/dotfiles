(require 'package)

(package-initialize)
(org-babel-load-file "~/.config/emacs/config.org")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#c5c8c6"])
 '(custom-safe-themes
   '("631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "1cae4424345f7fe5225724301ef1a793e610ae5a4e23c023076dc334a9eb940a" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "545ab1a535c913c9214fe5b883046f02982c508815612234140240c129682a68" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "ae426fc51c58ade49774264c17e666ea7f681d8cae62570630539be3d06fd964" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "ce4234c32262924c1d2f43e6b61312634938777071f1129c7cde3ebd4a3028da" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "2f8eadc12bf60b581674a41ddc319a40ed373dd4a7c577933acaff15d2bf7cc6" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" default))
 '(exwm-floating-border-color "#0d0d0d")
 '(fci-rule-color "#5c5e5e")
 '(highlight-tail-colors ((("#2c2e28") . 0) (("#272e30") . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#0d0d0d" "#81a2be"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0d0d0d" "#b5bd68"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0d0d0d" "#5a5b5a"))
 '(objed-cursor-color "#cc6666")
 '(org-agenda-files
   '("~/.config/emacs/org/archive.org" "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes/SUM_2023/ENGL_C101/engl_101.org" "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes/work.org" "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes/personal.org" "/home/mthich/.config/emacs/org/refile.org"))
 '(package-selected-packages
   '(org-alert modus-themes yasnippet evil-tex evil-collection auctex tablist undo-tree calfw-org calfw super-save magit rainbow-delimiters org-roam org-superstar counsel ivy-rich ivy which-key use-package nyan-mode guru-mode emojify doom-themes doom-modeline disable-mouse all-the-icons))
 '(pdf-view-midnight-colors (cons "#c5c8c6" "#1d1f21"))
 '(rustic-ansi-faces
   ["#1d1f21" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#c9b4cf" "#8abeb7" "#c5c8c6"])
 '(send-mail-function 'mailclient-send-it)
 '(vc-annotate-background "#1d1f21")
 '(vc-annotate-color-map
   (list
	(cons 20 "#b5bd68")
	(cons 40 "#c8c06c")
	(cons 60 "#dcc370")
	(cons 80 "#f0c674")
	(cons 100 "#eab56d")
	(cons 120 "#e3a366")
	(cons 140 "#de935f")
	(cons 160 "#d79e84")
	(cons 180 "#d0a9a9")
	(cons 200 "#c9b4cf")
	(cons 220 "#ca9aac")
	(cons 240 "#cb8089")
	(cons 260 "#cc6666")
	(cons 280 "#af6363")
	(cons 300 "#936060")
	(cons 320 "#765d5d")
	(cons 340 "#5c5e5e")
	(cons 360 "#5c5e5e")))
 '(vc-annotate-very-old-color nil)
 '(widget-image-enable nil)
 '(x-underline-at-descent-line t))
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
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button)))))
 '(variable-pitch ((t (:family "Source Code Pro" :height 100 :weight medium)))))
