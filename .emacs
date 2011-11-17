;;;; -*- mode: lisp-interaction; syntax: elisp; coding: iso-2022-7bit -*-

(cd "~")
(setq user-full-name "Ryoji Tanida")
(setq user-mail-address "ryo2.amari3@gmail.com")

;(setq debug-on-error t)

(setq inhibit-startup-message t)
(tool-bar-mode nil)
;(require 'un-define)
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
 "Japanese"
 'coding-priority (cons 'utf-8
                        (get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; load environment value
(load-file (expand-file-name "~/.emacs.d/shellenv.el"))
(dolist (path (reverse (split-string (getenv "PATH") ":")))
  (add-to-list 'exec-path path))

(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/elisp/")
        )
       load-path))

(set-default-font "Inconsolata-11")
(set-face-font 'variable-pitch "Inconsolata-11")
(set-fontset-font (frame-parameter nil 'font)
                  'japanese-jisx0208
                  '("Takaoゴシック" . "unicode-bmp"))

;; line spacing
(setq-default line-spacing 0)
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
(set-face-foreground 'region "black")
(set-face-foreground 'modeline "skyblue1")
(set-face-background 'modeline "grey19")


;;;;;; default frame
(setq default-frame-alist
      (append (list '(width . 80)
                    '(height . 48)
                    '(left . 560)
                    '(top . 0)
                    '(background-color . "black")
                    '(foreground-color . "white")
                    '(vertical-scroll-bars . right))
              default-frame-alist))
;; show line/column numer at mode line.
(line-number-mode t)
(column-number-mode t)


;;;;;; common editting
(setq default-buffer-file-coding-system 'utf-8)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;(setq fill-column 78)
(setq auto-fill-mode nil)
;; highliht selected region
(setq-default transient-mark-mode t)
;; key bind for editting
(define-key global-map "\r" 'newline-and-indent)
(define-key global-map [home] 'beginning-of-buffer)
(define-key global-map [end] 'end-of-buffer)
(define-key global-map "\C-c;" 'comment-region)
(define-key global-map "\C-t" 'dabbrev-expand)
(define-key global-map "\C-cg" 'goto-line)
(define-key global-map "\C-h" 'delete-backward-char)
(define-key global-map "\C-x\C-h" 'help)
(global-set-key "\C-xw" 'woman)

;;;;;; autosave / backup
(setq auto-save-default t)
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))
(setq backup-by-copying t)
(setq vc-make-backup-files t)
(setq version-control t)
(setq kept-new-versions 5)
(setq kept-old-versions 5)
(setq delete-old-versions t)

;;;;;; shell
;; using bash of cygwin
;(setq explicit-shell-file-name "bash")
(setq explicit-shell-file-name "zsh")
(setq shell-file-name "sh")
(setq shell-command-switch "-c")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;;;;;; cperl-mode
(defalias 'perl-mode 'cperl-mode)
(setq cperl-close-paren-offset -4)
(setq cperl-continued-statement-offset 4)
(setq cperl-indent-level 4)
(setq cperl-label-offset -4)
(setq cperl-indent-parens-as-block t)
(setq cperl-tab-always-indent t)
;(setq cperl-auto-newline t)
(setq cperl-autoindent-on-semi t)
(setq cperl-highlight-variables-indiscriminately t)
(setq cperl-font-lock t)
(add-hook 'cperl-mode-hook
          (lambda ()
            (font-lock-mode 1)
            (setq plcmp-use-keymap nil)
            (require 'perl-completion)
            (add-to-list 'ac-sources 'ac-source-perl-completion)
            (perl-completion-mode t)
                             ;; plcmp-mode-mapにコマンドを割り当てていく
            (define-key plcmp-mode-map (kbd "C-c m") 'plcmp-cmd-menu)
            (define-key plcmp-mode-map (kbd "C-c s") 'plcmp-cmd-smart-complete)
            (define-key plcmp-mode-map (kbd "C-c d") 'plcmp-cmd-show-doc)
            (define-key plcmp-mode-map (kbd "C-c p") 'plcmp-cmd-show-doc-at-point)
            (define-key plcmp-mode-map (kbd "C-c c") 'plcmp-cmd-clear-all-cashes)
;            (require 'perlplus)
;            (local-set-key "\M-o" 'perlplus-complete-symbol)
;            (perlplus-setup)
            (copy-face 'font-lock-variable-name-face 'cperl-array-face)
            (copy-face 'font-lock-variable-name-face 'cperl-hash-face)
            (set-face-foreground 'cperl-nonoverridable-face "light goldenrod")
            (set-buffer-file-coding-system 'utf-8)
))
(setq auto-mode-alist
      (append '(("\\.pl$" . cperl-mode)
                ("\\.pm$" . cperl-mode)
                ("\\.t$" . cperl-mode)
                ("\\.cgi$" . cperl-mode)) auto-mode-alist))

;; anything
(require 'anything-config)
(require 'anything)
(setq anything-sources
      '(anything-c-source-buffers
        anything-c-source-bookmarks
;            anything-c-source-recentf
        anything-c-source-file-name-history
        anything-c-source-man-pages
        anything-c-source-info-pages
        anything-c-source-calculation-result
        anything-c-source-files-in-current-dir
        anything-c-source-emacs-commands
        anything-c-source-locate))

;; key-bind
(define-key anything-map "\C-p" 'anything-previous-line)
(define-key anything-map "\C-n" 'anything-next-line)
(define-key anything-map "\C-v" 'anything-next-page)
(define-key anything-map "\M-v" 'anything-previous-page)

(anything-iswitchb-setup)
(global-set-key "\C-xv" 'anything)

;; xs-mode
(require 'xs-mode)
(autoload 'xs-mode "xs-mode" "Major mode for XS files" t)
(add-to-list 'auto-mode-alist '("\\.xs$" . xs-mode))

;; yasnippet
(require 'yasnippet)
 
(require 'dropdown-list)
(setq yas/text-popup-function #'yas/dropdown-list-popup-for-template)
 
;; コメントやリテラルではスニペットを展開しない
(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
                             (get-char-property (point) 'face))
                    (string= "font-lock-string-face"
                             (get-char-property (point) 'face))))
           '(require-snippet-condition . force-in-comment)))
 
;; yasnippet 公式提供のものと、
;; 自分用カスタマイズスニペットをロード同名のスニペットが複数ある場合、
;; あとから読みこんだ自分用のものが優先される。
;; また、スニペットを変更、追加した場合、
;; このコマンドを実行することで、変更・追加が反映される。
(defun yas/load-all-directories ()
  (interactive)
  (yas/reload-all)
  (mapc 'yas/load-directory-1 my-snippet-directories))

(setq yas/root-directory (expand-file-name "~/.emacs.d/snippets"))
;; 自分用スニペットディレクトリ(リストで複数指定可)
(defvar my-snippet-directories
  (list (expand-file-name "~/.emacs.d/mysnippets")))

(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")
(yas/load-all-directories)

;;;;;; haskell-mode
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)

(setq haskell-literate-default 'latex)
(setq haskell-doc-idle-delay 0)

;;; js2-mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

; fixing indentation
; refer to http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
(autoload 'espresso-mode "espresso")

(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (espresso--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ espresso-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;;     bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-indent-sexp ()
  (interactive)
  (save-restriction
    (save-excursion
      (widen)
      (let* ((inhibit-point-motion-hooks t)
             (parse-status (syntax-ppss (point)))
             (beg (nth 1 parse-status))
             (end-marker (make-marker))
             (end (progn (goto-char beg) (forward-list) (point)))
             (ovl (make-overlay beg end)))
        (set-marker end-marker end)
        (overlay-put ovl 'face 'highlight)
        (goto-char beg)
        (while (< (point) (marker-position end-marker))
          ;; don't reindent blank lines so we don't set the "buffer
          ;; modified" property for nothing
          (beginning-of-line)
          (unless (looking-at "\\s-*$")
            (indent-according-to-mode))
          (forward-line))
        (run-with-timer 0.5 nil '(lambda(ovl)
                                   (delete-overlay ovl)) ovl)))))

(defun my-js2-mode-hook ()
  (require 'espresso)
  (setq espresso-indent-level 4
        indent-tabs-mode nil
        c-basic-offset 4)
  (c-toggle-auto-state 0)
  (c-toggle-hungry-state 1)
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  ; (define-key js2-mode-map [(meta control |)] 'cperl-lineup)
  (define-key js2-mode-map "\C-\M-\\"
    '(lambda()
       (interactive)
       (insert "/* -----[ ")
       (save-excursion
         (insert " ]----- */"))
       ))
  (define-key js2-mode-map "\C-m" 'newline-and-indent)
  ; (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  ; (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)
  (define-key js2-mode-map "\C-\M-q" 'my-indent-sexp)
  (if (featurep 'js2-highlight-vars)
      (js2-highlight-vars-mode))
  (message "My JS2 hook"))

(add-hook 'js2-mode-hook 'my-js2-mode-hook)

;;;;;; php-mode
(autoload 'php-mode "php-mode")
(setq auto-mode-alist
      (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
;(add-hook 'php-mode-user-hook
(add-hook 'php-mode-hook
          '(lambda ()
             (setq php-manual-path "~/doc/php")
             (setq php-manual-url "http://www.phppro.jp/phpmanual/")
             (c-set-style "stroustrup")
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (c-set-offset 'arglist-close 0)
             (set-buffer-file-coding-system 'utf-8-unix)
             (setq indent-tabs-mode nil)
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
             (when (require 'auto-complete nil t)
               (make-variable-buffer-local 'ac-sources)
               (add-to-list 'ac-sources 'ac-source-php-completion)
               (auto-complete-mode t))
             ))


;;;;;; html-helper-mode
(add-hook 'html-helper-load-hook '(lambda () (require 'html-font)))
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
(setq auto-mode-alist
     (append '(("\\.html$" . html-helper-mode)
               ("\\.tmpl$" . html-helper-mode)
               ("\\.tt$" . html-helper-mode)) auto-mode-alist))

;;;;;; css-mode
(autoload 'css-mode "css-mode")
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq auto-mode-alist
     (cons '("\\.css$" . css-mode) auto-mode-alist))

;;;;;; cc-mode
(require 'cc-mode)

;; Kernighan & Ritchie
(setq c-default-style "k&r")

(add-hook 'c-mode-common-hook
'(lambda ()
(progn
(c-toggle-hungry-state 1)
(setq c-basic-offset 4 indent-tabs-mode nil))))

(setq auto-mode-alist
(append
'(("\\.hpp$" . c++-mode)
("\\.h$" . c++-mode)
) auto-mode-alist))

;;;;;; speedbar
(add-hook 'speedbar-mode-hook
          '(lambda ()
             (speedbar-add-supported-extension '("js" "as" "html" "css" "php")))
)

;;;;;; changelog memo
(autoload 'clmemo "clmemo" "ChangeLog memo mode." t)
(setq clmemo-file-name "~/.emacs.d/memo.txt")
(define-key global-map "\C-xM" 'clmemo)
;; add text of region to memo
(setq clmemo-buffer-function-list '(clmemo-insert-region))
;; add weekday info
(setq clmemo-time-string-with-weekday t)
;; clgrep
(autoload 'clgrep "clgrep" "ChangeLog grep." t)
(autoload 'clgrep-item "clgrep" "ChangeLog grep." t)
(autoload 'clgrep-item-header "clgrep" "ChangeLog grep for item header" t)
(autoload 'clgrep-item-tag "clgrep" "ChangeLog grep for tag" t)
(autoload 'clgrep-item-notag "clgrep" "ChangeLog grep for item except for tag" t)
(autoload 'clgrep-item-nourl "clgrep" "ChangeLog grep item except for url" t)
(autoload 'clgrep-entry "clgrep" "ChangeLog grep for entry" t)
(autoload 'clgrep-entry-header "clgrep" "ChangeLog grep for entry header" t)
(autoload 'clgrep-entry-no-entry-header "clgrep" "ChangeLog grep for entry except entry header" t)
(autoload 'clgrep-entry-tag "clgrep" "ChangeLog grep for tag" t)
(autoload 'clgrep-entry-notag "clgrep" "ChangeLog grep for tag" t)
(autoload 'clgrep-entry-nourl "clgrep" "ChangeLog grep entry except for url" t)
(add-hook 'clmemo-mode-hook
         '(lambda () (define-key clmemo-mode-map "\C-c\C-g" 'clgrep)))

;;;;;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp")

;;;;;; migemo
(setq migemo-directory "/usr/share/migemo")
(load "migemo")

;;;;;; emoji
(defun emoji-get-image-dir (E-or-I-or-V)
  (expand-file-name
   (concat (file-name-directory (locate-library "emoji")) "image/" E-or-I-or-V "/")))

(require 'emoji)

;(load "emacs21-256color-hack.el")
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-billw)
(global-font-lock-mode t)
