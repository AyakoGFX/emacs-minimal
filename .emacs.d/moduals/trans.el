;; Set transparency for all frames (active and inactive)
(add-to-list 'default-frame-alist '(alpha . (90 . 90)))

;; Optional: Set transparency for the current frame
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

;; Define a function to toggle transparency
(defun toggle-transparency ()
  "Toggle transparency of the current frame."
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (if (equal alpha '(90 . 90)) ; Check if current transparency is 90%
        (set-frame-parameter nil 'alpha '(100 . 100)) ; Set to 100% opacity
      (set-frame-parameter nil 'alpha '(90 . 90))))) ; Set to 90% opacity

;; Bind the function to F5
(global-set-key (kbd "<f5>") 'toggle-transparency)
