(use-package emmet-mode
  :ensure t)
(add-hook 'mhtml-mode-hook 'emmet-mode)
(add-hook 'html-ts-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes


;; ;; Web-mode setup
;; (use-package web-mode
;;   :ensure t
;;   :mode
;;   (("\\.html?\\'" . web-mode)
;;    ("\\.css\\'" . web-mode)
;;    ("\\.phtml\\'" . web-mode)
;;    ("\\.php\\'" . web-mode)
;;    ("\\.tpl\\'" . web-mode)
;;    ("\\.[agj]sp\\'" . web-mode)
;;    ("\\.as[cp]x\\'" . web-mode)
;;    ("\\.erb\\'" . web-mode)
;;    ("\\.mustache\\'" . web-mode)
;;    ("\\.djhtml\\'" . web-mode))
;;   :config
;;   (setq web-mode-markup-indent-offset 2
;;         web-mode-css-indent-offset 2
;;         web-mode-code-indent-offset 2))

;; ;; Emmet-mode setup
;; (use-package emmet-mode
;;   :ensure t
;;   :hook (web-mode . emmet-mode)
;;   :config
;;   (setq emmet-indent-after-insert nil
;;         emmet-indentation 2))

;; ;; Ensure web-mode is prioritized over tree-sitter for HTML files
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; ;; Eglot setup for web-related files
;; (add-hook 'mhtml-mode-hook 'eglot-ensure)
;; (add-hook 'css-mode-hook 'eglot-ensure)
;; (add-hook 'web-mode-hook 'eglot-ensure)










;; #####################################################################################################
;; (use-package web-mode
;;   :ensure t
;;   :mode (("\\.phtml\\'"     . web-mode)
;;          ("\\.php\\'"       . web-mode)
;;          ("\\.[agj]sp\\'"   . web-mode)
;;          ("\\.as[cp]x\\'"   . web-mode)
;;          ("\\.erb\\'"       . web-mode)
;;          ("\\.mustache\\'"  . web-mode)
;;          ("\\.djhtml\\'"    . web-mode)
;;          ("\\.html?\\'"     . web-mode)
;;          ("\\.scss\\'"      . web-mode)
;;          ("\\.css\\'"       . web-mode))
;;   :hook (web-mode . my/web-mode-setup)
;;   :config
;;   (defun my/web-mode-setup ()
;;     (setq web-mode-markup-indent-offset 2)
;;     (setq web-mode-css-indent-offset 2)
;;     (setq web-mode-code-indent-offset 2)
;;     (setq web-mode-enable-auto-closing t)
;;     ;; (setq web-mode-enable-auto-quoting nil)
;;     (setq web-mode-enable-current-element-highlight t)))

;; (use-package emmet-mode
;;   :ensure t)
;; (add-hook 'mhtml-mode-hook 'emmet-mode)
;; (add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
;; ;; (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
