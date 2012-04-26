;;(defalias 'head 'car)
;;(defalias 'rest 'cdr)

(setq tab-width 4)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)

(setq auto-save nil)

(tool-bar-mode 0)
(cua-mode 0)
(transient-mark-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

;; set command to meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/lisp/")
(add-to-list 'load-path "/Users/ylzhang/Build/elisp/")
(require 'xcscope)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (require 'xcscope)))

(require 'gccsense)

;; auto-complete
(add-to-list 'load-path "~/Build/elisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/Build/elisp/auto-complete/ac-dict")
(ac-config-default)


;; get el-get packages
;; (url-retrieve
;;  "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;  (lambda (s)
;;    (end-of-buffer)
;;    (eval-print-last-sexp)))

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
;;(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
;;(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'n-cperl-mode-hook t)
(defun n-cperl-mode-hook ()
  (setq cperl-indent-level 4)
  (setq cperl-continued-statement-offset 0)
  (setq cperl-extra-newline-before-brace t)
)
  ;;(set-face-background 'cperl-array-face "wheat")
  ;;(set-face-background 'cperl-hash-face "wheat"

(add-to-list 'load-path "~/projects/repos/twittering-mode/")
(require 'twittering-mode)

(add-to-list 'load-path "~/projects/repos/markdown-mode/")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))
(setq delete-by-moving-to-trash t)

;; org-mode settings
(add-to-list 'auto-mode-alist '("\\.org\\$" . org-mode))
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-cc" 'org-capture)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (global-set-key [C-enter] 'org-insert-heading-respect-content)
(add-hook 'org-mode-hook 
          '(lambda ()
             (setq org-list-indent-offset 4)
             (define-key org-mode-map "\C-cl" 
               'org-store-link)
             (define-key org-mode-map "\C-cc" 
               'org-capture)
             (define-key org-mode-map "\C-ca" 
               'org-agenda)
             (define-key org-mode-map "\C-cb" 
               'org-iswitchb)
             (define-key org-mode-map [(control return)] 
               'org-insert-heading-respect-content)))
;; (global-set-key [(control enter)] 'org-insert-heading-respect-content)
;; (global-set-key (kbd "C-<enter>") 'org-insert-heading-respect-content) 
;; (define-key global-map (kbd "C-<enter>") 'org-insert-heading-respect-content)

(defun prelude-open-with()
  "Simple function that allows us to open with underlying file of a buffer 
in an external program."
  (interactive)
  (when buffer-file-name 
    (shell-command (concat 
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))
(global-set-key "\C-co" 'prelude-open-with)

;; mode-line
;;   %b -- print buffer name.      %f -- print visited file name.
;;   %F -- print frame name.
;;   %* -- print %, * or hyphen.   %+ -- print *, % or hyphen.
;;         %& is like %*, but ignore read-only-ness.
;;         % means buffer is read-only and * means it is modified.
;;         For a modified read-only buffer, %* gives % and %+ gives *.
;;   %s -- print process status.   %l -- print the current line number.
;;   %c -- print the current column number (this makes editing slower).
;;         To make the column number update correctly in all cases,
;;         `column-number-mode' must be non-nil.
;;   %i -- print the size of the buffer.
;;   %I -- like %i, but use k, M, G, etc., to abbreviate.
;;   %p -- print percent of buffer above top of window, or Top, Bot or All.
;;   %P -- print percent of buffer above bottom of window, perhaps plus Top,
;;         or print Bottom or All.
;;   %n -- print Narrow if appropriate.
;;   %t -- visited file is text or binary (if OS supports this distinction).
;;   %z -- print mnemonics of keyboard, terminal, and buffer coding systems.
;;   %Z -- like %z, but including the end-of-line format.
;;   %e -- print error message about full memory.
;;   %@ -- print @ or hyphen.  @ means that default-directory is on a
;;         remote machine.
;;   %[ -- print one [ for each recursive editing level.  %] similar.
;;   %% -- print %.   %- -- print infinitely many dashes.
;; Decimal digits after the % specify field width to which to pad.

;; (set-foreground-color "cyan")
;; (set-background-color "black")

;; Set the modeline to tell me the filename, hostname, etc..
(setq-default mode-line-format
      (list " "
            ; */% indicators if the file has been modified
            'mode-line-modified
            "--"
            ; the name of the buffer (i.e. filename)
            ; note this gets automatically highlighted
            'mode-line-buffer-identification
            "--"
            ; major and minor modes in effect
            'mode-line-modes
            ; if which-func-mode is in effect, display which
            ; function we are currently in.
            '(which-func-mode ("" which-func-format "--"))
            ; line, column, file %
            'mode-line-position
            "--"
            ; if vc-mode is in effect, display version control
            ; info here
            `(vc-mode vc-mode)
            "--"
            ; hostname
            'system-name
            ; dashes sufficient to fill rest of modeline.
            "-%-"
            )
)

;; use setq-default to set it for /all/ modes
(setq mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face 'font-lock-keyword-face
        'help-echo (buffer-file-name)))

    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
      (propertize "%02l" 'face 'font-lock-type-face) ","
      (propertize "%02c" 'face 'font-lock-type-face) 
    ") "

    ;; relative position, size of file
    "["
    (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
    "/"
    (propertize "%I" 'face 'font-lock-constant-face) ;; size
    "] "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face 'font-lock-string-face
              'help-echo buffer-file-coding-system))
    "] "


    "[" ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face 'font-lock-preprocessor-face
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face 'font-lock-warning-face
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face 'font-lock-type-face
                             'help-echo "Buffer is read-only"))))  
    "] "

    ;; add the time, with the date and the emacs uptime in the tooltip
    '(:eval (propertize (format-time-string "%H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))
    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))

(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(95 50))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(setq special-display-regexps (remove "[ ]?\\*[hH]elp.*" special-display-regexps))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (adwaita))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
