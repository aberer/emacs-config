
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)


;; infrastructure
(defmacro csetq (variable value)
  `(funcall (or (get ',variable 'custom-set)
                'set-default)
            ',variable ,value))

(load "~/.emacs.d/start-packages")
(load "~/.emacs.d/start-misc")
(load "~/.emacs.d/start-appearance")
(load "~/.emacs.d/start-behavior")
(load "~/.emacs.d/start-devel")
(load "~/.emacs.d/start-org")
(load "~/.emacs.d/start-mu4e")
(load "~/.emacs.d/start-experimental")

(load "~/.emacs.d/elf-mode")

(put 'narrow-to-region 'disabled nil)

(load custom-file)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(setq initial-buffer-choice (org-agenda-list))
