(require 'cedet)
(require 'semantic)
(require 'semantic/sb)
(require 'semantic/ia)

(require 'srecode)
(require 'semantic/bovine/gcc)

(global-ede-mode 1)                      ; Enable the Project management system

;; (require 'setup-helm)

;; _____________________________________________________________________________
;;;;;;;;;;;;;;;
;; SEMANTIC  ;;
;;;;;;;;;;;;;;;

(semantic-mode 0)

(global-semantic-idle-completions-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-decoration-mode t)
(global-semantic-show-unmatched-syntax-mode t)

(setq semantic-default-submodes
      '(
        global-semanticdb-minor-mode
        global-semantic-mru-bookmark-mode
        global-semantic-highlight-func-mode
        global-semantic-stickyfunc-mode 
        global-semantic-decoration-mode
        global-semantic-idle-local-symbol-highlight-mode
        global-semantic-idle-scheduler-mode 
        global-semantic-idle-completions-mode
        global-semantic-idle-summary-mode
        global-semantic-idle-breadcrumbs
        ))


(global-set-key (kbd "M-ä") 'semantic-ia-fast-jump)
(global-set-key (kbd "M-p") 'dabbrev-expand)



;; begin: experimental
;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
  ;; (semanticdb-enable-gnu-global-databases 'c++-mode))
;; end: experimental




;; _____________________________________________________________________________
;;;;;;;;;;;;;;;;
;; COMMENTING ;;
;;;;;;;;;;;;;;;;

(defun insert-comment-line ()
  (interactive)
  (c-indent-line-or-region) 
  (comment-dwim-2)
  (princ (apply 'concat (make-list (- 80 (current-column))  "_")) (current-buffer))
  )

(defun insert-white-until-half()
  (interactive)
  (delete-horizontal-space)
  (princ (apply 'concat (make-list (max (- 40 (current-column)) 0)  " ")) (current-buffer))
  )

(defun print-many-whites (n) 
  (princ (apply 'concat (make-list n " " ))  
         (current-buffer)))

(defun insert-new-comment-box()
  (interactive)
  (move-beginning-of-line nil)
  (c-indent-line-or-region)
  (setq start-col (current-column))
  (move-end-of-line nil)
  (setq end-col (current-column))
  (setq remain-white
        (max 0 (- 80 4 end-col)))

  (progn 
    (setq remain-white-start  (+ (/ remain-white 2)
                                 (if(= (mod remain-white 2) 0 ) 0  1 )   ))
    (setq remain-white-stop (/ remain-white 2)))

  (move-beginning-of-line nil)
  (c-indent-line-or-region)
  (princ "//" (current-buffer))
  (print-many-whites remain-white-start )
  (move-end-of-line nil)
  (print-many-whites remain-white-stop )
  (princ "//" (current-buffer))

  ;; frame around commented line 

  (move-beginning-of-line nil)
  (open-line 1)
  (c-indent-line-or-region)
  (princ (apply 'concat (make-list (- 80 (current-column))  "/")) (current-buffer))

  (next-line nil) 
  (newline 1)
  (c-indent-line-or-region)
  (princ (apply 'concat (make-list (- 80 (current-column))  "/")) (current-buffer))

  ;; reset cursor 
  (previous-line nil)
  )



(global-set-key (kbd "C-c _") 'insert-comment-line)
(global-set-key (kbd "C-c -") 'insert-white-until-half)
(global-set-key (kbd "C-c +") 'insert-new-comment-box)

(global-set-key (kbd "C-c M-n") 'comment-box)
(global-set-key (kbd "M-n")  'comment-dwim-2)

;; _____________________________________________________________________________
;;;;;;;;;;;;;;;;;;
;; COMPILATION  ;;
;;;;;;;;;;;;;;;;;;

(setq compilation-read-command nil
      compilation-auto-jump-to-first-error t)

(global-set-key (kbd "C-<f2>") (lambda () (interactive) (compile "~/lib/compile-local.sh ae"))) ; uses clang 
(global-set-key (kbd "C-<f1>")
                (lambda ()
                  (interactive)
                  (progn
                    (update-tango-project)
                    (compile "~/lib/compile-local.sh"))))

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;
;; INDENTATION  ;;
;;;;;;;;;;;;;;;;;;


(setq-default indent-tabs-mode nil)

;; dont indent after namespace 
(defconst my-cc-style
  '("user" ;; c++-mode
    (c-offsets-alist . (
                        (innamespace . [0])
                        (substatement-open . 0)
                        ) ) )
  )
(c-add-style "linux" my-cc-style)

(setq
 c-default-style "linux"
 c-basic-offset 4
 )

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;
;; YASNIPPET  ;;
;;;;;;;;;;;;;;;;

(require 'yasnippet)
(yas-global-mode 1)

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;;;;;
;; FIND OTHER FILE  ;;
;;;;;;;;;;;;;;;;;;;;;;

;; (setq ff-always-in-other-window nil)
(global-set-key (kbd "C-x M-o") 'ff-find-other-file)

;; _____________________________________________________________________________

 ;;;;;;;;;;;;;;;;;;;;;;
;; WHITESPACE MODE  ;;
 ;;;;;;;;;;;;;;;;;;;;;;
(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

;; also whitespace for python
(add-hook 'python-mode-hook 'whitespace-mode)

;; _____________________________________________________________________________

;;;;;;;;;;
;; GDB  ;;
;;;;;;;;;;

(add-hook 'gud-mode-hook 
	  '(lambda () 
	     ()
	     (define-key gud-mode-map  (kbd "M-g M-p") 'gud-down)
	     (define-key gud-mode-map  (kbd "M-g M-n") 'gud-up) ))

(setq  gdb-many-windows t
       gdb-max-children 200
       gdb-speedbar-auto-raise nil
       gud-tooltip-mode t)

(global-set-key (kbd "C-c M-l") 'gdb-restore-windows)

;; _____________________________________________________________________________
;;;;;;;;;;;;
;; EDIFF  ;;
;;;;;;;;;;;;

(setq
 ediff-split-window-function (quote split-window-horizontally)
 ediff-diff-options "-w"
 )

;; _____________________________________________________________________________
;;;;;;;;;;;
;; MAGIT ;;
;;;;;;;;;;;

(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")
(global-set-key (kbd "C-<f5>") 'magit-status)

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;;
;; UNCATEGORIZED ;;
;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-<f4>") 'valgrind )

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))

(setq gdb-create-source-file-list nil) 

(global-set-key [C-M-tab] 'clang-format-region)

;; (c-toggle-hungry-state -1 )
(setq speedbar-update-flag t)

;; (defun my:ac-c-header-init()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;;   (add-to-list 'ac-sources 'ac-source-gtags)
;;   )

;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

(setq puml-plantuml-jar-path "~/lib/plantuml.jar")


;; _____________________________________________________________________________

;;;;;;;;;
;; XML ;;
;;;;;;;;;

(setq nxml-child-indent 4)
(setq nxml-outline-child-indent 4)

;; _____________________________________________________________________________

;;;;;;;;;;;
;; rtags ;;
;;;;;;;;;;;

;TODO: BEGIN cleanup 
;; (load-file "/workspace/users/a.aberer/proj/rtags/src/rtags.el")
(require 'rtags)
(rtags-enable-standard-keybindings c-mode-base-map "\C-xr")
;; _____________________________________________________________________________

;;;;;;;;;;;;;
;; company ;;
;;;;;;;;;;;;;

(require 'company)
(global-company-mode 1)
(push 'company-rtags company-backends)

(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))
