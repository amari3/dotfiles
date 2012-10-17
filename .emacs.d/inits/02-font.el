;;; font
(add-to-list 'default-frame-alist '(font . "Inconsolata-12"))
(cond (window-system
       (set-default-font "Inconsolata-12")
       (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                           '("Takaoゴシック" . "unicode-bmp"))
       ))
