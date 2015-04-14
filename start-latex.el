(eval-after-load "tex"
  '(progn
     (add-to-list 'TeX-expand-list
                  '("%(RubberPDF)"
                    (lambda ()
                      (if
                          (not TeX-PDF-mode)
                          ""
                        "--pdf"))))
     (add-to-list 'TeX-command-list
                '("Rubber" "rubber -d %(RubberPDF) %t" TeX-run-shell nil t) t)))

(setq
 TeX-PDF-mode t
 TeX-auto-save t
 TeX-parse-self t
 reftex-plug-into-AUCTeX t
 ) 

(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill) 
(add-hook 'LaTeX-mode-hook 'reftex-mode) 
(add-hook 'LaTeX-mode-hook 'flyspell-mode) 

