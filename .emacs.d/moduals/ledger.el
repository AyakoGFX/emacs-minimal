(use-package ledger-mode
  :ensure t
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((ledger . t)))
  :mode ("\\.dat\\'"
         "\\.ledger\\'"
         "\\.lgr\\'")
  :custom (ledger-clear-whole-transactions t))

(use-package flycheck-ledger :after ledger-mode)

(add-hook 'ledger-mode-hook (lambda () (flyspell-mode -1)))  ;; off flyspell in ledger-mode
