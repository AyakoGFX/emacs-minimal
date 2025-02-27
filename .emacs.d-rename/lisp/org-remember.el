;;; org-remember.el --- Quick note taking with timestamps in org format -*- lexical-binding: t -*-

;; Copyright (C) 2024 Your Name
;; Author: Your Name <your.email@example.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1") (org "9.3"))
;; Keywords: notes, remember, org
;; URL: https://github.com/yourusername/org-remember

;;; Commentary:
;; A simple package to quickly capture timestamped notes in an org file.
;; All notes are stored in remember.org in your Emacs user directory.
;;
;; Usage:
;; M-x org-remember-capture   ; to capture a new note
;; M-x org-remember-view      ; to view all notes
;;
;; Or use the key bindings when org-remember-mode is enabled:
;; C-c n r                    ; org-remember-capture
;; C-c n v                    ; org-remember-view
;; C-c n s                    ; org-remember-search

;;; Code:

(require 'org)

(defgroup org-remember nil
  "Quick note taking with timestamps."
  :group 'org
  :prefix "org-remember-")

(defcustom org-remember-file
  (expand-file-name "remember.org" user-emacs-directory)
  "File where remembered notes are stored.
By default, this is 'remember.org' in your Emacs user directory."
  :type 'file
  :group 'org-remember)

;; (defcustom org-remember-time-format "[%Y-%m-%d %a %I:%M %p]"
(defcustom org-remember-time-format "[%Y-%m-%d %a %I:%M:%S %p]"
  "Format for timestamps in remembered notes.
Uses 12-hour clock with AM/PM indicator.
See `format-time-string' for possible formats."
  :type 'string
  :group 'org-remember)

(defcustom org-remember-capture-template "* %t\n%i\n"
  "Template for new entries.
%t will be replaced with timestamp
%i will be replaced with input text."
  :type 'string
  :group 'org-remember)

;;;###autoload
;;(defun org-remember-capture ()
;;  "Capture a new remembered note with timestamp."
;;  (interactive)
;;  (let ((note (read-string "Remember: ")))
;;    (with-current-buffer (find-file-noselect org-remember-file)
;;      (goto-char (point-max))
;;      (unless (bolp) (insert "\n"))
;;      (insert (replace-regexp-in-string
;;               "%t" (format-time-string org-remember-time-format)
;;               (replace-regexp-in-string
;;                "%i" note
;;                org-remember-capture-template)))
;;      (save-buffer))
;;    (message "Remembered in %s (in your Emacs directory)" 
;;             (file-name-nondirectory org-remember-file))))


(defun org-remember-capture ()
  "Capture a new remembered note in a pop-up buffer."
  (interactive)
  (let ((buffer (get-buffer-create "*Org Remember*")))
    (with-current-buffer buffer
      (erase-buffer)
      (insert (format-time-string org-remember-time-format) "\n\n")
      (org-mode)
      (use-local-map (let ((map (copy-keymap org-mode-map)))
                       (define-key map (kbd "C-c C-c") #'org-remember-save)
                       (define-key map (kbd "C-c C-k") #'org-remember-cancel)
                       map)))
    (pop-to-buffer buffer '(display-buffer-pop-up-window))))

(defun org-remember-save ()
  "Save the remembered note and close the capture buffer."
  (interactive)
  (let ((note (buffer-string)))
    (with-current-buffer (find-file-noselect org-remember-file)
      (goto-char (point-max))
      (unless (bolp) (insert "\n"))
      (insert "* " note "\n")
      (save-buffer)))
  (quit-window t)
  (message "Note saved in %s" (file-name-nondirectory org-remember-file)))

(defun org-remember-cancel ()
  "Cancel note-taking and close the buffer."
  (interactive)
  (quit-window t)
  (message "Note canceled."))



;;;###autoload
(defun org-remember-view ()
  "View remembered notes."
  (interactive)
  (find-file org-remember-file)
  (message "Viewing remember.org from your Emacs directory (%s)" 
           user-emacs-directory))

;;;###autoload
(defun org-remember-ensure-file ()
  "Ensure the org-remember file exists and has a title."
  (unless (file-exists-p org-remember-file)
    (with-current-buffer (find-file-noselect org-remember-file)
      (insert "#+TITLE: Remembered Notes\n")
      (insert "#+DATE: Created on " (format-time-string "%Y-%m-%d") "\n")
      (insert "#+STARTUP: showeverything\n\n")
      (save-buffer))))

(defun org-remember-search ()
  "Search through remembered notes using completing-read."
  (interactive)
  (let ((headlines '()))
    (with-current-buffer (find-file-noselect org-remember-file)
      (org-map-entries
       (lambda ()
         (push (cons (org-get-heading t t) (point)) headlines))))
    (let ((selected (completing-read "Find note: " 
                                   (mapcar #'car headlines))))
      (find-file org-remember-file)
      (goto-char (cdr (assoc selected headlines)))
      (org-show-entry))))

;;;###autoload
(define-minor-mode org-remember-mode
  "Minor mode for org-remember.
\\{org-remember-mode-map}"
  :lighter " OrgRem"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c n r") #'org-remember-capture)
            (define-key map (kbd "C-c n v") #'org-remember-view)
            (define-key map (kbd "C-c n s") #'org-remember-search)
            map)
  (org-remember-ensure-file))

(provide 'org-remember)

;;; org-remember.el ends here
