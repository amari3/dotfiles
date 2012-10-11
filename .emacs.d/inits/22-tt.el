;;; tt-mode
; (auto-install-from-url "http://dave.org.uk/emacs/tt-mode.el")
(load "tt-mode.el")
(setq auto-mode-alist (append '(("\\.tt$" . tt-mode)) auto-mode-alist ))
(setq auto-mode-alist (append '(("\\.tt2$" . tt-mode)) auto-mode-alist ))
