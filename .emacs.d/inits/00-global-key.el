;;; key config

;; exchange alt <-> meta
(custom-set-variables
 '(ns-alternate-modifier 'alt)
 '(ns-command-modifier 'meta))

;; global-set-key
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)
(define-key global-map (kbd "C-c ;") 'comment-region)
(define-key global-map (kbd "C-t") 'dabbrev-expand)
(define-key global-map (kbd "C-c g") 'goto-line)
(define-key global-map (kbd "C-x C-h") 'help)

;; sticky
;; (auto-install-from-emacswiki "sticky.el")
(require 'sticky)
(use-sticky-key ?\; sticky-alist:en)

