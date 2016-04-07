;; _____________________________________________________________________________
;;;;;;;;;;;;;;
;; MIDNIGHT ;;
;;;;;;;;;;;;;;

(require 'midnight)

(setq clean-buffer-list-delay-general 1)


;; _____________________________________________________________________________
;;;;;;;;;;;;;;;
;; SCROLLING ;;
;;;;;;;;;;;;;;;

(setq 
 scroll-margin 1
 auto-window-vscroll nil
 scroll-step 1
 scroll-conservatively 5
 scroll-preserve-screen-position 1
 )


;; _____________________________________________________________________________
;;;;;;;;;;;;;;
;; UNIQUIFY ;;
;;;;;;;;;;;;;;

(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; _____________________________________________________________________________
;;;;;;;;;;;;;
;; browser ;;
;;;;;;;;;;;;;
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/usr/bin/chromium")

;; _____________________________________________________________________________

(global-set-key (kbd "C-c C-r") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-c q") 'auto-fill-mode)   
(global-set-key (kbd "C-c C") 'calc)  
(global-set-key (kbd "C-c C-i") 'timeclock-in)
(global-set-key (kbd "C-c C-o") 'timeclock-out)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete-filename)

;; faster moving between buffers
(windmove-default-keybindings 'meta)

(setq require-final-newline t)

;; helm 
(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
