(defun ap/org-font-setup ()
    (dolist (face org-level-faces)
      (set-face-attribute face nil :weight 'bold :height 1.2)))

(setup (:package org)
  (:option
   ;; org-export
   org-export-with-toc nil
   ;; org-latex
   org-latex-packages-alist '(("" "amsthm")
			      ("margin=2cm" "geometry")
			      ("" "listings"))
   org-latex-listings t
   org-latex-listings-options '(("basicstyle" "\\ttfamily")))
  (:bind [remap consult-outline] #'consult-org-heading
	 "C-c c" org-latex-export-to-pdf)
  (:hook org-indent-mode
	 visual-line-mode)
  (:when-loaded (ap/org-font-setup)))

(setup (:package visual-fill-column)
  (:with-mode org-mode
    (:local-set visual-fill-column-width 120
		visual-fill-column-center-text t)
    (:hook visual-fill-column-mode)))

(provide 'ap-org)
