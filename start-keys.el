;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functions to be bound ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-unset-key (kbd "M-;"))
(global-unset-key (kbd "C-x C-p"))


(defun grep-code ()
  (interactive)
  (let* (
	 (the-input (read-from-minibuffer 
		     (format
		      "grep code [%s]:  " 
		      (if (not(boundp 'last-grep-input) ) "NAN" last-grep-input))
		     ))
	 (the-real-input (if (string= the-input "") last-grep-input the-input ))	 
	 )
    (grep (format "grep -nH -i -e  %s *.[ch]*"  the-real-input ))
    (setq last-grep-input the-real-input)
    )
  )

(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(defun my-comment-line-or-region ()
  (interactive "*")
  (if (and mark-active transient-mark-mode)
      (comment-or-uncomment-region (region-beginning) (region-end) nil)
    (progn
      (save-excursion
        (move-beginning-of-line nil)
        (set-mark-command nil)
        (move-end-of-line nil)
        (comment-dwim nil)
        ))))

(defun load-dot-emacs-file () 
  "load the dot emacs file once again"
  (interactive)
  (load-file "~/.emacs.d/init.el")) 

;;;;;;;;;;;;;;;;;
;; global keys ;;
;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-c C-r") 'load-dot-emacs-file)
(global-set-key (kbd "C-c M-s") 'comment-box) 
(global-set-key (kbd "M-n")  'comment-dwim) ; rebind the main commenting key
(global-set-key (kbd "M-s")  'my-comment-line-or-region) ; rebind the main commenting key
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-x C-b") 'bs-show)
(global-set-key (kbd "C-c o") 'occur)  
(global-set-key (kbd "C-c O") 'all)  
(global-set-key (kbd "C-c q") 'auto-fill-mode)   
(global-set-key (kbd "C-c C") 'calc)  
(global-set-key (kbd "C-c C-i") 'timeclock-in)
(global-set-key (kbd "C-c C-o") 'timeclock-out)
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete-filename)

;; faster moving between buffers
(windmove-default-keybindings 'meta) 
(global-set-key (kbd "C-c C-e") 'emms-add-dired)

;; TODO *grml* should be local
(global-set-key (kbd "M-ä") 'semantic-ia-fast-jump)

(global-set-key (kbd "<f1>") 'mu4e)
(global-set-key (kbd "C-<f4>") 'valgrind )
(global-set-key (kbd "C-<f5>") 'magit-status)
(global-set-key (kbd "C-<f8>") 'grep-code)
