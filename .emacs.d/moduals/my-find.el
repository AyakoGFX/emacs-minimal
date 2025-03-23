;; TODO add `grep' project and current directory and recursively
;; TODO add project eshell 
(defun my/find-file-recursively ()
  "Find a file recursively, using `fd` or `find`."
  (interactive)
  (let* ((default-directory (or (vc-root-dir) default-directory))
         (files (if (executable-find "fd")
                    (split-string (shell-command-to-string "fd --type f --hidden --follow --exclude .git") "\n" t)
                  (split-string (shell-command-to-string "find . -type f 2>/dev/null") "\n" t))))
    (find-file (completing-read "Find file: " files nil t))))

(defun my/find-dir-recursively ()
  "Find a directory recursively, using `fd` or `find`."
  (interactive)
  (let* ((default-directory (or (vc-root-dir) default-directory))
         (dirs (if (executable-find "fd")
                   (split-string (shell-command-to-string "fd --type d --hidden --follow --exclude .git") "\n" t)
                 (split-string (shell-command-to-string "find . -type d 2>/dev/null") "\n" t))))
    (dired (completing-read "Find directory: " dirs nil t))))


(defun my/find-project-root ()
  "Find the project root directory by searching for a `.mp` file or checking for a Git repository."
  (let ((current-dir (expand-file-name default-directory)))
    (while (and (not (file-exists-p (expand-file-name ".mp" current-dir)))
                (not (vc-git-root current-dir))  ;; Check if current-dir is part of a Git repo
                (not (string= current-dir "/")))
      (setq current-dir (file-name-directory (directory-file-name current-dir))))
    (if (or (file-exists-p (expand-file-name ".mp" current-dir))
            (vc-git-root current-dir))  ;; Check if we found a Git root
        current-dir
      nil)))

(defun my/find-file-in-project ()
  "Find a file in the project based on the `.mp` marker."
  (interactive)
  (let ((project-root (my/find-project-root)))
    (if project-root
        (let* ((default-directory project-root)
               (files (directory-files-recursively project-root ".*" t)))
          (find-file (completing-read "Find file in project: " files nil t)))
      (error "No project found"))))

(defun my/find-dir-in-project ()
  "Find a directory in the project based on the `.mp` marker."
  (interactive)
  (let ((project-root (my/find-project-root)))
    (if project-root
        (let* ((default-directory project-root)
               (dirs (directory-files-recursively project-root ".*" t)))
          (dired (completing-read "Find directory in project: " dirs nil t)))
      (error "No project found"))))


(define-key emacs-lisp-mode-map (kbd "C-c C-f") nil) ;; unbind
(global-set-key (kbd "C-c C-f") 'my/find-file-recursively)
(global-set-key (kbd "C-c C-d") 'my/find-dir-recursively)
(global-set-key (kbd "C-c C-F") 'my/find-file-in-project)
(global-set-key (kbd "C-c C-D") 'my/find-dir-in-project)









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defun my/find-file-recursively ()
;;   "Find a file recursively starting from the current directory."
;;   (interactive)
;;   (let* ((default-directory (or (vc-root-dir) default-directory))
;;          (files (directory-files-recursively default-directory ".*" t)))
;;     (find-file (completing-read "Find file: " files nil t))))

;; (defun my/find-dir-recursively ()
;;   "Find a directory recursively starting from the current directory."
;;   (interactive)
;;   (let* ((default-directory (or (vc-root-dir) default-directory))
;;          (dirs (seq-filter #'file-directory-p
;;                            (directory-files-recursively default-directory ".*" t))))
;;     (dired (completing-read "Find directory: " dirs nil t))))
