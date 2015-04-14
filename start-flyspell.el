(require 'flyspell)

;; (let ((langs '("american" "german")))
;;   (setq lang-ring (make-ring (length langs)))
;;   (dolist (elem langs) (ring-insert lang-ring elem)))
;; (defun cycle-ispell-languages ()
;;   (interactive)
;;   (let ((lang (ring-ref lang-ring -1)))
;;     (ring-insert lang-ring lang)
;;     (ispell-change-dictionary lang)))


(setq 
 flyspell-issue-welcome-flag nil;; fix for Ubuntu 10.10 problem
 flyspell-default-dictionary "american"
 ispell-local-dictionary "american" 
 ) 

;; (global-set-key (kbd "<f12>") 'cycle-ispell-languages)
