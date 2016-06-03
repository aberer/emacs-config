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

;;;;;;;;;;;;;;;
;; FLYSPELL  ;;
;;;;;;;;;;;;;;;

(require 'flyspell-lazy)
(flyspell-lazy-mode 1)


(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

(add-hook 'html-helper-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

(add-hook 'markdown-mode-hook  'flyspell-mode)

(defun flyspell-ignore-tex ()
  (interactive)
  (set (make-variable-buffer-local 'ispell-parser) 'tex))

(setq my-dict-list '("german-new8" "american"))

(defun toggle-default-dictionary ()
  (interactive)
  (let ((newPrimeDict (first my-dict-list))
        (remainingDicts (rest my-dict-list)))
    (setq my-dict-list
        (append remainingDicts (list newPrimeDict)))  
    (setq ispell-dictionary newPrimeDict)
    (print (concat  "changed default dictionary to " newPrimeDict))))

(global-set-key (kbd "C-<f8>") 'toggle-default-dictionary)
(global-set-key (kbd "C-<f7>") 'flyspell-buffer)
