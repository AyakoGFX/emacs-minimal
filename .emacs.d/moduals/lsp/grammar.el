;; (use-package flymake-proselint
;;   :ensure t)

;; (add-hook 'text-mode-hook (lambda ()
;;                             (flymake-mode)
;;                             (flymake-proselint-setup)))


;; (with-eval-after-load 'eglot
;;   (add-hook 'text-mode #'eglot-ensure)
;;   (add-to-list 'eglot-server-programs
;;                '(text-mode . ("harper-ls" "--stdio"))))
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(text-mode . ("harper-ls" "--stdio"))))

(setq-default eglot-workspace-configuration
              `(:settings
                (:harper-ls (:userDictPath ""
                            :fileDictPath ""
                            :linters (:SpellCheck t
                                                  :SpelledNumbers nil
                                                  :AnA t
                                                  :SentenceCapitalization t
                                                  :UnclosedQuotes t
                                                  :WrongQuotes nil
                                                  :LongSentences t
                                                  :RepeatedWords t
                                                  :Spaces t
                                                  :Matcher t
                                                  :CorrectNumberSuffix t)
                            :codeActions (:ForceStable nil)
                            :markdown (:IgnoreLinkTitle nil)
                            :diagnosticSeverity "hint"
                            :isolateEnglish nil))))


