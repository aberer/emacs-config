(setq load-path (cons "~/.emacs.d/lib/" load-path))

(require 'zenburn-theme)
(require 'sr-speedbar)

(require 'midnight)
(require 'saveplace)
(require 'cc-mode)

(require 'lpr)
(require 'printing)

(require 'ess-site)

(global-auto-revert-mode t) 
(c-toggle-hungry-state nil)

(load-library "iso-transl")

(defun word-count nil "Count words in buffer" (interactive)
(shell-command-on-region (point-min) (point-max) "wc -w"))

(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

(load "~/.emacs.d/mode-line.el")

;;;;;;;;;;;;;;;
;; variables ;;
;;;;;;;;;;;;;;;
(setq

 ediff-split-window-function (quote split-window-horizontally)

 ;; dont use tabs 
 indent-tabs-mode nil 

 ;;;;;;;;;;;;;
 ;; general ;;
 ;;;;;;;;;;;;;
 ;; starttls-use-gnutls t
 save-place-file "~/.emacs.d/data/saveplace"  
 require-final-newline t
 default-frame-alist '((font-backend . "xft")
		       (font . "Monospace-12");; "Inconsolata-14"
		       (right-fringe . 0)
		       (left-fringe . 1)
 		       (scroll-bar-mode . -1)
		       (menu-bar-lines . 0)
		       (tool-bar-lines . -1))

;;;;;;;;;;;
;; DEVEL ;;
;;;;;;;;;;;
 kill-read-only-ok t
 frame-title-format "Emacs: %b "	; Frame Title
 inhibit-startup-message t
 ;; file-cache-completion-ignore-case t
 ;; bbdb-file "~/.emacs.d/data/bbdb-file"

 backup-directory-alist '(("." . "~/.emacs.d/data/backups/")) 
 confirm-kill-emacs 'y-or-n-p
 diary-file "~/.emacs.d/data/diary" 
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/chromium"
 use-file-dialog nil

 ;; scrolling TODO 
 jit-lock-defer-time nil
 redisplay-dont-pause t
 scroll-margin 1
 auto-window-vscroll nil
 scroll-step 1
 scroll-conservatively 5
 scroll-preserve-screen-position 1
 column-number-mode t
 debug-on-error nil
 font-lock-maximum-decoration t
 ess-directory "~/"
 ess-language "R"
 ecb-tip-of-the-day nil
 read-mail-command  'gnus
 remote-shell-program "ssh"

 
 ;;;;;;;;;;;;;;
 ;; calendar TODO  ;;
 ;;;;;;;;;;;;;;
 mark-diary-entries-in-calendar t
 mark-holidays-in-calendar t
 european-calendar-style t
 all-christian-calendar-holidays t
 calendar-week-start-day 1

 cua-enable-cua-keys nil
 flyspell-default-dictionary "american"
 )

(cua-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
;; (delete-selection-mode nil)		; inserting at a point
(blink-cursor-mode -1)

(auto-image-file-mode)
(show-paren-mode 1)
;; (iswitchb-mode 1)			; iswitchb-mode
(icomplete-mode 99)

(defun my-message-setup-routine ()
  (flyspell-mode 1))

(add-hook 'message-setup-hook 'my-message-setup-routine)

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)
(add-hook 'html-helper-mode-hook 'flyspell-mode)
;; (add-hook 'midnight-hook 'file-cache-clear-cache)


(set-scroll-bar-mode nil)


;; TODO
(require 'tramp)
(tramp-set-completion-function "ssh"
			       '((tramp-parse-sconfig "/etc/ssh_config")
				 (tramp-parse-sconfig "~/.ssh/config")))



;; modeline indicates where you are in the file
;; http://emacs-fu.blogspot.com/2010/03/showing-buffer-position-in-mode-line.html
(if (require 'sml-modeline nil 'noerror)    ;; use sml-modeline if available
    (progn
      (sml-modeline-mode 1)                   ;; show buffer pos in the mode line
      (scroll-bar-mode -1))                   ;; turn off the scrollbar
  ;; (scroll-bar-mode 1)                       ;; otherwise, show a scrollbar...
  ;; (set-scroll-bar-mode 'right)
  )             ;; ... on the right




;; (require 'flyspell-timer)
;; (add-hook 'flyspell-mode-hook 'flyspell-timer-ensure-idle-timer)

;; auto complete
;; TODO ??? 
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
;; (ac-config-default)


(setq emerge-diff-options "--ignore-all-space")


(setq ediff-diff-options "-w")

(setq initial-buffer-choice "~/gtd/tasks.org")

(cua-mode nil )


(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'downcase-region 'disabled nil)

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")

(setq url-proxy-services
      '( 
	;; ("no_proxy" . "work\\.com")
         ("http" . "172.16.3.1:8080") 
         ("https" . "172.16.3.1:8080" )
         )
      )

(when window-system          ; start speedbar if we're using a window system
  (sr-speedbar-open))

;; (defun valgrind ()
;; (interactive)
;; (compilation-minor-mode)
;; (define-key compilation-minor-mode-map (kbd "") 'comint-send-input)
;; (define-key compilation-minor-mode-map (kbd "S-") 'compile-goto-error))

;; (add-hook 'shell-mode-hook 'valgrind)


