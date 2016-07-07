(add-to-list 'auto-mode-alist '("\\.hpp\\'" . c++-mode))


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

;TODO: move to user defined things
(global-set-key (kbd "C-<f1>")
                (lambda ()
                  (interactive)
                  (compile "cd /tmp/exabayes/ ; make -j4 ")))

(global-set-key (kbd "C-<f2>")
                (lambda ()
                  (interactive)
                  (compile "~/lib/compile-local.sh ae"))) ; uses clang

(global-set-key (kbd "C-<f1>")
                (lambda ()
                  (interactive)
                  (progn
                    (compile "~/lib/compile-local.sh"))))

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;
;; INDENTATION  ;;
;;;;;;;;;;;;;;;;;;


(setq-default indent-tabs-mode nil)

;; ;; dont indent after namespace
;; (defconst my-cc-style
;;   '("user" ;; c++-mode
;;     (c-offsets-alist . (
;;                         (innamespace . [0])
;;                         (substatement-open . 0)
;;                         ) ) )
;;   )
;; (c-add-style "linux" my-cc-style)

;; (setq
;;  c-default-style "linux"
;;  c-basic-offset 4
;;  )
(defun my-c++-mode-hook()
  (setq c-basic-offset 4)
  (c-set-offset 'innamespace '0))

(setq c-default-style "linux")

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;
;; YASNIPPET  ;;
;;;;;;;;;;;;;;;;
(use-package yasnippet
  :config (yas-global-mode 1))

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
(use-package whitespace
  :ensure
  :init
  (setq whitespace-line-column 80) ;; limit line length
  (setq whitespace-style '(face lines-tail))
  :config
  (add-hook 'c++-mode-hook (lambda ()  (interactive) (whitespace-mode 1)))
  (add-hook 'c-mode-hook (lambda () (interactive) (whitespace-mode 1)))
  (add-hook 'python-mode-hook 'whitespace-mode))



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
 ediff-diff-options "-w" )

;; _____________________________________________________________________________
;;;;;;;;;;;
;; MAGIT ;;
;;;;;;;;;;;
(use-package magit
  :init
  (setq magit-auto-revert-mode nil)
  (setq magit-last-seen-setup-instructions "1.4.0")
  :bind
  ("C-<f5>" . magit-status))

;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;;
;; UNCATEGORIZED ;;
;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(setq gdb-create-source-file-list nil)

(setq speedbar-update-flag t)

(use-package puml-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode))
  (setq puml-plantuml-jar-path "~/lib/plantuml.jar") )

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

(use-package rtags

  :init
  (setq rtags-autostart-diagnostics t)
  (setq rtags-completions-enabled t)

  :config
  (rtags-enable-standard-keybindings)
  (rtags-diagnostics)
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-common-hook 'rtags-start-process-unless-running)

  :bind
  (:map
   c-mode-base-map
   ("M-." . rtags-find-symbol-at-point)
   ("M-," . rtags-find-references-at-point)))

;; _____________________________________________________________________________

;;;;;;;;;;;;;
;; company ;;
;;;;;;;;;;;;;
(use-package company
  :ensure
  :config
  (global-company-mode 1)
  (push 'company-rtags company-backends)
  (setq company-auto-complete t) )

;; todo
(global-set-key [C-tab]  'company-complete)


;; ____________________________________________________________________________
;;;;;;;;;;;;;;;;;;;;;
;; uncrustify-mode ;;
;;;;;;;;;;;;;;;;;;;;;

(use-package uncrustify-mode
  :config
  (add-hook 'c-mode-hook 'uncrustify-mode)
  (add-hook 'c++-mode-hook 'uncrustify-mode))
