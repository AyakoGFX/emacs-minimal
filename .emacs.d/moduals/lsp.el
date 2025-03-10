(use-package company
  :ensure t)
(add-hook 'eglot-managed-mode-hook 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)

(use-package eglot
  :ensure t
  :commands (eglot))
(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1))) ;; off inlay hints 

(add-hook 'LaTeX-mode 'eglot-ensure)        ;; latex
(add-hook 'c-mode-hook 'eglot-ensure)        ;; C
(add-hook 'c++-mode-hook 'eglot-ensure)      ;; C++
(add-hook 'bibtex-mode-hook 'eglot-ensure)


(use-package eldoc-box
  :ensure t)
(global-set-key (kbd "C-c h") 'eldoc-box-help-at-point)
(add-hook 'eglot-managed-mode-hook #'eldoc-mode)

(defvar eglot-prefix-map (make-sparse-keymap)
  "Keymap for Eglot commands.")

;; Bind eglot commands to your desired prefix
(define-key eglot-prefix-map (kbd "d") 'eglot-find-definition)      ;; C-l d for definition
(define-key eglot-prefix-map (kbd "r") 'eglot-find-reference)       ;; C-l r for references
(define-key eglot-prefix-map (kbd "t") 'eglot-find-type-definition) ;; C-l t for type definition
(define-key eglot-prefix-map (kbd "d") 'flymake-show-buffer-diagnostics) ;; C-l t for type definition

;; Now bind the prefix key globally
(global-set-key (kbd "C-l") eglot-prefix-map)

(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package lsp-latex
  ;; this uses texlab
  :ensure t)

(use-package emmet-mode
  :ensure t)
(add-hook 'mhtml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
