(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load "~/.emacs.d/start-packages")
(load "~/.emacs.d/user-functions.el")
(load "~/.emacs.d/start-misc")
(load "~/.emacs.d/start-appearance")
(load "~/.emacs.d/start-behavior")
(load "~/.emacs.d/start-devel")
(load "~/.emacs.d/start-org")
(load "~/.emacs.d/valgrind")
(load "~/.emacs.d/user-data")
(load "~/.emacs.d/start-utils.el")

(put 'narrow-to-region 'disabled nil)

(load custom-file)
(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
