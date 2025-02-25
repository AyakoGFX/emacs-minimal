;; * Emacs Reference Config i use
;; https://github.com/systematician/emacs-web-dev/blob/master/init.el
;; https://github.com/seagle0128/.emacs.d?tab=readme-ov-file#manual
;; https://github.com/Bugswriter/.emacs.d/blob/master/config.org
;; https://github.com/Bugswriter/BugsWritersEmacs
;; https://github.com/doomemacs/doomemacs
;; https://gitlab.com/Clsmith1/dotfiles
(require 'package)
(setq package-enable-at-startup nil)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("elpa-devel" . "https://elpa.gnu.org/devel/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
;; elpa devel https://elpa.gnu.org/devel/
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(if (eq window-system 'w32)
    (add-to-list 'default-frame-alist
                 '(font . "JetBrainsMono NF-14"))

  (add-to-list 'default-frame-alist
               '(font . "JetBrainsMono Nerd Font-20")))


(setq explicit-shell-file-name "/run/current-system/sw/bin/bash")
(setq explicit-bash-args '("--login" "-i"))
(setq term-shell "/run/current-system/sw/bin/bash")
(setq shell-file-name "/run/current-system/sw/bin/bash")

;; (set-face-attribute 'default nil :font "Courier New" :height 160) ;; fow windows

;; (blink-cursor-mode -1) ;; Disable cursor blinking
;; (blink-cursor-mode t) ;; Enable cursor blinking

;; Toggle line highlighting in all buffers
(global-hl-line-mode 1)
;; Remove lame startup screen
(setq inhibit-startup-message t)
(setq initial-scratch-message ";; M-x org-remember-view `C-c_r_c'\n")


;; Disable menus and scroll-bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package notink-theme
  :ensure t)

;; (use-package zenburn-theme
;;   :ensure t)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Disable backups and auto-saves
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

  ;;; Move Text
(use-package move-text
  :ensure t)
(global-set-key (kbd "M-p") 'move-text-up)
(global-set-key (kbd "M-n") 'move-text-down)

(use-package sudo-edit
  :ensure t
  :bind ("C-c C-0" . sudo-edit))

(use-package dired
  :ensure nil
  :config ; Guess a default target directory
  (setq dired-mouse-drag-files t)
  (setq dired-dwim-target t)
  ;; Always delete and copy recursively
  (setq dired-recursive-deletes 'always
	dired-recursive-copies 'always)
  ;; Show directory first
  (setq dired-listing-switches "-alh --group-directories-first"))

;; Hide the details in dired
;; (add-hook 'dired-mode-hook (lambda () (dired-hide-details-mode 1)))
(add-hook 'dired-mode-hook #'dired-hide-details-mode) ;; on in dired


(use-package dired-x
   :demand t
   :config
   (let ((cmd (cond ((eq system-type 'darwin) "open")   ;; macOS
		     ((eq system-type 'gnu/linux) "xdg-open")   ;; Linux
		     ((eq system-type 'windows-nt) "start")   ;; Windows
		     (t ""))))  ;; Default to empty for unknown OS
     (setq dired-guess-shell-alist-user
	    `(("\\.pdf\\'" ,cmd)
	      ("\\.docx\\'" ,cmd)
	      ("\\.\\(?:djvu\\|eps\\)\\'" ,cmd)
	      ("\\.\\(?:jpg\\|jpeg\\|png\\|gif\\|xpm\\)\\'" ,cmd)
	      ("\\.\\(?:xcf\\)\\'" ,cmd)
	      ("\\.csv\\'" ,cmd)
	      ("\\.tex\\'" ,cmd)
	      ("\\.\\(?:mp4\\|mkv\\|avi\\|flv\\|rm\\|rmvb\\|ogv\\)\\(?:\\.part\\)?\\'" ,cmd)
	      ("\\.\\(?:mp3\\|flac\\)\\'" ,cmd)
	      ("\\.html?\\'" ,cmd)
	      ("\\.md\\'" ,cmd)))))

     ;; Colorful dired
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

  (use-package which-key
    :ensure t
    :config
    (which-key-mode))

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

(use-package lua-mode
  :ensure t)

(use-package nix-mode
  :ensure t)

(use-package calfw
  :ensure t)
(use-package calfw-org
  :ensure t)
;; (setq cfw:org-agenda-schedule-args '(:timestamp))
  
;; ibuffer
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (setq ibuffer-expert t)
;; word wrap
(global-visual-line-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)

;; relative line numbers
;; (setq display-line-numbers-type 'relative)  ;; Use 't for absolute numbers
(global-display-line-numbers-mode 1)

(save-place-mode 1)
(setq use-dialog-box nil)
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)

;; Spell-Check In Emacs “jinx”
;; https://gist.github.com/AyakoGFX/f6590eb12d168182daf8f4753e4f5ab0
(when (eq system-type 'gnu/linux)
  (use-package jinx  
    :ensure t  
    :hook (emacs-startup . global-jinx-mode))

  ;; Jinx keybindings
  (global-set-key (kbd "C-c s s") 'jinx-correct)
  (global-set-key (kbd "C-c s n") 'jinx-next)
  (global-set-key (kbd "C-c s p") 'jinx-previous)
  (global-set-key (kbd "C-c s l") 'jinx-languages)
  (global-set-key (kbd "C-c s a") 'jinx-correct-all)
  (global-set-key (kbd "C-c s w") 'jinx-correct-word)
  (global-set-key (kbd "C-c s N") 'jinx-correct-nearest))


;; Completion start
    ;; Enable vertico
   (use-package compat
     :ensure t)

  (use-package vertico
    :ensure t
    :custom
    ;; (vertico-scroll-margin 0) ;; Different scroll margin
    ;; (vertico-count 20) ;; Show more candidates
    (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
    ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
    :init
    (vertico-mode))

(use-package vertico-directory
  :after vertico
  :ensure nil
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))


  ;; Persist history over Emacs restarts. Vertico sorts by history position.
  (use-package savehist
    :ensure t
    :init
    (savehist-mode))

  ;; A few more useful configurations...
  (use-package emacs
    :ensure t
    :custom
    ;; Support opening new minibuffers from inside existing minibuffers.
    (enable-recursive-minibuffers t)
    ;; Hide commands in M-x which do not work in the current mode.  Vertico
    ;; commands are hidden in normal buffers. This setting is useful beyond
    ;; Vertico.
    (read-extended-command-predicate #'command-completion-default-include-p)
    :init
    ;; Add prompt indicator to `completing-read-multiple'.
    ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
    (defun crm-indicator (args)
      (cons (format "[CRM%s] %s"
		    (replace-regexp-in-string
		     "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
		     crm-separator)
		    (car args))
	    (cdr args)))
    (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

    ;; Do not allow the cursor in the minibuffer prompt
    (setq minibuffer-prompt-properties
	  '(read-only t cursor-intangible t face minibuffer-prompt))
    (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

  (setq read-file-name-completion-ignore-case t
	read-buffer-completion-ignore-case t
	completion-ignore-case t)


;; marginalia
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; orderless
  (use-package orderless
    :ensure t
    :custom
    (completion-styles '(orderless basic))
    (completion-category-defaults nil)
    (completion-category-overrides '((file (styles partial-completion)))))

;; Completion end

;;(use-package corfu
;;  :ensure t
;;  :custom
;;  (corfu-cycle t)             
;;  (corfu-auto t)              
;;  (corfu-quit-no-match 'separator) 
;;  :init
;;  (global-corfu-mode))
;;
;;(use-package cape
;;  ;; Bind prefix keymap providing all Cape commands under a mnemonic key.
;;  ;; Press C-c p ? to for help.
;;  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
;;  ;; Alternatively bind Cape commands individually.
;;  ;; :bind (("C-c p d" . cape-dabbrev)
;;  ;;        ("C-c p h" . cape-history)
;;  ;;        ("C-c p f" . cape-file)
;;  ;;        ...)
;;  :init
;;  ;; Add to the global default value of `completion-at-point-functions' which is
;;  ;; used by `completion-at-point'.  The order of the functions matters, the
;;  ;; first function returning a result wins.  Note that the list of buffer-local
;;  ;; completion functions takes precedence over the global list.
;;  (add-hook 'completion-at-point-functions #'cape-dabbrev)
;;  (add-hook 'completion-at-point-functions #'cape-file)
;;  (add-hook 'completion-at-point-functions #'cape-elisp-block)
;;  ;; (add-hook 'completion-at-point-functions #'cape-history)
;;  ;; ...
;;)

;; consult tools
(use-package consult
  :ensure t
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ;; ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))                ;; orig. previous-matching-history-element

    ;; Enable automatic preview at point in the *Completions* buffer. This is
    ;; relevant when you use the default completion UI.
    :hook (completion-list-mode . consult-preview-at-point-mode)
    :init
    (setq register-preview-delay 0.5
          register-preview-function #'consult-register-format)
    (advice-add #'register-preview :override #'consult-register-window)

    ;; Use Consult to select xref locations with preview
    (setq xref-show-xrefs-function #'consult-xref
          xref-show-definitions-function #'consult-xref)
    :config
    (consult-customize
     consult-theme :preview-key '(:debounce 0.2 any)
     consult-ripgrep consult-git-grep consult-grep
     consult-bookmark consult-recent-file consult-xref
     consult--source-bookmark consult--source-file-register
     consult--source-recent-file consult--source-project-recent-file
     :preview-key '(:debounce 0.4 any))

    (setq consult-narrow-key "<"))  ;; Close consult package

;; undo alternative
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

(with-eval-after-load 'evil
  (evil-define-key 'normal 'global (kbd "C-M-u") 'vundo))

(global-set-key (kbd "C-x u") 'vundo)

;; Magit & git tools
  (use-package magit
    :ensure t
    :config
    (setq magit-push-always-verify nil)
    (setq git-commit-summary-max-length 50)
    :bind
    ;; ("C-c g g" . magit-status))
    ("C-c g g" . my/magit-status))

  ;; opens magit in full window rather then popup
  (defun my/magit-status ()
  "Don't split window."
  (interactive)
  (let ((pop-up-windows nil))
    (call-interactively 'magit-status)))


  ;; key-map
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-c d h") #'org-toggle-inline-images))

  (global-set-key [mouse-9] #'next-buffer)
  (global-set-key [mouse-8] #'previous-buffer)
  (global-set-key (kbd "M-1") 'previous-buffer)
  (global-set-key (kbd "M-2") 'next-buffer)

  (global-set-key (kbd "C-;") 'comment-line)

  (defun my/backward-kill-spaces-or-char-or-word ()
    (interactive)
    (cond
     ((looking-back (rx (char word)) 1)
      (backward-kill-word 1))
     ((looking-back (rx (char blank)) 1)
      (delete-horizontal-space t))
     (t
      (backward-delete-char 1))))
  (global-set-key (kbd "<C-backspace>") 'my/backward-kill-spaces-or-char-or-word)


(custom-set-faces
   ;; Font sizes and colors for Org mode headers using Doom One theme colors
   '(org-level-1 ((t (:height 1.4  :inherit outline-1 ultra-bold))))
   '(org-level-2 ((t (:height 1.3  :inherit outline-2 extra-bold))))
   '(org-level-3 ((t (:height 1.2  :inherit outline-3 bold))))
   '(org-level-4 ((t (:height 1.0  :inherit outline-4 semi-bold))))
   '(org-level-5 ((t (:height 1.0  :inherit outline-5 normal))))
   '(org-level-6 ((t (:height 0.9  :inherit outline-6 normal))))
   '(org-level-7 ((t (:height 0.9  :inherit outline-7 normal))))
   '(org-level-8 ((t (:height 0.9  :inherit outline-8 normal))))
   ;; Add more levels and colors as needed
   )

;; visual-fill-column
  (use-package visual-fill-column
  :ensure t
  :hook (org-mode . visual-fill-column-mode)
  :custom
  (visual-fill-column-center-text t)
  (visual-fill-column-width 110))

(use-package visual-line-mode
  :ensure nil
  :hook
  (org-mode . visual-line-mode))

;; nixos
 (require 'tramp-sh)
 (setq tramp-remote-path
       (append tramp-remote-path
  	       '(tramp-own-remote-path)))

;; my/func

(defun my/toggle-org-fundamental-mode ()
  "Toggle between `org-mode` and `fundamental-mode`.
This function only works when the current buffer is in `org-mode` or `fundamental-mode`."
  (interactive)
  (cond
   ((eq major-mode 'org-mode)   ; If in org-mode, switch to fundamental-mode
    (fundamental-mode))
   ((eq major-mode 'fundamental-mode)  ; If in fundamental-mode, switch to org-mode
    (org-mode))
   (t  ; Otherwise, do nothing
    (message "This function only works in `org-mode` or `fundamental-mode`."))))

;; Bind the function to F4
(global-set-key (kbd "<f4>") 'my/toggle-org-fundamental-mode)

(defun replace-with-numbers ()
  "Prompt the user for a string to replace with incrementing numbers across the entire buffer."
  (interactive)
  (let ((target (read-string "Enter the text to replace with numbers: "))
        (counter 1))  ; Reset the counter for each replacement
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward target nil t)
        (replace-match (number-to-string counter))
        (setq counter (1+ counter))))
    (message "Replaced '%s' with numbers!" target)))

(load (expand-file-name "lsp.el" user-emacs-directory))
(load (expand-file-name "Note.el" user-emacs-directory))
(load (expand-file-name "YT.el" user-emacs-directory))
(load (expand-file-name "Erc.el" user-emacs-directory))
(load (expand-file-name "elfeed.el" user-emacs-directory))
(load (expand-file-name "treesit.el" user-emacs-directory))
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; my own packages
(require 'org-remember)
(org-remember-mode 1)
(global-set-key (kbd "C-c r c") 'org-remember-capture)
(global-set-key (kbd "C-c r v") 'org-remember-view)
(global-set-key (kbd "C-c r s") 'org-remember-search)

