(use-package naga-theme
  :ensure t)

(use-package almost-mono-themes
  :ensure t)

(use-package notink-theme
  :ensure t)

 (use-package zenburn-theme
   :ensure t)

(use-package doom-themes
  :ensure t)

(use-package vscode-dark-plus-theme
  :ensure t)

(use-package gruvbox-theme
  :ensure t)

(use-package gruber-darker-theme
  :ensure t)

;; Leuven - by far the best theme for Org

;; This ensures that line numbers scale with the text by inheriting the default font attributes
;; https://emacs.stackexchange.com/questions/74507/constant-font-size-in-display-line-numbers-mode-when-zooming-in-and-out
;; (set-face-attribute 'line-number nil :inherit 'default)
;; (set-face-background 'region "#44475a") ; replace with a contrastive color
;; (set-face-background 'hl-line "#2a2a2a") ; replace with a darker shade that suits your theme




;; This removes all custom themes.
;; (dolist (theme custom-enabled-themes)
  ;; (disable-theme theme))

;; (use-package theme-magic
  ;; :ensure t)
;; (theme-magic-export-theme-mode 1)

;; (custom-set-faces '(line-number ((t (:foreground "cyan")))))
