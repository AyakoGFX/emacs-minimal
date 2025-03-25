(defun my/cycle-hyphen-lowline-space (&optional Begin End)
  "Cycle {hyphen lowline space} chars.

The region to work on is by this order:
1. if there is a selection, use that.
2. If cursor is in a string quote or any type of bracket, and is within current line, work on that region.
3. else, work on current line."
  (interactive)
  (let (xp1 xp2 xlen
            (xcharArray ["-" "_" " "])
            (xregionWasActive-p (region-active-p))
            (xnowState (if (eq last-command this-command) (get 'my/cycle-hyphen-lowline-space 'state) 0))
            xchangeTo)
    (setq
     xlen (length xcharArray)
     xchangeTo (elt xcharArray xnowState))
    (if (and Begin End)
        (setq xp1 Begin xp2 End)
      (if (region-active-p)
          (setq xp1 (region-beginning) xp2 (region-end))
        (let ((xskipChars "^\"<>(){}[]“”‘’‹›«»「」『』【】〖〗《》〈〉〔〕（）"))
          (skip-chars-backward xskipChars (line-beginning-position))
          (setq xp1 (point))
          (skip-chars-forward xskipChars (line-end-position))
          (setq xp2 (point))
          (push-mark xp1))))
    (save-excursion
      (save-restriction
        (narrow-to-region xp1 xp2)
        (goto-char (point-min))
        (while (re-search-forward (elt xcharArray (% (+ xnowState 2) xlen)) (point-max) 1)
          (replace-match xchangeTo t t))))
    (when (or (string-equal xchangeTo " ") xregionWasActive-p)
      (goto-char xp2)
      (push-mark xp1)
      (setq deactivate-mark nil))
    (put 'my/cycle-hyphen-lowline-space 'state (% (+ xnowState 1) xlen)))
)
;; Bind the function to a key, e.g., C-M-0
(global-set-key (kbd "C-M-0") #'my/cycle-hyphen-lowline-space)

(defun my/font-list-all ()
  "List all unique and sorted system fonts in a temporary buffer."
  (interactive)
  (with-output-to-temp-buffer "*Font-List*"
    (dolist (font (sort (delete-dups (font-family-list)) #'string<))
      (princ (format "%s\n" font)))))

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

(defun my/replace-with-numbers ()
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
