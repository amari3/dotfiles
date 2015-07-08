;;; editing config

(setq-default truncate-lines t ; truncate line
              tab-width 4 ; tab width
              indent-tabs-mode nil ; no use tab
              find-file-visit-truename t) ; visit truename

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

;; auto-complete
;; (auto-install-batch "auto-complete development version")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(custom-set-variables
  '(ac-use-menu-map t)
   '(ac-dictionary-directories '("~/.emacs.d/etc/ac-dict")))
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(define-key ac-menu-map (kbd "M-TAB") nil)

;; scroll
(setq scroll-step 1)
(set-scroll-bar-mode 'right)

;; copy/paste
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
