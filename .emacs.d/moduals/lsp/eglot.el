(use-package company
  :ensure t)
(add-hook 'eglot-managed-mode-hook 'company-mode)
(add-hook 'after-init-hook 'global-company-mode)

(use-package eglot
  :ensure t
  :commands (eglot))
(add-hook 'eglot-managed-mode-hook (lambda () (eglot-inlay-hints-mode -1))) ;; off inlay hints 

(use-package eldoc-box
  :ensure t)
(global-set-key (kbd "C-c h") 'eldoc-box-help-at-point)
(global-set-key (kbd "C-c C-h") 'eldoc-doc-buffer)
(add-hook 'eglot-managed-mode-hook #'eldoc-mode)
;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-mode)



(defvar eglot-prefix-map (make-sparse-keymap)
  "Keymap for Eglot commands.")

;; Bind eglot commands to your desired prefix
(define-key eglot-prefix-map (kbd "d") 'eglot-find-definition)           ;; C-l d for definition
(define-key eglot-prefix-map (kbd "r") 'eglot-find-reference)            ;; C-l r for references
(define-key eglot-prefix-map (kbd "t") 'eglot-find-type-definition)      ;; C-l t for type definition
(define-key eglot-prefix-map (kbd "R") 'eglot-rename)                    ;; C-l r for rename
(define-key eglot-prefix-map (kbd "d") 'flymake-show-buffer-diagnostics) ;; C-l t for type definition

;; Now bind the prefix key globally
(global-set-key (kbd "C-l") eglot-prefix-map)
(global-set-key (kbd "<f5>") 'eglot-format-buffer)

;; TODO
;;  :bind (:map
;;         eglot-mode-map
;;         ("C-c e r" . eglot-rename)
;;         ("C-c e a" . eglot-code-actions)
;;         ("C-c e o" . eglot-code-action-organize-imports)
;;         ("C-c e d" . eldoc)
;;         ("C-c e f" . eglot-format)
;;         ("C-c e =" . eglot-format))

