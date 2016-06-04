(use-package zenburn-theme)

(setq  default-frame-alist '((font-backend . "xft")
                             (font . "Monospace-12");; "Inconsolata-14"
                             (right-fringe . 0)
                             (left-fringe . 1)
                             (scroll-bar-mode . -1)
                             (menu-bar-lines . 0)
                             (tool-bar-lines . -1))
       use-file-dialog nil
       )

(show-paren-mode t)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

(fset 'yes-or-no-p 'y-or-n-p)

(load-library "iso-transl")

(setq column-number-mode t)

(setq  frame-title-format "Emacs: %b ")	; Frame Title
(setq inhibit-startup-message t)


;; _____________________________________________________________________________
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HIGHLIGHT CURRENT LINE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package highlight-current-line
  :config
  (setq highlight-current-line-globally t)
  (highlight-current-line-on t))

(setq enable-recursive-minibuffers t)
