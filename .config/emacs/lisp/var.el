;; var.el

;; File/directory locations --------
(defvar mt/home (concat (getenv "HOME") "/") "My home directory.")
(defvar mt/org-notes "/home/mthich/Notes" "Org Notes directory")

(setq bookmark-default-file (concat mt/home ".cache/emacs/bookmarks"))

(provide 'var)
;;; var.el ends here
