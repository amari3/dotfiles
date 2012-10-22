;;; tt-mode
;; (auto-install-from-url "http://dave.org.uk/emacs/tt-mode.el")
(autoload 'tt-mode "tt-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))
