;; mt-variables.el

;; File/directory locations --------
(defvar mt/home (concat (getenv "HOME") "/") "My home directory.")
(defvar mt/org-notes "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes" "Org Notes directory")
(defvar mt/refile "/mnt/chromeos/GoogleDrive/MyDrive/SchoolDocuments/Notes" "Org roam directory")

(setq bookmark-default-file (concat mt/home ".cache/emacs/bookmarks"))

(provide 'mt-variables)
;;; mt-variables.el ends here
