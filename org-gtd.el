;; (add-to-list 'load-path "~/.emacs.d/")
(setq org-hide-leading-stars t) 

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

;; #+TYP_TODO: TODO MAYBE WAITING NEXT DONE
;; (setq org-todo-keywords '((type "TODO" "NEXT" "WAITING" "DONE")))
;; (setq org-default-notes-file "~/gtd/tasks.org")

;; these are the tags to implement context 
;; (setq org-tag-alist '(("WORK" . ?w)
;; 		      ("PC" . ?p)
;; 		      ("MAIL" . ?m)
;;                       ("HOME" . ?h)
;; 		      ("CITY" . ?d)))


;; BEGIN keys 

(setq org-agenda-files (quote ("~/gtd")))


(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gtd/tasks.org" "INBOX")
         "* TODO %?\n %a \n %T")
        ))

(global-set-key (kbd "<f5>")  '(lambda ()
                                 (interactive)
                                 (find-file "~/gtd/tasks.org") )) 
