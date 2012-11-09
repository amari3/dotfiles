;;; Markdown

;; markdown-mode
;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")
;; to install markdown command
;; Mac: brew install markdown
;; Linux (deb): aptitude install markdown
(autoload 'markdown-mode "markdown-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
