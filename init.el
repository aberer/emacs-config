;; (require 'cl) ; a rare necessary use of REQUIRE
;; (defvar *emacs-load-start* (current-time))

(setq custom-file "~/.emacs.d/custom")
(load custom-file)

(load "~/.emacs.d/start-packages")
(load "~/.emacs.d/start-misc")
(load "~/.emacs.d/start-appearance")
(load "~/.emacs.d/start-behavior")
(load "~/.emacs.d/start-devel")
(load "~/.emacs.d/start-org")
(load "~/.emacs.d/valgrind")
(load "~/.emacs.d/user-data")

(put 'narrow-to-region 'disabled nil)

(load custom-file)
