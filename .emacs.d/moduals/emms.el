(use-package emms
  :ensure t)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(setq emms-volume-change-amount 2)  ; You can adjust this value as needed
;; (setq emms-player-list '(emms-player-mpg321
;;                          emms-player-ogg123
;;                          emms-player-mpv
;;                          emms-player-mplayer))

(setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")
(define-key emms-playlist-mode-map (kbd "+") nil)
(define-key emms-playlist-mode-map (kbd "=") #'emms-volume-raise)

(global-set-key (kbd "C-x m") 'emms)
(global-set-key (kbd "C-c s p") 'emms-pause)
(global-set-key (kbd "C-c s n") 'emms-next)
(global-set-key (kbd "C-c s s") 'emms-stop)
(global-set-key (kbd "C-c s m") 'emms-mark-all)
(global-set-key (kbd "C-c s a") 'emms-add-file)
(global-set-key (kbd "C-c s f") 'emms-add-dired)
(global-set-key (kbd "C-c s t") 'emms-toggle-repeat-track)
(global-set-key (kbd "C-c s r") 'emms-previous)


(defun track-title-from-file-name (file)
  "For using with EMMS description functions. Extracts the track
title from the file name FILE, which just means a) taking only
the file component at the end of the path, and b) removing any
file extension."
  (with-temp-buffer
    (save-excursion (insert (file-name-nondirectory (directory-file-name file))))
    (ignore-error 'search-failed
      (search-forward-regexp (rx "." (+ alnum) eol))
      (delete-region (match-beginning 0) (match-end 0)))
    (buffer-string)))

(defun my-emms-track-description (track)
  "Return a description of TRACK, for EMMS, but try to cut just
the track name from the file name, and just use the file name too
rather than the whole path."
  (let ((artist (emms-track-get track 'info-artist))
        (title (emms-track-get track 'info-title)))
    (cond ((and artist title)
           (concat artist " - " title))
          (title title)
          ((eq (emms-track-type track) 'file)
           (track-title-from-file-name (emms-track-name track)))
          (t (emms-track-simple-description track)))))

(setq emms-track-description-function 'my-emms-track-description)
