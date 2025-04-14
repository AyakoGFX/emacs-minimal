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


;; [ayako@nixos ~/tmp]$ tinymist preview main.typ

;; https://myriad-dreamin.github.io/tinymist/frontend/emacs.html
;; https://github.com/Myriad-Dreamin/tinymist/tree/main/editors/emacs
;; https://codeberg.org/meow_king/typst-ts-mode/wiki/

;; M-x typst-ts-lsp-download-binary  to download the lsp or ;; nix-shell -p tinymist

;; typst-ts-lsp-download-path is a variable = Its value is "~/.emacs.d/.cache/lsp/tinymist/tinymist"

