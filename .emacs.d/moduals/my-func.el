(defun my/dired-create-random-files (num-files)
  "Create NUM-FILES random files in the current dired directory."
  (interactive "nNumber of random files: ")
  (let ((dir (dired-current-directory)))
    (dotimes (_ num-files)
      (let ((filename (expand-file-name (format "file-%d.txt" (random 100000)) dir)))
        (write-region "" nil filename))))
  (revert-buffer))  ;; Refresh dired to show new files

(defun my/dired-create-numbered-random-files (num-files)
  "Create NUM-FILES numbered and random-named files in the current dired directory."
  (interactive "nNumber of numbered random files: ")
  (let ((dir (dired-current-directory)))
    (dotimes (i num-files)
      (let ((filename (expand-file-name 
                       (format "file-%03d-%d.txt" i (random 100000)) dir)))
        (write-region "" nil filename))))
  (revert-buffer))  ;; Refresh dired to show new files


(defun my/toggle-org-fundamental-mode ()
  "Toggle between `org-mode` and `fundamental-mode`.
This function only works when the current buffer is in `org-mode` or `fundamental-mode`."
  (interactive)
  (cond
   ((eq major-mode 'org-mode)   ; If in org-mode, switch to fundamental-mode
    (fundamental-mode))
   ((eq major-mode 'fundamental-mode)  ; If in fundamental-mode, switch to org-mode
    (org-mode))
   (t  ; Otherwise, do nothing
    (message "This function only works in `org-mode` or `fundamental-mode`."))))

;; Bind the function to F4
(global-set-key (kbd "<f4>") 'my/toggle-org-fundamental-mode)

(defun replace-with-numbers ()
  "Prompt the user for a string to replace with incrementing numbers across the entire buffer."
  (interactive)
  (let ((target (read-string "Enter the text to replace with numbers: "))
        (counter 1))  ; Reset the counter for each replacement
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward target nil t)
        (replace-match (number-to-string counter))
        (setq counter (1+ counter))))
    (message "Replaced '%s' with numbers!" target)))
