(defun play-sound-with-paplay (file)
  "Play a sound file using paplay."
  (let ((sound-file (expand-file-name file "~/.emacs.d/sounds/")))
    (if (file-exists-p sound-file)
        (start-process "sound-player" nil "paplay" sound-file)
      (message "Sound file not found: %s" sound-file))))

(advice-add 'kill-region :after (lambda (&rest _) (play-sound-with-paplay "CUT.wav")))
(advice-add 'kill-ring-save :after (lambda (&rest _) (play-sound-with-paplay "COPY.wav")))
(advice-add 'yank :after (lambda (&rest _) (play-sound-with-paplay "PAST.wav")))

;; (play-sound-with-paplay "CUT.wav")
