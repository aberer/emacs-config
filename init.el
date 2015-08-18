;; (require 'cl) ; a rare necessary use of REQUIRE
;; (defvar *emacs-load-start* (current-time))

(setq plantuml-jar-path "~/lib/plantuml.jar")

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(setq debug-on-error t)

(setq custom-file "~/.emacs.d/custom.el")

(load "~/.emacs.d/start-misc")
(load "~/.emacs.d/start-keys")
(load "~/.emacs.d/start-flyspell")
(load "~/.emacs.d/start-latex")
(load "~/.emacs.d/start-cedet")
(load "~/.emacs.d/start-highlight.el")
(load "~/.emacs.d/start-org.el")
(load "~/.emacs.d/valgrind.el")
(load "~/.emacs.d/user-data.el")

(load custom-file)
(put 'narrow-to-region 'disabled nil)
