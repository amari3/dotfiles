;;; editing config

(setq-default truncate-lines t ; truncate line
              tab-width 4 ; tab width
              indent-tabs-mode nil ; no use tab
              find-file-visit-truename t) ; visit truename

;; find-file-at-point
(ffap-bindings)

;; show parentheses
(show-paren-mode t)

