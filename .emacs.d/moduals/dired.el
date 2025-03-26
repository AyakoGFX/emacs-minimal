 ;; Colorful dired
(use-package diredfl
  :ensure t)
;; (add-hook 'dired-mode-hook #'diredfl-mode)

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("b" . dired-up-directory))
  :config ; Guess a default target directory
  (setq dired-mouse-drag-files t
	dired-dwim-target t
	dired-omit-verbose nil
	delete-by-moving-to-trash t
        dired-recursive-deletes 'always
	dired-recursive-copies 'always
	dired-hide-details-hide-symlink-targets nil
	dired-kill-when-opening-new-dired-buffer t)
	
  ;; Show directory first
  (setq dired-listing-switches "-alh --group-directories-first"))

;; Hide the details in dired
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


