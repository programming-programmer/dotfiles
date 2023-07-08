;; mt-variables.el

;; File/directory locations --------
(defvar mt/home (concat (getenv "HOME") "/") "My home directory.")
(defvar mt/roam "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes" "Org roam directory")

(setq bookmark-default-file (concat mt/home ".cache/emacs/bookmarks"))

(provide 'mt-variables)
;;; mt-variables.el ends here
