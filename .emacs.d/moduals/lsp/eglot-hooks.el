(add-hook 'LaTeX-mode 'eglot-ensure)        ;; latex
(add-hook 'c-mode-hook 'eglot-ensure)        ;; C
(add-hook 'c++-mode-hook 'eglot-ensure)      ;; C++
(add-hook 'bibtex-mode-hook 'eglot-ensure)    
(add-hook 'go-ts-mode-hook 'eglot-ensure)    ;;go
