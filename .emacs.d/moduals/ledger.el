(use-package ledger-mode
  :ensure t
  :mode ("\\.dat\\'"
         "\\.ledger\\'")
  :custom (ledger-clear-whole-transactions t))

(use-package flycheck-ledger :after ledger-mode)
