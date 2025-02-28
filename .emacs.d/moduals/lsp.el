(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (LaTeX-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))


(use-package lsp-latex
  ;; this uses texlab
  :ensure t
  :config
  (progn
    (add-hook 'bibtex-mode-hook 'lsp)))


(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)










