(use-package move-text
  :ensure t)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(use-package sudo-edit
  :ensure t
  :bind ("C-c C-0" . sudo-edit))

  (use-package which-key
    :ensure t
    :config
    (which-key-mode))

(use-package vundo
  :commands (vundo)
  :ensure t
  :config
  ;; Take less on-screen space.
  (setq vundo-compact-display t))
  
  ;; Better contrasting highlight.
  (custom-set-faces
   '(vundo-node ((t (:foreground "#808080"))))
   '(vundo-stem ((t (:foreground "#808080"))))
   '(vundo-highlight ((t (:foreground "#FFFF00")))))

;; Magit & git tools
  (use-package magit
    :ensure t
    :config
    (setq magit-push-always-verify nil)
    (setq git-commit-summary-max-length 50)
    :bind
    ("C-c g g" . my/magit-status))

  ;; opens magit in full window rather then popup
  (defun my/magit-status ()
  "Don't split window."
  (interactive)
  (let ((pop-up-windows nil))
    (call-interactively 'magit-status)))

(use-package 0x0
  :ensure t
  :config
  (global-set-key (kbd "C-c 0 o") #'0x0-dwim)
  (global-set-key (kbd "C-c 0 t") #'0x0-upload-text)
  (global-set-key (kbd "C-c 0 f") #'0x0-upload-file)
  (global-set-key (kbd "C-c 0 k") #'0x0-upload-kill-ring)
  (global-set-key (kbd "C-c 0 p") #'0x0-popup)
  (global-set-key (kbd "C-c 0 s") #'0x0-shorten-uri))

(require 'org-remember)
(org-remember-mode 1)
(global-set-key (kbd "C-c r c") 'org-remember-capture)
(global-set-key (kbd "C-c r v") 'org-remember-view)
(global-set-key (kbd "C-c r s") 'org-remember-search)

(require 'espeak)
(global-set-key (kbd "C-c e") 'espeak-region)
(global-set-key (kbd "C-c q") 'espeak-cancel)



(use-package casual-suite
  :ensure t)
(keymap-set calc-mode-map "C-`" #'casual-calc-tmenu)
(keymap-set dired-mode-map "C-`" #'casual-dired-tmenu)
(keymap-set isearch-mode-map "C-`" #'casual-isearch-tmenu)
(keymap-set ibuffer-mode-map "C-`" #'casual-ibuffer-tmenu)
(keymap-set ibuffer-mode-map "F" #'casual-ibuffer-filter-tmenu)
(keymap-set ibuffer-mode-map "s" #'casual-ibuffer-sortby-tmenu)
(keymap-set Info-mode-map "C-`" #'casual-info-tmenu)
(keymap-set reb-mode-map "C-`" #'casual-re-builder-tmenu)
(keymap-set reb-lisp-mode-map "C-`" #'casual-re-builder-tmenu)
(keymap-set bookmark-bmenu-mode-map "C-`" #'casual-bookmarks-tmenu)
(keymap-set org-agenda-mode-map "C-`" #'casual-agenda-tmenu)
(keymap-global-set "M-0" #'casual-avy-tmenu)
(keymap-set symbol-overlay-map "C-`" #'casual-symbol-overlay-tmenu)
(keymap-global-set "C-`" #'casual-editkit-main-tmenu)


;; -------------------- not used -----------
;;(use-package calfw
;;  :ensure t)
;;(use-package calfw-org
;;  :ensure t)
;; (setq cfw:org-agenda-schedule-args '(:timestamp))
