;; Hide Org emphasis markers for cleaner display
(setq org-hide-emphasis-markers t)

(custom-set-faces
 ;; Font sizes and colors for Org mode headers using theme colors
 '(org-level-1 ((t (:height 1.4  :inherit outline-1 ultra-bold))))
 '(org-level-2 ((t (:height 1.3  :inherit outline-2 extra-bold))))
 '(org-level-3 ((t (:height 1.2  :inherit outline-3 bold))))
 '(org-level-4 ((t (:height 1.0  :inherit outline-4 semi-bold))))
 '(org-level-5 ((t (:height 1.0  :inherit outline-5 normal))))
 '(org-level-6 ((t (:height 0.9  :inherit outline-6 normal))))
 '(org-level-7 ((t (:height 0.9  :inherit outline-7 normal))))
 '(org-level-8 ((t (:height 0.9  :inherit outline-8 normal))))
 ;; more levels and colors as needed
 )

;; Block Templates
;; This is needed as of Org 9.2
(use-package org-tempo
  :ensure nil
  :config
  (add-to-list 'org-structure-template-alist '("sh" . "src sh"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("li" . "src lisp"))
  (add-to-list 'org-structure-template-alist '("sc" . "src scheme"))
  (add-to-list 'org-structure-template-alist '("ts" . "src typescript"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("go" . "src go"))
  (add-to-list 'org-structure-template-alist '("yaml" . "src yaml"))
  (add-to-list 'org-structure-template-alist '("json" . "src json")))
