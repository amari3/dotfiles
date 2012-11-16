;;; key config

;; exchange alt <-> meta
(custom-set-variables
 '(ns-alternate-modifier 'alt)
 '(ns-command-modifier 'meta))

;; global-set-key
(define-key global-map (kbd "C-h") 'delete-backward-char)
(define-key global-map (kbd "C-o") 'other-window)
(define-key global-map (kbd "C-c ;") 'comment-or-uncomment-region)
(define-key global-map (kbd "C-c C-i") 'dabbrev-expand)
(define-key global-map (kbd "C-x C-h") 'help)
(define-key global-map (kbd "C-m") 'newline-and-indent)
(define-key global-map (kbd "C-j") 'newline)
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)

;; sticky
;; (auto-install-from-emacswiki "sticky.el")
;; (require 'sticky)
;; (use-sticky-key ?\; sticky-alist:en)
