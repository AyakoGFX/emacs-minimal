(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  ;; :config
  ;; (setq treesit-auto-langs '(javascript typescript tsx css html))
  ;; (treesit-auto-add-to-auto-mode-alist '(javascript typescript tsx css html))
  (global-treesit-auto-mode))
