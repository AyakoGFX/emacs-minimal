(use-package company
  :ensure t)
(add-hook 'eglot-managed-mode-hook 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)

(use-package eglot
  :ensure t
  :commands (eglot))
(add-hook 'c-mode-hook 'eglot-ensure)        ;; C
(add-hook 'c++-mode-hook 'eglot-ensure)      ;; C++
(add-hook 'LaTeX-mode 'eglot-ensure)        ;; latex
(add-hook 'bibtex-mode-hook 'eglot-ensure)
;;  (add-hook 'python-mode-hook 'eglot-ensure)   ;; Python


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

