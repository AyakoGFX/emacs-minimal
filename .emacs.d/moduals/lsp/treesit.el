(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))


;; form https://ryanfleck.ca/posts/
;; Add the following to your configuration:
(setq treesit-language-source-alist
  '((elixir "https://github.com/elixir-lang/tree-sitter-elixir")
    (clojure "https://github.com/sogaiu/tree-sitter-clojure")
    (bash "https://github.com/tree-sitter/tree-sitter-bash")
    (cmake "https://github.com/uyha/tree-sitter-cmake")
    (c "https://github.com/tree-sitter/tree-sitter-c")
    (elisp "https://github.com/Wilfred/tree-sitter-elisp")
    (html "https://github.com/tree-sitter/tree-sitter-html")
    (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
    (json "https://github.com/tree-sitter/tree-sitter-json")
    (make "https://github.com/alemuller/tree-sitter-make")
    (markdown "https://github.com/ikatyang/tree-sitter-markdown")
    (python "https://github.com/tree-sitter/tree-sitter-python")))



