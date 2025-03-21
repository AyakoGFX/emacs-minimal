;;; simple-finance.el --- A simple finance tracking package -*- lexical-binding: t; -*-

(defvar simple-finance-transactions nil
  "List of finance transactions.")

(defvar simple-finance-file "~/finance.txt"
  "File to save finance transactions.")

(defun simple-finance-get-date ()
  "Return today's date or prompt to select a date."
  (if (y-or-n-p "Use today's date? ")
      (format-time-string "%Y-%m-%d")
    (let ((selected-date (calendar-read-date)))
      (format "%04d-%02d-%02d" (nth 2 selected-date) (nth 0 selected-date) (nth 1 selected-date)))))

(defun simple-finance-save-transaction (date type source amount)
  "Save a transaction to the file and record it."
  (let ((transaction (list date type source amount)))
    (push transaction simple-finance-transactions)
    (with-temp-buffer
      (insert (format "%s | %s | %s | %d\n" date type source amount))
      (append-to-file (point-min) (point-max) simple-finance-file))
    (message "Saved transaction: %s | %s | %s | %d" date type source amount)))

(defun simple-finance-add-som ()
  "Prompt for source of money and save it."
  (interactive)
  (let* ((date (simple-finance-get-date))
         (source (read-string "Source: "))
         (amount (read-number "Amount: ")))
    (simple-finance-save-transaction date "SOM" source amount)))

(defun simple-finance-add-soe ()
  "Prompt for source of expense and save it."
  (interactive)
  (let* ((date (simple-finance-get-date))
         (source (read-string "Source: "))
         (amount (read-number "Amount: ")))
    (simple-finance-save-transaction date "SOE" source amount)))

(defun simple-finance-calculate-totals ()
  "Calculate the total money saved and expenses grouped by source."
  (let ((totals (make-hash-table :test 'equal))
        (total-expenses 0))
    (dolist (transaction simple-finance-transactions)
      (let ((type (nth 1 transaction))
            (source (nth 2 transaction))
            (amount (nth 3 transaction)))
        (if (string= type "SOM")
            (puthash source (+ (gethash source totals 0) amount) totals)
          (setq total-expenses (+ total-expenses amount)))))
    (values totals total-expenses)))

(defun simple-finance-show-summary ()
  "Show the summary of money saved and money left by source."
  (interactive)
  (let* ((totals (simple-finance-calculate-totals))
         (total-expenses (nth 1 totals))
         (money-left 0)
         (summary ""))
    (maphash (lambda (source total)
               (setq summary (concat summary (format "Source: %s, Total Saved: %d\n" source total))
                     money-left (+ money-left total)))
             (nth 0 totals))
    (message "%sTotal Expenses: %d\nMoney Left: %d" summary total-expenses (- money-left total-expenses))))

(defun simple-finance-show-transactions ()
  "Display all transactions."
  (interactive)
  (if (file-exists-p simple-finance-file)
      (with-temp-buffer
        (insert-file-contents simple-finance-file)
        (let ((content (buffer-string)))
          (message "%s" content)))
    (message "No transactions recorded.")))

(transient-define-prefix simple-finance-transient ()
  "Finance tracking"
  ["Options"
   ("m" "Add Source of Money" simple-finance-add-som)
   ("e" "Add Source of Expense" simple-finance-add-soe)
   ("s" "Show Summary" simple-finance-show-summary)])

(provide 'simple-finance)
;;; simple-finance.el ends here
