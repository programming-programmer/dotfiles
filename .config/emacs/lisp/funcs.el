;; -*- lexical-binding: t; -*-
;;; 
;;; Functions File
;;;

;; URL: https://github.com/jakebox/.emacs
;; This file is not part of GNU Emacs.

;;;;;;;;;;;;;;;;;;;;;;
;; Window Functions ;;
;;;;;;;;;;;;;;;;;;;;;;
;; from https://gist.github.com/3402786
(defun jib/toggle-maximize-buffer ()
  "Maximize buffer"
  (interactive)
  (if (and (= 1 (length (window-list)))
           (assoc ?_ register-alist))
      (jump-to-register ?_)
    (progn
      (window-configuration-to-register ?_)
      (delete-other-windows))))

;;;;;;;;;;;;;;;;;;;;;;;
;; Files and Buffers ;;
;;;;;;;;;;;;;;;;;;;;;;;
(defun jib/listify (&optional count)
  "Turn the region's (or count = n lines) into an orgmode list by prepending a +."
  (interactive "p")
  (let ((lines (count-lines (region-beginning) (region-end)))) ;; By default grab a region
	(if (> count 1) (setq lines count)) ;; but if there was an argument, override the # of lines
	(save-excursion
	  (if (use-region-p) ;; If there's a region go to the start and deactivate the region
		  (goto-char (region-beginning)) (deactivate-mark))
	  (while (> lines 0) ;; Add "+ " at the beginning of each line
		(beginning-of-line)
		(insert " * ")
		(forward-line)
		(setq lines (1- lines))))))

(defun jib/insert-empty-lines-after-each-line ()
  "Add a blank line after each line in a region."
  (interactive)
  (let ((lines (count-lines (region-beginning) (region-end)))) ;; By default grab a region
	(save-excursion
	  (if (use-region-p) ;; If there's a region go to the start and deactivate the region
		  (goto-char (region-beginning)) (deactivate-mark))
	  (while (> lines 0)
		(end-of-line)
		(open-line 1)
		(next-line 2)
		(setq lines (1- lines))))))

(defun my/revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
;;;;;;;;;;;;;;;;;;
;; Calculations ;;
;;;;;;;;;;;;;;;;;;

(defun jib/time-difference ()
  "Ask for two times/date using `org-read-date' and compute the difference."
  (interactive)
  (message "%s" (ts-human-format-duration ;; Multiply by -1 so first input can be the earlier time
				 (* -1 (ts-difference (ts-parse-org (org-read-date))
									  (ts-parse-org (org-read-date)))))))

(defun jib/return-week-number ()
  (interactive)
  (message "It is week %s of the year." (format-time-string "%U")))

;;;;;;;;;;;;;
;; Orgmode ;;
;;;;;;;;;;;;;

(defun jib/org-copy-link-to-clipboard ()
  "Copy orgmode link to clipboard (simpleclip)."
  (interactive)
  (let ((context (org-element-context)))
	(if (eq (org-element-type context) 'link)
		(simpleclip-set-contents
		 (org-element-property :raw-link context))
	  (user-error "Not a link"))))

(defun jib/org-schedule-tomorrow ()
  "Org Schedule for tomorrow (+1d)."
  (interactive)
  (org-schedule t "+1d"))

(provide 'jib-funcs)
;;; jib-funcs.el ends here
