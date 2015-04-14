(require 'cedet)
(require 'semantic)
(require 'semantic/sb)
(require 'semantic/ia)
(require 'yasnippet )

(add-to-list 'auto-mode-alist '("\\.tpp\\'" . c++-mode))




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


;; REACTIVATE 

;; (ede-cpp-root-project "tree" 
;;                 :file "~/proj/astl/tree/configure.ac" 
;; 		:include-path '( 
;; 				"/src"
;;                                 )
;; 		)

;; (ede-cpp-root-project "exabayes" 
;;                 :file "~/proj/exa-bayes/configure.ac" 
;; 		:include-path '( 
;; 				"/src"
;; 				"/src/comm"
;; 				"/src/comm/dummy"
;; 				"/src/comm/mpi"
;; 				"/src/comm/threads"
;; 				"/src/contrib"
;; 				"/src/file"
;; 				"/src/eval"
;; 				"/src/data-struct"
;; 				"/src/parser"
;; 				"/src/config"
;; 				"/src/tree-init"
;; 				"/src/model"
;; 				"/src/system"
;; 				"/src/tree-parse"
;; 				"/src/branches"
;; 				"/src/parameters"
;; 				"/src/math"
;; 				"/src/proposals"
;; 				"/src/proposals/param-proposers"
;; 				"/src/proposals/topo-proposers"
;; 				"/src/priors"
;; 				"/src/apps"
;; 				"/src/mcmc"
;; 				)
;; 		)

(c-toggle-hungry-state -1 )
(setq speedbar-update-flag t)

(yas-global-mode 1 )
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
