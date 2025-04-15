(use-package typst-ts-mode
  :ensure t)

(setq typst-ts-lsp-download-path
      (string-trim (shell-command-to-string "which tinymist")))

(with-eval-after-load 'eglot
  (with-eval-after-load 'typst-ts-mode
    (add-to-list 'eglot-server-programs
                 `((typst-ts-mode) .
                   ,(eglot-alternatives `(,typst-ts-lsp-download-path
                                          "tinymist"
                                          "typst-lsp"))))))

(defun typst-ts-tinymist-preview ()
  "Run `tinymist preview` on the current file."
  (interactive)
  (let ((file (buffer-file-name)))
    (if file
        (compile (format "tinymist preview %s" (shell-quote-argument file)))
      (user-error "Buffer is not visiting a file"))))

(with-eval-after-load 'typst-ts-mode
  (define-key typst-ts-mode-map (kbd "C-c C-x") #'typst-ts-tinymist-preview))


;; (defun my/eglot-typst-with-font-path ()
;;   (interactive)
;;   (when (derived-mode-p 'typst-mode)
;;     (let* ((project (project-current))
;;            (root (if project (project-root project) default-directory))
;;            (font-dir (expand-file-name "fonts" root)))
;;       (when (file-directory-p font-dir)
;;         (setq-local eglot-server-programs
;;                     `((typst-mode . ("tinymist" "lsp"
;;                                      "--font-path" ,font-dir))))
;;         (eglot-ensure)))))

;; (add-hook 'typst-ts-mode-hook #'my/eglot-typst-with-font-path)







;; [ayako@nixos ~/tmp]$ tinymist preview main.typ
;; [ayako@nixos:~/]$ typst compile test.typ 


;; https://myriad-dreamin.github.io/tinymist/frontend/emacs.html
;; https://github.com/Myriad-Dreamin/tinymist/tree/main/editors/emacs
;; https://codeberg.org/meow_king/typst-ts-mode/wiki/

;; M-x typst-ts-lsp-download-binary  to download the lsp or ;; nix-shell -p tinymist

;; typst-ts-lsp-download-path is a variable = Its value is "~/.emacs.d/.cache/lsp/tinymist/tinymist"

