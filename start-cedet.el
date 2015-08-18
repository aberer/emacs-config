(require 'cedet)
(require 'semantic)
(require 'semantic/sb)
(require 'semantic/ia)
(require 'yasnippet )

;; (require 'setup-helm)

(require 'function-args)
(fa-config-default)

;; (add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))

(setq-default indent-tabs-mode nil)

(add-hook 'gud-mode-hook 
	  '(lambda () 
	     ()
	     (define-key gud-mode-map  (kbd "M-g M-p") 'gud-down)
	     (define-key gud-mode-map  (kbd "M-g M-n") 'gud-up) ))

(global-set-key (kbd "C-x M-o") 'ff-find-other-file)

(global-set-key (kbd "" ) 'semantic-ia-complete-tip)

(setq 
 gdb-many-windows t
 gdb-max-children 200
 gdb-speedbar-auto-raise nil
 gud-tooltip-mode t
 compilation-read-command nil
 compilation-auto-jump-to-first-error t
 semantic-idle-scheduler-idle-time 1
 
 )


(setq 
 global-semantic-decoration-mode t
 global-semantic-highlight-edits-mode t
 global-semantic-highlight-func-mode t
 global-semantic-idle-summary-mode t
 global-semantic-show-unmatched-syntax-mode t
 global-semantic-idle-completions-mode t 
)


(setq 
 semantic-default-submodes '(
                             global-semantic-highlight-func-mode
                             global-semantic-decoration-mode
                             global-semantic-stickyfunc-mode 
			     global-semantic-idle-completions-mode 
			     global-semantic-idle-scheduler-mode 
			     global-semanticdb-minor-mode
			     global-semantic-idle-summary-mode
			     global-semantic-mru-bookmark-mode
			     global-semantic-idle-local-symbol-highlight-mode
			     global-semantic-highlight-edits-mode
			     global-semantic-show-unmatched-syntax-mode
			     global-semantic-show-parser-state-mode
			     ))

(global-ede-mode 1)                      ; Enable the Project management system
(semantic-mode 1 )



(load "~/.emacs.d/code-projects.el")


(c-toggle-hungry-state -1 )
(setq speedbar-update-flag t)

(yas-global-mode 1 )

(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; dont indent after namespace 
(defconst my-cc-style
  '("user" ;; c++-mode
    (c-offsets-alist . (
                        (innamespace . 0)
                        (substatement-open . 0)
                        ) ) )
  )
(c-add-style "linux" my-cc-style)

(setq
 c-default-style "linux"
 c-basic-offset 4
 )

;; whitespace mode 
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))

;; (setq compilation-window-height 10)
;; (defun my-compilation-hook ()
;;   (when (not (get-buffer-window "*compilation*"))
;;     (save-selected-window
;;       (save-excursion
;;         (let* ((w (split-window-vertically))
;;                (h (window-height w)))
;;           (select-window w)
;;           (switch-to-buffer "*compilation*")
;;           (shrink-window (- h compilation-window-height)))))))
;; (add-hook 'compilation-mode-hook 'my-compilation-hook)

(setq gdb-create-source-file-list nil) 
