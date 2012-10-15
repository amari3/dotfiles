;; js2-mode
;; (auto-install-from-url "https://raw.github.com/mooz/js2-mode/master/js2-mode.el")
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

