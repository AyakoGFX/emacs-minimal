;;(when (eq system-type 'gnu/linux)
;;  (use-package jinx  
;;    :ensure t  
;;    :hook (emacs-startup . global-jinx-mode))
;;
;;  ;; Jinx keybindings
;;  (global-set-key (kbd "C-c s s") 'jinx-correct)
;;  (global-set-key (kbd "C-c s n") 'jinx-next)
;;  (global-set-key (kbd "C-c s p") 'jinx-previous)
;;  (global-set-key (kbd "C-c s l") 'jinx-languages)
;;  (global-set-key (kbd "C-c s a") 'jinx-correct-all)
;;  (global-set-key (kbd "C-c s w") 'jinx-correct-word)
;;  (global-set-key (kbd "C-c s N") 'jinx-correct-nearest))

(use-package flyspell-correct
  :ensure t)
(define-key flyspell-mode-map (kbd "C-=") #'flyspell-correct-wrapper)

(setq ispell-program-name "hunspell")
(setq ispell-dictionary "en_US") ;; Change to your preferred language

;; Enable Flyspell mode globally
 (add-hook 'text-mode-hook #'flyspell-mode)
 (add-hook 'prog-mode-hook #'flyspell-prog-mode)

(with-eval-after-load 'flyspell
  (define-key flyspell-mode-map (kbd "C-;") nil))
