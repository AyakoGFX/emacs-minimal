;; custom file 
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;; font
(if (eq window-system 'w32)
    (add-to-list 'default-frame-alist
                 '(font . "JetBrainsMono NF-14"))

  (add-to-list 'default-frame-alist
               '(font . "JetBrainsMono Nerd Font-20")))

;; basic modes
(global-hl-line-mode 1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode t)
(global-display-line-numbers-mode 1)
(save-place-mode 1)
(global-auto-revert-mode 1)

(setq ring-bell-function 'ignore
      make-backup-files nil
      use-dialog-box nil
      auto-save-default nil
      create-lockfiles nil
      inhibit-startup-message t
      global-auto-revert-non-file-buffers t
      ibuffer-expert t
      initial-scratch-message ";; M-x org-remember-view `C-c_r_c'\n")

(defalias 'yes-or-no-p 'y-or-n-p)

;; Set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; moduals completion 
(load "~/.emacs.d/moduals/completion.el")
(load "~/.emacs.d/moduals/consult.el")
(load "~/.emacs.d/moduals/dired.el")
(load "~/.emacs.d/moduals/elfeed.el")
(load "~/.emacs.d/moduals/erc.el")
(load "~/.emacs.d/moduals/functionality.el")
(load "~/.emacs.d/moduals/key.el")
(load "~/.emacs.d/moduals/lsp.el")
(load "~/.emacs.d/moduals/note.el")
(load "~/.emacs.d/moduals/os.el")
(load "~/.emacs.d/moduals/shell.el")
(load "~/.emacs.d/moduals/spell.el")
(load "~/.emacs.d/moduals/themes.el")
(load "~/.emacs.d/moduals/org.el")
