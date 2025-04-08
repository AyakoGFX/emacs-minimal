(global-set-key [mouse-9] #'next-buffer)
(global-set-key [mouse-8] #'previous-buffer)
(global-set-key (kbd "M-1") 'previous-buffer)
(global-set-key (kbd "M-2") 'next-buffer)
(global-set-key (kbd "C-;") 'comment-line)
(global-set-key (kbd "C-c f") #'find-file-at-point)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(global-set-key (kbd "C-x C-k") (lambda () (interactive) (kill-buffer (current-buffer)))) ;; kill buff no asking 
(global-set-key (kbd "C-c q") #'join-line)
(global-set-key (kbd "<f2>") #'rgrep)
(global-set-key (kbd "C-c j") #'replace-string)

;; Window manipulation (used with windmove, hence _Ctrl_-shift bindings)
(global-set-key (kbd "S-C-<right>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<left>")  'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)
;; window
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "M-0") 'delete-window)
(defun my/toggle-shell ()
  ;; "Toggle the `shell' buffer."
  (interactive)
  (if (get-buffer "*shell*")
      (if (equal (current-buffer) (get-buffer "*shell*"))
          (bury-buffer)
        (pop-to-buffer "*shell*"))
    (shell)))
(global-set-key (kbd "<f1>") #'my/toggle-shell)

(defun my/backward-kill-spaces-or-char-or-word ()
  (interactive)
  (cond
   ((looking-back (rx (char word)) 1)
    (backward-kill-word 1))
   ((looking-back (rx (char blank)) 1)
    (delete-horizontal-space t))
   (t
    (backward-delete-char 1))))
(global-set-key (kbd "<C-backspace>") 'my/backward-kill-spaces-or-char-or-word)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c d h") #'org-toggle-inline-images))
