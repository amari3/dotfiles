;;; scala
;; (package-install 'scala-mode2)

(require 'scala-mode2)
(add-to-list 'auto-mode-alist '("\.scala$" . scala-mode))
(add-to-list 'auto-mode-alist '("\.sbt$" . scala-mode))
