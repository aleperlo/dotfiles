(defun ap/org-font-setup ()
    (dolist (face org-level-faces)
      (set-face-attribute face nil :weight 'bold :height 1.2)))

(setup (:package cdlatex))

(setup (:package org)
  (:option
   ;; org-export
   org-export-with-toc nil
   ;; org-latex
   org-latex-packages-alist '(("" "amsthm")
			      ("margin=2cm" "geometry")
			      ("" "listings"))
   org-latex-listings t
   org-latex-listings-options '(("basicstyle" "\\ttfamily"))
   org-highlight-latex-and-related '(latex))
  (:bind [remap consult-outline] #'consult-org-heading
	 "C-c c" org-latex-export-to-pdf)
  (:hook org-indent-mode
	 visual-line-mode
	 turn-on-org-cdlatex
	 turn-off-smartparens-mode)
  (:when-loaded (ap/org-font-setup)))

(setup (:package visual-fill-column)
  (:with-mode org-mode
    (:local-set visual-fill-column-width 120
		visual-fill-column-center-text t)
    (:hook visual-fill-column-mode)))

(setup smartparens-config
  (sp-local-pair 'org-mode "\\[" "\\]")
  (sp-local-pair 'org-mode "$" "$")
  (sp-local-pair 'org-mode "'" "'" :actions '(rem))
  (sp-local-pair 'org-mode "=" "=" :actions '(rem))
  (sp-local-pair 'org-mode "\\left(" "\\right)" :trigger "\\l(" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left[" "\\right]" :trigger "\\l[" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left\\{" "\\right\\}" :trigger "\\l{" :post-handlers '(sp-latex-insert-spaces-inside-pair))
  (sp-local-pair 'org-mode "\\left|" "\\right|" :trigger "\\l|" :post-handlers '(sp-latex-insert-spaces-inside-pair)))

(setup (:package org-roam)
  (:option
   org-roam-directory (file-truename "~/Sync/roam"))
  (org-roam-db-autosync-mode))

(setup (:package org-roam-ui))

(provide 'ap-org)
