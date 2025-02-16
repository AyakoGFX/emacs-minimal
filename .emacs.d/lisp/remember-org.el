;;; remember-org.el --- Quick note taking with timestamps in org format -*- lexical-binding: t -*-

;; Copyright (C) 2024 Your Name
;; Author: Your Name <your.email@example.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1") (org "9.3"))
;; Keywords: notes, remember, org
;; URL: https://github.com/yourusername/remember-org

;;; Commentary:
;; A simple package to quickly capture timestamped notes in an org file.
;; Similar to the remember CLI tool but integrated with Emacs and Org mode.
;; All notes are stored in remember.org in your Emacs user directory.
;;
;; Usage:
;; M-x remember-org-capture   ; to capture a new note
;; M-x remember-org-view      ; to view all notes
;;
;; Or use the key bindings when remember-org-mode is enabled:
;; C-c r c                    ; remember-org-capture
;; C-c r v                    ; remember-org-view

;;; Code:

(require 'org)

(defgroup remember-org nil
  "Quick note taking with timestamps."
  :group 'org
  :prefix "remember-org-")

(defcustom remember-org-file
  (expand-file-name "remember.org" user-emacs-directory)
  "File where remembered notes are stored.
By default, this is 'remember.org' in your Emacs user directory."
  :type 'file
  :group 'remember-org)

(defcustom remember-org-time-format "[%Y-%m-%d %a %H:%M]"
  "Format for timestamps in remembered notes.
See `format-time-string' for possible formats."
  :type 'string
  :group 'remember-org)

(defcustom remember-org-capture-template "* %t\n%i\n"
  "Template for new entries.
%t will be replaced with timestamp
%i will be replaced with input text."
  :type 'string
  :group 'remember-org)

;;;###autoload
(defun remember-org-capture ()
  "Capture a new remembered note with timestamp."
  (interactive)
  (let ((note (read-string "Remember: ")))
    (with-current-buffer (find-file-noselect remember-org-file)
      (goto-char (point-max))
      (unless (bolp) (insert "\n"))
      (insert (replace-regexp-in-string
               "%t" (format-time-string remember-org-time-format)
               (replace-regexp-in-string
                "%i" note
                remember-org-capture-template)))
      (save-buffer))
    (message "Remembered in %s (in your Emacs directory)" 
             (file-name-nondirectory remember-org-file))))

;;;###autoload
(defun remember-org-view ()
  "View remembered notes."
  (interactive)
  (find-file remember-org-file)
  (message "Viewing remember.org from your Emacs directory (%s)" 
           user-emacs-directory))

;;;###autoload
(defun remember-org-ensure-file ()
  "Ensure the remember-org file exists and has a title."
  (unless (file-exists-p remember-org-file)
    (with-current-buffer (find-file-noselect remember-org-file)
      (insert "#+TITLE: Remembered Notes\n")
      (insert "#+DATE: Created on " (format-time-string "%Y-%m-%d") "\n")
      (insert "#+STARTUP: showeverything\n\n")
      (save-buffer))))

(defun remember-org-search ()
  "Search through remembered notes using completing-read."
  (interactive)
  (let ((headlines '()))
    (with-current-buffer (find-file-noselect remember-org-file)
      (org-map-entries
       (lambda ()
         (push (cons (org-get-heading t t) (point)) headlines))))
    (let ((selected (completing-read "Find note: " 
                                   (mapcar #'car headlines))))
      (find-file remember-org-file)
      (goto-char (cdr (assoc selected headlines)))
      (org-show-entry))))

;;;###autoload
(define-minor-mode remember-org-mode
  "Minor mode for remember-org.
\\{remember-org-mode-map}"
  :lighter " Remember"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c r c") #'remember-org-capture)
            (define-key map (kbd "C-c r v") #'remember-org-view)
            (define-key map (kbd "C-c r s") #'remember-org-search)
            map)
  (remember-org-ensure-file))

(provide 'remember-org)
