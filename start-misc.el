;; (setq load-path (cons "~/.emacs.d/lib/" load-path))

(setq debug-on-error t)

(require 'saveplace)

(require 'lpr)
(require 'printing)

(global-auto-revert-mode t) 

(load-library "iso-transl")

(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;;;;;;;;;;;;;;;
;; variables ;;
;;;;;;;;;;;;;;;

(setq
 ;;;;;;;;;;;;;
 ;; general ;;
 ;;;;;;;;;;;;;
 save-place-file "~/.emacs.d/data/saveplace"  
 require-final-newline t

;;;;;;;;;;;
;; DEVEL ;;
;;;;;;;;;;;
 kill-read-only-ok t
 frame-title-format "Emacs: %b "	; Frame Title
 inhibit-startup-message t
 backup-directory-alist '(("." . "~/.emacs.d/data/backups/")) 
 confirm-kill-emacs 'y-or-n-p
 diary-file "~/.emacs.d/data/diary" 
 browse-url-browser-function 'browse-url-generic
 browse-url-generic-program "/usr/bin/chromium"

 ;; scrolling TODO 
 jit-lock-defer-time nil
 redisplay-dont-pause t
 column-number-mode t
 debug-on-error nil
 font-lock-maximum-decoration t
 read-mail-command  'gnus
 )

(fset 'yes-or-no-p 'y-or-n-p)

(auto-image-file-mode)

;; (iswitchb-mode 1)			; iswitchb-mode
(icomplete-mode 99)

(defun my-message-setup-routine ()
  (flyspell-mode 1))

(add-hook 'message-setup-hook 'my-message-setup-routine)

;; TODO
(require 'tramp)
(tramp-set-completion-function "ssh"
			       '((tramp-parse-sconfig "/etc/ssh_config")
				 (tramp-parse-sconfig "~/.ssh/config")))

(setq emerge-diff-options "--ignore-all-space")

(setq initial-buffer-choice "~/gtd/tasks.org")
