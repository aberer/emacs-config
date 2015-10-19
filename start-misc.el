(setq debug-on-error nil)

(require 'saveplace)

(global-auto-revert-mode t) 

;;;;;;;;;;;;;;;
;; variables ;;
;;;;;;;;;;;;;;;

(setq
 ;;;;;;;;;;;;;
 ;; general ;;
 ;;;;;;;;;;;;;
 save-place-file "~/.emacs.d/data/saveplace"  

;;;;;;;;;;;
;; DEVEL ;;
;;;;;;;;;;;
 kill-read-only-ok t

 backup-directory-alist '(("." . "~/.emacs.d/data/backups/")) 
 confirm-kill-emacs 'y-or-n-p
 diary-file "~/.emacs.d/data/diary" 

 ;; scrolling TODO 
 jit-lock-defer-time nil
 redisplay-dont-pause t
 font-lock-maximum-decoration t
 )

(auto-image-file-mode)
(icomplete-mode 99)

(setq initial-buffer-choice "~/gtd/tasks.org")
