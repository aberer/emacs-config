(setq delete-selection-mode nil)
(setq fill-column 80)

;; _____________________________________________________________________________
;;;;;;;;;;;;;;
;; MIDNIGHT ;;
;;;;;;;;;;;;;;

(require 'midnight)

(setq clean-buffer-list-delay-general 1)


;; _____________________________________________________________________________
;;;;;;;;;;;;;;;
;; SCROLLING ;;
;;;;;;;;;;;;;;;

(setq
 scroll-margin 1
 auto-window-vscroll nil
 scroll-step 1
 scroll-conservatively 5
 scroll-preserve-screen-position 1
 )


;; _____________________________________________________________________________
;;;;;;;;;;;;;;
;; UNIQUIFY ;;
;;;;;;;;;;;;;;

(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward
 uniquify-separator ":")

;; _____________________________________________________________________________
;;;;;;;;;;;;;
;; browser ;;
;;;;;;;;;;;;;
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-generic-program "/usr/bin/chromium")

;; _____________________________________________________________________________

(global-set-key (kbd "C-c C-r") (lambda () (interactive) (load-file "~/.emacs.d/init.el")))
(global-set-key (kbd "<f8>") 'toggle-truncate-lines)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c q") 'auto-fill-mode)
(global-set-key (kbd "C-c C") 'calc)
(global-set-key (kbd "C-c C-i") 'timeclock-in)
(global-set-key (kbd "C-c C-o") 'timeclock-out)
(global-set-key (kbd "C-c f") 'comint-dynamic-complete-filename)

(global-set-key (kbd "C-j") 'newline-and-indent)

;; faster moving between buffers
(windmove-default-keybindings 'meta)

(setq require-final-newline t)



;;;;;;;;;;;;;;;;;;;
;; golden ratio  ;;
;;;;;;;;;;;;;;;;;;;
(require 'golden-ratio)
(golden-ratio-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;
;; whitespace butler  ;;
;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ws-butler)
(ws-butler-global-mode t)



;; _____________________________________________________________________________

;;;;;;;;;;;
;; helm  ;;
;;;;;;;;;;;

(require 'helm)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h o") 'helm-occur)

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-:") 'helm-company)
     (define-key company-active-map (kbd "C-:") 'helm-company)))


;; _____________________________________________________________________________

;;;;;;;;;;;;;;;;;;
;; smart parens ;;
;;;;;;;;;;;;;;;;;;

(use-package smartparens-config
             :ensure smartparens
             :config
             (progn
               (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
