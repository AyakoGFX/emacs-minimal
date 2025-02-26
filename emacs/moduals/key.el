  (global-set-key [mouse-9] #'next-buffer)
  (global-set-key [mouse-8] #'previous-buffer)
  (global-set-key (kbd "M-1") 'previous-buffer)
  (global-set-key (kbd "M-2") 'next-buffer)
  (global-set-key (kbd "C-;") 'comment-line)

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
