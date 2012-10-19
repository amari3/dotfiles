;; markdown-mode
;; Mac: brew install markdown
;; Linux: aptitude install markdown
;; (auto-install-from-url "http://jblevins.org/projects/markdown-mode/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
