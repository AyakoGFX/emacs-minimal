;; useful keys
;; C-c M-j cider-jack-in-clj
;; https://youtu.be/KMWLIgG986I?si=sfHXAxtxe-NYCZ0R
;; https://youtu.be/mzNBRmZHmD4?si=w7DPtLSce7hga1Jw&t=293


;; --- Clojure Mode ---
(use-package clojure-mode
  :ensure t
  :mode "\\.clj\\'")

;; --- CIDER for REPL, eval, debugging ---
(use-package cider
  :ensure t
  :hook (clojure-mode . cider-mode)
  :config
  (setq cider-repl-display-help-banner nil
        cider-save-file-on-load t
        cider-repl-result-prefix ";; =>"
        cider-eval-result-prefix "")


;; ;; --- Eglot with clojure-lsp (must be installed on your system) ---
;; (USE-package eglot
;;   :ensure t
;;   :hook (clojure-mode . eglot-ensure))

;; ;; --- Paredit for parentheses handling ---
;; (use-package paredit
;;   :ensure t
;;   :hook (clojure-mode . paredit-mode))
