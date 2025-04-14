(use-package elfeed-autotag
  :ensure t)
(setq elfeed-search-title-max-width 100)
(setq elfeed-feeds (quote
                    (("https://www.reddit.com/r/linux.rss" reddit linux)
                     ("https://www.reddit.com/r/commandline.rss" reddit commandline)
                     ;; ("https://www.reddit.com/r/distrotube.rss" reddit distrotube)
                     ("https://www.reddit.com/r/emacs.rss" reddit emacs)
                     ("https://www.gamingonlinux.com/article_rss.php" gaming linux)
                     ("https://hackaday.com/blog/feed/" hackaday linux)
                     ("https://opensource.com/feed" opensource linux)
                     ("https://linux.softpedia.com/backend.xml" softpedia linux)
                     ("https://itsfoss.com/feed/" itsfoss linux)
                     ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
                     ("https://www.phoronix.com/rss.php" phoronix linux)
                     ("http://feeds.feedburner.com/d0od" omgubuntu linux)
                     ("https://www.computerworld.com/index.rss" computerworld linux)
                     ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
                     ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
                     ("https://betanews.com/feed" betanews linux)
                     ("http://lxer.com/module/newswire/headlines.rss" lxer linux))))

;; (defun my/elfeed-print-entry (entry)
;;   "Custom Elfeed entry display without tags and feed name, keeping colors."
;;   (let* ((title (elfeed-entry-title entry))
;;          (date (elfeed-search-format-date (elfeed-entry-date entry)))
;;          (tags (elfeed-entry-tags entry))
;;          (unread (memq 'unread tags))
;;          (title-faces (if unread '(elfeed-search-title-face bold) 'elfeed-search-title-face))
;;          (date-faces 'elfeed-search-date-face))
;;     (insert (propertize date 'face date-faces) "  "
;;             (propertize title 'face title-faces))))

;; (setq elfeed-search-print-entry-function #'my/elfeed-print-entry)












