(require 'org-install)
;; (require 'org-mu4e)

;; (load "~/.emacs.d/org-export.el")
;; (load "~/.emacs.d/org-gtd.el")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)

(setf org-tags-column -65)
