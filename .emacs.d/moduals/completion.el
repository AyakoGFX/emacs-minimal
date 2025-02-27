   (use-package compat
     :ensure t)

  (use-package vertico
    :ensure t
    :custom
    (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
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
    (enable-recursive-minibuffers t)
    (read-extended-command-predicate #'command-completion-default-include-p)
    :init
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
