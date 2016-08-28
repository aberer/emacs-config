(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
