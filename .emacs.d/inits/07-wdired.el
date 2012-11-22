;;; wdired
;; (auto-install-from-emacswiki "wdired.el")

(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(global-set-key "\C-x\C-d" 'dired)
