
;; BEGIN hack for exports 
(setq  org-html-postamble nil) 
(setq org-image-actual-width nil)

(setq org-latex-classes nil)
(add-to-list  'org-latex-classes	
       '( "koma-article"
	 "\\documentclass{scrartcl}"
	 ("\\section{%s}" . "\\section*{%s}")
	 ("\\subsection{%s}" . "\\subsection*{%s}")
	 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	 ("\\paragraph{%s}" . "\\paragraph*{%s}")
	 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(setq org-latex-to-mathml-convert-command
      "java -jar %j -unicode -force -df %o %I"
      org-latex-to-mathml-jar-file
      "~/lib/mathtoweb.jar")
;; END 
