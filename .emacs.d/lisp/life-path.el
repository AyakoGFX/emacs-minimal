;;; life-path.el --- Simple numerology life path calculator -*- lexical-binding: t -*-

(defvar life-path--traits
  '((1 . ("Leader, ambitious, independent" . "Bossy, impatient"))
    (2 . ("Diplomatic, caring, cooperative" . "Sensitive, indecisive"))
    (3 . ("Creative, social, optimistic" . "Superficial, scattered"))
    (4 . ("Practical, hardworking, loyal" . "Stubborn, rigid"))
    (5 . ("Adventurous, free, curious" . "Restless, impulsive"))
    (6 . ("Nurturing, responsible, loving" . "Self-sacrificing, controlling"))
    (7 . ("Analytical, spiritual, wise" . "Reclusive, skeptical"))
    (8 . ("Powerful, successful, ambitious" . "Materialistic, domineering"))
    (9 . ("Compassionate, idealistic, wise" . "Moody, naive"))
    (11 . ("Visionary, inspiring, intuitive" . "Anxious, overly intense"))
    (22 . ("Master builder, leader, practical" . "Overworked, overwhelmed"))))

(defun life-path--reduce (n)
  (if (member n '(11 22))
      n
    (while (> n 9)
      (setq n (apply #'+ (mapcar #'string-to-number (split-string (number-to-string n) "")))))
    n))

(defun life-path--date-parts (day month year)
  (let ((day-val (life-path--reduce day))
        (month-val (life-path--reduce month))
        (year-val (life-path--reduce
                   (apply #'+ (mapcar #'string-to-number (split-string (number-to-string year) ""))))))
    (life-path--reduce (+ day-val month-val year-val))))

;;;###autoload
(defun life-path-calculate ()
  "Prompt for DOB and calculate Life Path number."
  (interactive)
  (let* ((day (read-number "Day (1–31): "))
         (month (read-number "Month (1–12): "))
         (year (read-number "Year (e.g., 1990): "))
         (lp (life-path--date-parts day month year))
         (traits (assoc lp life-path--traits)))
    (if traits
        (message "Life Path Number: %s\nStrengths: %s\nWeaknesses: %s"
                 lp (car (cdr traits)) (cdr (cdr traits)))
      (message "Life Path Number: %s\n(No trait info found)" lp))))

(provide 'life-path)
;;; life-path.el ends here
