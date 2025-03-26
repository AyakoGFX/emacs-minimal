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
;; (global-hl-line-mode 1)
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
      initial-scratch-message ";; M-x `org-remember-view'")

;; Short answers only please
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default use-short-answers t)

;; Disable tabs globally and set tab width
(setq-default indent-tabs-mode nil)  ;; Use spaces instead of tabs
;; (setq-default tab-width 4)            ;; Set tab width to 4 spaces
;; Converting Tabs and Spaces
    ;; Convert Tabs to Spaces: Use M-x untabify
    ;; Convert Spaces to Tabs: Use M-x tabify


;; Set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; moduals completion
(load "~/.emacs.d/moduals/case-conversion.el")
(load "~/.emacs.d/moduals/completion.el")
(load "~/.emacs.d/moduals/consult.el")
(load "~/.emacs.d/moduals/dired.el")
(load "~/.emacs.d/moduals/display-buffer.el")
(load "~/.emacs.d/moduals/elfeed.el")
(load "~/.emacs.d/moduals/erc.el")
(load "~/.emacs.d/moduals/eww.el")
(load "~/.emacs.d/moduals/functionality.el")
(load "~/.emacs.d/moduals/key.el")
(load "~/.emacs.d/moduals/latex.el")
(load "~/.emacs.d/moduals/lsp.el")
(load "~/.emacs.d/moduals/my-find.el")
(load "~/.emacs.d/moduals/my-func.el")
(load "~/.emacs.d/moduals/note.el")
(load "~/.emacs.d/moduals/org.el")
(load "~/.emacs.d/moduals/os.el")
(load "~/.emacs.d/moduals/shell.el")
(load "~/.emacs.d/moduals/spell.el")
(load "~/.emacs.d/moduals/themes.el")
(load "~/.emacs.d/moduals/themes.el")
(load "~/.emacs.d/moduals/workspace.el")
(load "~/.emacs.d/moduals/pdf.el")

(require 'org-link-desc)
(define-key org-mode-map (kbd "C-c l f") 'org-link-desc-insert-link-with-file-name)
(define-key org-mode-map (kbd "C-c l l") 'org-link-desc-insert-link-with-url-title)

(require 'org-remember)
(global-set-key (kbd "C-c r c") #'org-remember-capture)
(global-set-key (kbd "C-c r v") #'org-remember-view)
(global-set-key (kbd "C-c r s") #'org-remember-search)

(require 'espeak)
(global-set-key (kbd "C-c e") #'espeak-region)
(global-set-key (kbd "C-c q") #'espeak-cancel)


(require 'dired-dragon)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "C-d d") 'dired-dragon)
  (define-key dired-mode-map (kbd "C-d s") 'dired-dragon-stay)
  (define-key dired-mode-map (kbd "C-d i") 'dired-dragon-individual))

(use-package evil
  :ensure t)
(global-set-key (kbd "C-x /") #'evil-ex)

(use-package keycast
  :ensure t)

;; (use-package theme-magic
  ;; :ensure t)
;; (theme-magic-export-theme-mode 1)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
