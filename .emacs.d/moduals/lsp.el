(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package company
  :ensure t)
(add-hook 'after-init-hook 'global-company-mode)
