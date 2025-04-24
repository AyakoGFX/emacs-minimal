;; (use-package beframe
  ;; :ensure t)
;; (setq beframe-global-buffers '("*scratch*" "*Messages*" "*Backtrace*"))
;; (beframe-mode 1)

(use-package perspective
  :ensure t
  :bind
  ("C-x C-a" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c TAB"))  ; pick your own prefix key here
  :init
  (persp-mode))


;; (use-package tab-bar
;;   :ensure nil
;;   :init
;;   (setq tab-bar-height 30
;;         ;; tab-bar-new-tab-choice "*dashboard*"
;;         tab-bar-show 1
;;         ;; tab-bar-close-button-show nil
;;         tab-bar-select-tab-modifiers '(meta) ;; set to alt + 1-9 (alt = meta)
;;         tab-bar-tab-hints t)
;;   (run-at-time "1 sec" nil
;;                (lambda ()
;;  		 (set-face-attribute 'tab-bar nil :font "Monospace-12")))) ;; set font size for tab-bar-mode
;; (tab-bar-mode 1)  ; Activate tab bar mode

;; (use-package tabspaces
;;   :ensure t
;;   :hook (after-init . tabspaces-mode) ;; use this only if you want the minor-mode loaded at startup. 
;;   :commands (tabspaces-switch-or-create-workspace
;;              tabspaces-open-or-create-project-and-workspace)
;;   :custom
;;   (tabspaces-use-filtered-buffers-as-default t)
;;   (tabspaces-default-tab "Default")
;;   (tabspaces-remove-to-default t)
;;   (tabspaces-include-buffers '("*scratch*"))
;;   (tabspaces-initialize-project-with-todo t)
;;   (tabspaces-todo-file-name "project-todo.org")
;;   ;; sessions
;;   (tabspaces-session t)
;;   (tabspaces-session-auto-restore t)
;;   (tab-bar-new-tab-choice "*scratch*"))
