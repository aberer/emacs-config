;; (require 'cl) ; a rare necessary use of REQUIRE
;; (defvar *emacs-load-start* (current-time))

(setq package-enable-at-startup nil)
(package-initialize)

(setq debug-on-error t)

(setq custom-file "~/.emacs.d/custom.el")

(load "~/.emacs.d/start-packages")
(load "~/.emacs.d/start-misc")
(load "~/.emacs.d/start-keys")
(load "~/.emacs.d/start-flyspell")
(load "~/.emacs.d/start-latex")
(load "~/.emacs.d/start-cedet")
(load "~/.emacs.d/start-mu4e.el")
(load "~/.emacs.d/start-highlight.el")
(load "~/.emacs.d/start-org.el")

(load custom-file)
