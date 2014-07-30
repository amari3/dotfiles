;;; sr-speedbar
;; package-install RET sr-speedbar

(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(global-set-key (kbd "C-^") 'sr-speedbar-toggle)

(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension '("js" "html" "css" "php" "tpl" "ctp" "smarty" "*"))))
