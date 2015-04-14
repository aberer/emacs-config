;; time management 

(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook
	  '(lambda ()  
	     (if (not org-timer-current-timer)
		 (org-timer-set-timer '(16)))))

(add-hook 'org-clock-out-hook
	  '(lambda ()  (setq org-mode-line-string nil)))

(add-hook 'org-timer-done-hook
	  '(lambda() 
	     (start-process "orgmode" nil "/usr/bin/notify-send"  "Time's up")))
