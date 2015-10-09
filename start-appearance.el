(require 'zenburn-theme)

(show-paren-mode 1)
(blink-cursor-mode -1)
(scroll-bar-mode -1)

(setq  default-frame-alist '((font-backend . "xft")
                             (font . "Monospace-12");; "Inconsolata-14"
                             (right-fringe . 0)
                             (left-fringe . 1)
                             (scroll-bar-mode . -1)
                             (menu-bar-lines . 0)
                             (tool-bar-lines . -1))
       use-file-dialog nil
       )

;; _____________________________________________________________________________
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; HIGHLIGHT CURRENT LINE ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'highlight-current-line)
(setq highlight-current-line-globally t)
(highlight-current-line-on t)

