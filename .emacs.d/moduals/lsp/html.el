(use-package emmet-mode
  :ensure t)
(add-hook 'mhtml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
