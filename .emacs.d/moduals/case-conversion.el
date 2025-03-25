(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; Unbind C-x C-c
(global-unset-key (kbd "C-x C-c"))
;; Bind C-x C-c to upcase-initials-region
(global-set-key (kbd "C-x C-c") 'upcase-initials-region)


;; Emacs has commands for converting either a single word or any arbitrary range of text to upper case or to lower case.

;; M-l

;;     Convert following word to lower case (downcase-word). 
;; M-- M-l

;;     Convert previous/last word to lower case. Note: Meta-- is Meta-minus. 
;; M-u

;;     Convert following word to upper case (upcase-word). 
;; M-- M-u

;;     Convert previous/last last word to all upper case. 
;; M-c

;;     Capitalize the following word (capitalize-word). 
;; M-- M-c

;;     Convert previous/last last word to lower case with capital initial. 
;; C-x C-l

;;     Convert region to lower case (downcase-region). 
;; C-x C-u

;;     Convert region to upper case (upcase-region). 
