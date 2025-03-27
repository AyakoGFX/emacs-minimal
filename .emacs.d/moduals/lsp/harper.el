;; (use-package flymake-proselint
;;   :ensure t)

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '(text-mode . ("harper-ls" "--stdio"))))

;; (eglot--connect
;;  (text-mode)
;;  (transient . "/home/ayako/test/")
;;  eglot-lsp-server
;;  ("harper-ls" "--stdio")
;;  ("plaintext"))

;; Set the workspace configuration for harper-ls
;; (setq-default eglot-workspace-configuration
              ;; '(:harper-ls (eglot-{})))

;; (add-hook 'text-mode-hook 'eglot-ensure)

;; (setq debug-on-error t)



;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '(text-mode . ("harper-ls" "--stdio"))))

;; (setq-default eglot-workspace-configuration
;;               '(:harper-ls (eglot-{})))

;; ;; (message "Eglot workspace configuration: %s" eglot-workspace-configuration)
