;;; Flymake
(require 'flymake)

(setq flymake-gui-warnings-enabled nil)

(global-set-key "\M-p" 'flymake-goto-prev-error)
(global-set-key "\M-n" 'flymake-goto-next-error)

(global-set-key "\C-cd" 'flymake-display-err-menu-for-current-line)
(set-face-background 'flymake-errline "red3")
(set-face-background 'flymake-warnline "orange3")
