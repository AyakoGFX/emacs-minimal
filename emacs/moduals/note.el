  ;; do not format this
  (setq denote-org-front-matter
"#+TITLE:      %s
#+DATE:       %s
#+FILETAGS:   %s
#+IDENTIFIER: %s
\n")


(setq org-agenda-files (list "~/denote/org/agenda.org"))
(global-set-key (kbd "C-c a") 'org-agenda)
;; open org-agenda-files
(global-set-key (kbd "C-c o")
		(lambda ()
		  (interactive)
		  (find-file (car org-agenda-files))))

  ;; migerate all org roam notes to denote
  ;; (load-file "~/.emacs.d/manual/nm-org-roam-to-denote.el")

  (use-package denote
    :ensure t)
  ;; Remember to check the doc strings of those variables.
  (setq denote-directory (expand-file-name "~/denote/"))
  (setq denote-known-keywords '("emacs" "philosophy" "politics" "economics"))
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  (setq denote-file-type nil) ; Org is the default, set others here
  (setq denote-prompts '(subdirectory title keywords))
  (setq denote-excluded-directories-regexp nil)
  (setq denote-excluded-keywords-regexp nil)
  (setq denote-rename-confirmations '(rewrite-front-matter modify-file-name))
  (setq denote-save-buffer t)
  ;; Pick dates, where relevant, with Org's advanced interface:
  (setq denote-date-prompt-use-org-read-date t)
  (setq denote-date-format nil) ; read doc string
  (setq denote-backlinks-show-context t)
  (add-hook 'text-mode-hook #'denote-fontify-links-mode-maybe)
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
;; (add-hook 'dired-mode-hook #'denote-dired-mode) ;; on in dired
  (denote-rename-buffer-mode 1)

  (let ((map global-map))
    (define-key map (kbd "C-c d n") #'denote)
    (define-key map (kbd "C-c d c") #'denote-region) ; "contents" mnemonic
    (define-key map (kbd "C-c d N") #'denote-type)
    (define-key map (kbd "C-c d d") #'denote-date)
    (define-key map (kbd "C-c d z") #'denote-signature) ; "zettelkasten" mnemonic
    (define-key map (kbd "C-c d s") #'denote-subdirectory)
    (define-key map (kbd "C-c d t") #'denote-template)
    ;; If you intend to use Denote with a variety of file types, it is
    ;; easier to bind the link-related commands to the `global-map', as
    ;; shown here.  Otherwise follow the same pattern for `org-mode-map',
    ;; `markdown-mode-map', and/or `text-mode-map'.
    (define-key map (kbd "C-c d i") 'denote-link-or-create) ; "insert" mnemonic
    (define-key map (kbd "C-c d I") #'denote-add-links)
    (define-key map (kbd "C-c d b") #'denote-backlinks)
    (define-key map (kbd "C-c d f f") #'denote-find-link)
    (define-key map (kbd "C-c d f b") #'denote-find-backlink)
    ;; Note that `denote-rename-file' can work from any context, not just
    ;; Dired bufffers.  That is why we bind it here to the `global-map'.
    (define-key map (kbd "C-c d r") #'denote-rename-file)
    (define-key map (kbd "C-c d R") #'denote-rename-file-using-front-matter))

  ;; Key bindings specifically for Dired.
  (let ((map dired-mode-map))
    (define-key map (kbd "C-c C-d C-i") #'denote-link-dired-marked-notes)
    (define-key map (kbd "C-c C-d C-r") #'denote-dired-rename-files)
    (define-key map (kbd "C-c C-d C-k") #'denote-dired-rename-marked-files-with-keywords)
    (define-key map (kbd "C-c C-d C-R") #'denote-dired-rename-marked-files-using-front-matter))

  (with-eval-after-load 'org-capture
    (setq denote-org-capture-specifiers "%l\n%i\n%?")
    (add-to-list 'org-capture-templates
		 '("n" "New note (with denote.el)" plain
		   (file denote-last-path)
		   #'denote-org-capture
		   :no-save t
		   :immediate-finish nil
		   :kill-buffer t
		   :jump-to-captured t)))

  ;; Also check the commands `denote-link-after-creating',
  ;; `denote-link-or-create'.  You may want to bind them to keys as well.


  ;; If you want to have Denote commands available via a right click
  ;; context menu, use the following and then enable
  ;; `context-menu-mode'.
  (add-hook 'context-menu-functions #'denote-context-menu)

  (use-package denote-menu
    :ensure t)
  (setq denote-menu-title-column-width 60) ;; <-- default is 85
  (setq denote-menu-date-column-width 17)         ; Set to 17
  (setq denote-menu-signature-column-width 10)    ; Set to 10
  (setq denote-menu-keywords-column-width 30)      ; Set to 30

  (global-set-key (kbd "C-c z") #'list-denotes)

  (define-key denote-menu-mode-map (kbd "c") #'denote-menu-clear-filters)
  (define-key denote-menu-mode-map (kbd "f") #'denote-menu-filter)
  (define-key denote-menu-mode-map (kbd "k") #'denote-menu-filter-by-keyword)
  (define-key denote-menu-mode-map (kbd "o") #'denote-menu-filter-out-keyword)
  (define-key denote-menu-mode-map (kbd "e") #'denote-menu-export-to-dired)
  (define-key denote-menu-mode-map (kbd "l") #'my-denote-list-all-keywords)
  (define-key denote-menu-mode-map (kbd "s") #'denote-menu-filter-subdir)
  (define-key global-map (kbd "C-c d l") #'my-denote-list-all-keywords)

  (defun denote-menu-filter-subdir (subdir)
  "Filter `denote-menu' entries to files within SUBDIR.
SUBDIR is chosen interactively relative to `denote-directory'."
  (interactive
   (list (read-directory-name "Choose subdirectory: " denote-directory)))
  (let* ((absolute-subdir (expand-file-name subdir))
         (matching-files (seq-filter
                          (lambda (file)
                            (string-prefix-p absolute-subdir (file-name-directory file)))
                          (denote-directory-files))))
    (setq tabulated-list-entries
          (lambda ()
            (mapcar #'denote-menu--path-to-entry matching-files)))
    (revert-buffer)))


  ;; list all the keywords = #+FILETAGS
(defun my-denote-list-all-keywords ()
  "List all unique keywords used in Denote files recursively and show them in the message buffer."
  (interactive)
  (let* ((files (directory-files-recursively (denote-directory) "\\..*$"))
         (all-keywords '()))
    (dolist (file files)
      (when-let ((keywords (denote-retrieve-filename-keywords file)))
        (setq all-keywords
              (append all-keywords
                      (mapcar (lambda (kw)
                                (split-string 
                                 (replace-regexp-in-string "_" " " kw) 
                                 " " t))
                              (split-string keywords "--" t))))))
    (message "All keywords: %s"
             (string-join 
              (delete-dups 
               (sort (cl-remove-duplicates (apply #'append all-keywords)
                                           :test #'string-equal)
                     #'string-lessp))
              ", "))))
