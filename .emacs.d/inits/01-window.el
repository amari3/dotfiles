;;; window

(custom-set-variables
 '(initial-frame-alist '((width . 80) (height . 48) (left . 560) (top . 0))) ; maximum size
 '(tool-bar-mode nil)) ; hide tool bar

(setq inhibit-startup-message t)

;; line spacing
(setq-default line-spacing 0)

;; color
(set-background-color "black")
(set-foreground-color "white")

;; global font lock
(global-font-lock-mode t)
(set-face-foreground 'font-lock-comment-face "darkolivegreen3")
(set-face-foreground 'font-lock-string-face  "coral")
(set-face-foreground 'font-lock-keyword-face "violet")
(set-face-foreground 'font-lock-function-name-face "white")
(set-face-foreground 'font-lock-variable-name-face "white")
(set-face-foreground 'font-lock-type-face "skyblue1")
(set-face-foreground 'font-lock-warning-face "yellow")
(set-face-foreground 'font-lock-builtin-face "goldenrod")
(set-face-background 'highlight "yellow")
(set-face-foreground 'highlight "black")
(set-face-background 'region "lightgoldenrod2")

