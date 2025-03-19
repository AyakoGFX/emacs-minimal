(setq shr-color-visible-luminance-min 70)
(setq  shr-use-colors nil
       ;; browse-url-browser-function 'eww-browse-url
       shr-bullet "• "
       shr-folding-mode t
       eww-search-prefix "https://duckduckgo.com/html?q="
       url-privacy-level '(email agent cookies lastloc))

(defvar my/recommended-sites nil
  "List of recommended websites for EWW.")

(defun my/add-recommended-site (title link)
  "Add a TITLE and LINK to the recommended sites list."
  (add-to-list 'my/recommended-sites (cons title link)))

(defun my/open-recommended-links ()
  "Choose and open a recommended website in EWW."
  (interactive)
  (if my/recommended-sites
      (let* ((site (completing-read "Choose a site: "
                                    (mapcar 'car my/recommended-sites)))
             (url (cdr (assoc site my/recommended-sites))))
        (if url
            (eww url)
          (message "No URL found for the selected site.")))
    (message "No recommended sites available.")))

;; Add your recommended sites here
(my/add-recommended-site "Sam Shamoun YouTube Channel" "https://www.youtube.com/@shamounian")
(my/add-recommended-site "Answering Islam Blog" "https://answeringislamblog.wordpress.com/")
(my/add-recommended-site "Answering Islam - Sam Shamoun" "https://www.answering-islam.org/authors/shamoun.html")
(my/add-recommended-site "Common Questions Answered by Sam Shamoun" "https://answeringislam.info/Shamoun/index.htm#common_questions")
(my/add-recommended-site "Bible Gateway" "https://www.biblegateway.com/")
(my/add-recommended-site "Step Bible" "https://www.stepbible.org/")
(my/add-recommended-site "Qb.gomen" "http://qb.gomen.org/QuranBrowser/")
(my/add-recommended-site "Sunnah.com" "https://sunnah.com/")
(my/add-recommended-site "Quran.com" "https://quran.com/")
(my/add-recommended-site "Google" "https://google.com")
(my/add-recommended-site "IslamAwakened" "https://www.islamawakened.com/quran/12/111/default.htm")

(global-set-key (kbd "C-c w") 'my/open-recommended-links) ;; Bind to `C-c w`

(defun my/eww-toggle-images ()
  "Toggle whether images are loaded and reload the current page fro cache."
  (interactive)
  (setq-local shr-inhibit-images (not shr-inhibit-images))
  (eww-reload t)
  (message "Images are now %s"
           (if shr-inhibit-images "off" "on")))

(define-key eww-mode-map (kbd "I") #'my/eww-toggle-images)
(define-key eww-link-keymap (kbd "I") #'my/eww-toggle-images)

;; minimal rendering by default
;; (setq-default shr-inhibit-images nil)   ; toggle with `I`
;; (setq-default shr-use-fonts nil)      ; toggle with `F`
