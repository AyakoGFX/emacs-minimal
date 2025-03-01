;; Set transparency for all frames
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;; Optional: Set transparency for the current frame
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

(defun toggle-transparency ()
  "Toggle transparency of the current frame."
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (if (eql (cond ((numberp alpha) alpha)
                   ((numberp (cdr alpha)) (cdr alpha))
                   ;; Also handle inactive alpha.
                   ((numberp (cadr alpha)) (cadr alpha)))
        100)
        (set-frame-parameter nil 'alpha '(90 . 90)) ; Set to 90% opacity
      (set-frame-parameter nil 'alpha '(100 . 100))))) ; Set to 100% opacity

(global-set-key (kbd "<f5>") 'toggle-transparency)
