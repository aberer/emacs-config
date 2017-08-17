(use-package org-install
  :init
  (setq org-tags-column -65)
  :bind
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c a" . org-agenda))


(setq org-agenda-start-on-weekday 0)


(use-package org-mu4e)

(setq org-hide-leading-stars t)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-log-done t)

(setq org-agenda-files (quote ("~/org/tasks.org")))


(setq org-capture-templates
      '( ("t"    "Todo"            entry    (file+headline "~/org/tasks.org" "INBOX")              "* TODO %?\n %a \n %U")
         ("a"     "Appointment"    entry    (file+datetree+prompt "~/org/tasks.org" "Calendar")    "* APPT  %?\n %a \n SCHEDULED: %T")
         ))

(global-set-key (kbd "<f5>")  '(lambda ()
                                 (interactive)
                                 (find-file "~/org/tasks.org") ))
