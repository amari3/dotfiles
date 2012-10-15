;;; Perl

;; cperl-mode
;; (require 'cperl-mode)
(autoload 'cperl-mode "cperl-mode" nil t)
(eval-after-load "cperl-mode"
  '(progn
     ;; indentation
     (setq cperl-indent-level 4)
     ;; key config
     (define-key cperl-mode-map (kbd ";") nil)))
(defalias 'perl-mode 'cperl-mode)
(setq cperl-close-paren-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-indent-parens-as-block t)
(setq cperl-tab-always-indent t)
(setq cperl-auto-newline t)
(setq cperl-autoindent-on-semi t)
(setq cperl-highlight-variables-indiscriminately t)
(setq cperl-font-lock t)

;; perl-completion
;; (auto-install-from-emacswiki "perl-completion.el")
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)
            (flymake-mode t)))

;; auto-complete
;; (auto-install-batch "auto-complete development version")
(add-hook 'cperl-mode-hook
          (lambda ()
            (when (require 'auto-complete nil t)
              (auto-complete-mode t)
              (make-variable-buffer-local 'ac-sources)
              (setq ac-sources
                    '(ac-source-perl-completion)))))
