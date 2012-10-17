;;; font
(add-to-list 'default-frame-alist '(font . "Inconsolata-11"))
(cond (window-system
       (set-default-font "Inconsolata-11")
       (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                           '("Takaoゴシック" . "unicode-bmp"))
       ))
