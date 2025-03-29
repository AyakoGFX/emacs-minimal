(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
                         :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
                         :build (:not compile))
  :custom
  (acm-enable-yas nil)
  (acm-enable-icon nil)
  (acm-enable-tabnine nil)
  (acm-enable-codeium nil)
  (acm-enable-capf t)
  (acm-enable-search-file-words nil)
  (acm-doc-frame-max-lines 25)
  (lsp-bridge-nix-lsp-server "nil")
  (lsp-bridge-enable-hover-diagnostic t)
  (lsp-bridge-code-action-enable-popup-menu nil)
  (lsp-bridge-enable-inlay-hint nil)
  (lsp-bridge-inlay-hint-overlays '())
  :init
  (setq-default lsp-bridge-enable-inlay-hint nil)
  (global-lsp-bridge-mode)
  (let ((filtered-list (cl-delete 'lsp-bridge-not-match-hide-characters lsp-bridge-completion-popup-predicates)))
    (setq lsp-bridge-completion-popup-predicates filtered-list))
  ;; <ret> is very annoying because lsp-bridge is too fast, unset it
  (keymap-unset acm-mode-map "RET")
  (define-key lsp-bridge-mode-map (kbd "C-l e") 'lsp-bridge-diagnostic-jump-next)
  (define-key lsp-bridge-mode-map (kbd "C-l f") 'lsp-bridge-find-def)
  (define-key lsp-bridge-mode-map (kbd "C-l n") 'lsp-bridge-rename)
  (define-key lsp-bridge-mode-map (kbd "C-l a") 'lsp-bridge-code-action)
  (define-key lsp-bridge-mode-map (kbd "C-l r") 'lsp-bridge-find-references)
  (define-key lsp-bridge-mode-map (kbd "C-l h") 'lsp-bridge-popup-documentation))
