(use-package avy
  :ensure t)
(global-set-key (kbd "M-9") 'avy-goto-word-1)


;;; TIME
(use-package time
  :ensure nil
  ;; :hook (after-init . display-time-mode) ;; If we'd like to see it on the modeline
  :custom
  (world-clock-time-format "%A %d %B %r %Z")
  (display-time-day-and-date t)
  (display-time-default-load-average nil)
  (display-time-mail-string "")
  (zoneinfo-style-world-list                ; use `M-x worldclock RET' to see it
   '(("America/Los_Angeles" "Los Angeles")
     ("America/Vancouver" "Vancouver")
     ("Canada/Pacific" "Canada/Pacific")
     ("America/Chicago" "Chicago")
     ("America/Toronto" "Toronto")
     ("America/New_York" "New York")
     ("Canada/Atlantic" "Canada/Atlantic")
     ("Brazil/East" "Brasília")
     ("America/Sao_Paulo" "São Paulo")
     ("UTC" "UTC")
     ("Europe/Lisbon" "Lisbon")
     ("Europe/Brussels" "Brussels")
     ("Europe/Athens" "Athens")
     ("Asia/Riyadh" "Riyadh")
     ("Asia/Tehran" "Tehran")
     ("Asia/Tbilisi" "Tbilisi")
     ("Asia/Yekaterinburg" "Yekaterinburg")
     ("Asia/Kolkata" "Kolkata")
     ("Asia/Singapore" "Singapore")
     ("Asia/Shanghai" "Shanghai")
     ("Asia/Seoul" "Seoul")
     ("Asia/Tokyo" "Tokyo")
     ("Asia/Vladivostok" "Vladivostok")
     ("Australia/Brisbane" "Brisbane")
     ("Australia/Sydney" "Sydney")
     ("Pacific/Auckland" "Auckland"))))

 ;; PROCED
(use-package proced
  :ensure nil
  :defer t
  :custom
  (proced-enable-color-flag t)
  (proced-tree-flag t)
  (proced-auto-update-flag 'visible)
  (proced-auto-update-interval 1)
  (proced-descent t)
  (proced-filter 'user) ;; We can change interactively with `s'
  :config
  (add-hook 'proced-mode-hook
            (lambda ()
              (proced-toggle-auto-update 1))))

(use-package multiple-cursors
  :ensure t)
;; Do What I Mean
(global-set-key (kbd "C-M-j") 'mc/mark-all-dwim) ;; both marked and unmarked region. multiple presses.

;; For continuous lines: Mark lines, then create cursors. Can be mid-line.
(global-set-key (kbd "C-M-c") 'mc/edit-lines)

;; Select region first, then create cursors.
(global-set-key (kbd "C-M-/") 'mc/mark-all-like-this) ; select text first. finds all occurrences.
(global-set-key (kbd "C-M-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-M-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-'") 'mc-hide-unmatched-lines-mode)

;; Skip this match and move to next one. 
(global-set-key (kbd "C-M-<") 'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-M->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-M-y") 'mc/insert-numbers)

(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)
(setq mc/insert-numbers-default 1)

(with-eval-after-load 'multiple-cursors
  (define-key mc/keymap (kbd "C-j C-i C-SPC") 'just-one-space))

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
  (setq vundo-compact-display t)

  ;; Better contrasting highlight.
  (custom-set-faces
   '(vundo-node ((t (:foreground "#808080"))))
   '(vundo-stem ((t (:foreground "#808080"))))
   '(vundo-highlight ((t (:foreground "#FFFF00")))))

  ;; Use `HJKL` VIM-like motion, also Home/End to jump around.
  (with-eval-after-load 'vundo
    (define-key vundo-mode-map (kbd "l") #'vundo-forward)
    (define-key vundo-mode-map (kbd "<right>") #'vundo-forward)
    (define-key vundo-mode-map (kbd "h") #'vundo-backward)
    (define-key vundo-mode-map (kbd "<left>") #'vundo-backward)
    (define-key vundo-mode-map (kbd "j") #'vundo-next)
    (define-key vundo-mode-map (kbd "<down>") #'vundo-next)
    (define-key vundo-mode-map (kbd "k") #'vundo-previous)
    (define-key vundo-mode-map (kbd "<up>") #'vundo-previous)
    (define-key vundo-mode-map (kbd "<home>") #'vundo-stem-root)
    (define-key vundo-mode-map (kbd "<end>") #'vundo-stem-end)
    (define-key vundo-mode-map (kbd "q") #'vundo-quit)
    (define-key vundo-mode-map (kbd "C-g") #'vundo-quit)
    (define-key vundo-mode-map (kbd "RET") #'vundo-confirm))

  ;; If you're using Evil mode, define Evil keybindings.
  (with-eval-after-load 'evil
    (evil-define-key 'normal 'global (kbd "C-M-u") 'vundo)))

;; Global keybinding to trigger vundo.
;; (global-set-key (kbd "C-x C-u") 'vundo)


;; (use-package vundo
;;   :commands (vundo)
;;   :ensure t
;;   :config
;;   ;; Take less on-screen space.
;;   (setq vundo-compact-display t))
  
;;   ;; Better contrasting highlight.
;;   (custom-set-faces
;;    '(vundo-node ((t (:foreground "#808080"))))
;;    '(vundo-stem ((t (:foreground "#808080"))))
;;    '(vundo-highlight ((t (:foreground "#FFFF00")))))
;;   ;; Use `HJKL` VIM-like motion, also Home/End to jump around.
;;   (define-key vundo-mode-map (kbd "l") #'vundo-forward)
;;   (define-key vundo-mode-map (kbd "<right>") #'vundo-forward)
;;   (define-key vundo-mode-map (kbd "h") #'vundo-backward)
;;   (define-key vundo-mode-map (kbd "<left>") #'vundo-backward)
;;   (define-key vundo-mode-map (kbd "j") #'vundo-next)
;;   (define-key vundo-mode-map (kbd "<down>") #'vundo-next)
;;   (define-key vundo-mode-map (kbd "k") #'vundo-previous)
;;   (define-key vundo-mode-map (kbd "<up>") #'vundo-previous)
;;   (define-key vundo-mode-map (kbd "<home>") #'vundo-stem-root)
;;   (define-key vundo-mode-map (kbd "<end>") #'vundo-stem-end)
;;   (define-key vundo-mode-map (kbd "q") #'vundo-quit)
;;   (define-key vundo-mode-map (kbd "C-g") #'vundo-quit)
;;   (define-key vundo-mode-map (kbd "RET") #'vundo-confirm)

;; (with-eval-after-load 'evil
;;   (evil-define-key 'normal 'global (kbd "C-M-u") 'vundo))

;; (global-set-key (kbd "C-x C-u") 'vundo)


(use-package 0x0
  :ensure t
  :config
  (global-set-key (kbd "C-c 0 o") #'0x0-dwim)
  (global-set-key (kbd "C-c 0 t") #'0x0-upload-text)
  (global-set-key (kbd "C-c 0 f") #'0x0-upload-file)
  (global-set-key (kbd "C-c 0 k") #'0x0-upload-kill-ring)
  (global-set-key (kbd "C-c 0 p") #'0x0-popup)
  (global-set-key (kbd "C-c 0 s") #'0x0-shorten-uri))


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
;; (keymap-global-set "C-M-9" #'casual-avy-tmenu)
(keymap-global-set "M-(" #'casual-avy-tmenu)
(keymap-set symbol-overlay-map "C-`" #'casual-symbol-overlay-tmenu)
(keymap-global-set "C-`" #'casual-editkit-main-tmenu)


;; -------------------- not used -----------

;; Emacs: display ugly ^L page breaks as tidy horizontal lines
;; Navigate between them: Press C-x [ and C-x ] to move between page breaks.
;; Delete them: Use M-% ^L RET RET to replace all occurrences with nothing.
;; Insert manually: Type C-q C-l.
;; (use-package page-break-lines
;;   :ensure t)
;; (page-break-lines-mode t)

;;(use-package calfw
;;  :ensure t)
;;(use-package calfw-org
;;  :ensure t)
;; (setq cfw:org-agenda-schedule-args '(:timestamp))

;;(use-package expand-region
;;  :ensure t)
;;;; Expand region. (Also from Magnar Sveen)
;;(global-set-key (kbd "C-M-l") 'er/expand-region) ; only type once, then l, -, 0  sc
;;

;; (use-package swiper
;;   :ensure t
;;   :bind ("C-s" . 'swiper))
