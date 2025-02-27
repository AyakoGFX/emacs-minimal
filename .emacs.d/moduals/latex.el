(use-package auctex
  :ensure t
  :defer t
  :hook (LaTeX-mode .
		    (lambda ()
		      (push (list 'output-pdf "Zathura")
			    TeX-view-program-selection))))
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(use-package yasnippet

  :ensure t
  :config
  (yas-global-mode 1))
