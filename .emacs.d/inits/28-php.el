;;; PHP

;; php-mode
;; (auto-install-from-url "http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el")
(require 'php-mode)

(setq php-mode-force-pear t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(add-hook 'php-mode-hook
          (lambda ()
            (defun ywb-php-lineup-arglist-intro (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (+ (current-column) c-basic-offset))))
            (defun ywb-php-lineup-arglist-close (langelem)
              (save-excursion
                (goto-char (cdr langelem))
                (vector (current-column))))
            (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
            (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)))

;; php-completion
;; M-x auto-install-batch <RET>
;; Extenstion name: php-completion <RET>
(add-hook 'php-mode-hook
          (lambda ()
            (require 'php-completion)
            (php-completion-mode t)
            (define-key php-mode-map (kbd "\C-co") 'phpcmp-complete)
            (make-local-variable 'ac-sources)
            (setq ac-sources '(
                               ac-source-words-in-same-mode-buffers
                               ac-source-php-completion
                               ac-source-filename
                               ))))
