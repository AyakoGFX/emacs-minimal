(when (eq system-type 'gnu/linux)
  (use-package jinx  
    :ensure t  
    :hook (emacs-startup . global-jinx-mode))

  ;; Jinx keybindings
  (global-set-key (kbd "C-c s s") 'jinx-correct)
  (global-set-key (kbd "C-c s n") 'jinx-next)
  (global-set-key (kbd "C-c s p") 'jinx-previous)
  (global-set-key (kbd "C-c s l") 'jinx-languages)
  (global-set-key (kbd "C-c s a") 'jinx-correct-all)
  (global-set-key (kbd "C-c s w") 'jinx-correct-word)
  (global-set-key (kbd "C-c s N") 'jinx-correct-nearest))
