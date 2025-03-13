(add-hook 'LaTeX-mode 'eglot-ensure)        ;; latex
(add-hook 'c-mode-hook 'eglot-ensure)        ;; C
(add-hook 'c++-mode-hook 'eglot-ensure)      ;; C++
(add-hook 'bibtex-mode-hook 'eglot-ensure)    
(add-hook 'go-ts-mode-hook 'eglot-ensure)    ;;go

(add-hook 'js-ts-mode  'eglot-ensure)
(add-hook 'tsx-ts-mode  'eglot-ensure)
(add-hook 'typescript-ts-mode  'eglot-ensure)


;; (add-to-list 'major-mode-remap-alist
;;              '(typescript-mode . typescript-ts-mode))



