(setq debug-on-error nil)

(use-package saveplace
  :config
  (setq-default save-place t
                save-place-file "~/.emacs.d/data/saveplace"))

(global-auto-revert-mode t) 

;;;;;;;;;;;;;;;
;; variables ;;
;;;;;;;;;;;;;;;

(setq
;;;;;;;;;;;
;; DEVEL ;;
;;;;;;;;;;;
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

(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)

(add-hook 'html-helper-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-mode)


(use-package markdown-mode
  :config
  (add-hook 'markdown-mode-hook  'flyspell-mode))

(use-package flyspell
  :ensure

  :config
  (add-hook 'message-mode-hook 'flyspell-mode)
  (defun toggle-default-dictionary ()
    (interactive)
    (let ((newPrimeDict (first my-dict-list))
          (remainingDicts (rest my-dict-list)))
      (setq my-dict-list
            (append remainingDicts (list newPrimeDict)))
      (setq ispell-dictionary newPrimeDict)
      (print (concat  "changed default dictionary to " newPrimeDict))))

  :bind
  ("C-<f8>" . toggle-default-dictionary)
  ("C-<f7>" . flyspell-buffer)

  :config
  (setq my-dict-list '("german-new8" "american")))
