(use-package pdf-tools
  :ensure t
  :mode
  (("\\.pdf$" . pdf-view-mode))
  :custom
  pdf-annot-activate-created-annotations t 
  pdf-view-resize-factor 1.1
  :bind
  (:map pdf-view-mode-map
        ;; normal isearch
	("C-s" . isearch-forward)
        ;; custom keys 
	("h" . pdf-annot-activate-created-annotations)
	("t" . pdf-annot-add-text-annotation)
	("D" . pdf-annot-delete))
  :hook
  ((pdf-view-mode) . (lambda () (cua-mode 0)))
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-page))
(add-hook 'pdf-view-mode-hook (lambda () (display-line-numbers-mode -1)))

;; https://github.com/fuxialexander/org-pdftools
;; Usage
;; [[pdf:~/file.pdf::3][Link to page 3]]
(use-package org-noter
  :ensure t
  :config
  ;; Your org-noter config ........
  (require 'org-noter-pdftools))

(use-package org-pdftools
  :ensure t
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-noter-pdftools
  :ensure t
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freepointer-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))
