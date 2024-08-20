(setup prog-mode
  (:hook display-line-numbers-mode
	 hl-line-mode
	 column-number-mode))

(setup (:package yaml-mode
		 markdown-mode))

(setup (:package eglot)
  (:if-package orderless)
  (:option (append completion-category-overrides)
	       '(eglot (styles orderless))))

(setup (:package smartparens)
  (:require smartparens-config)
  (:hook-into prog-mode
	      org-mode))

(setup yas-minor-mode
    (:package yasnippet yasnippet-snippets)
    (:hook-into prog-mode
		org-mode))

(setup (:package magit))

(defun ap/project-magit-status ()
  "Run `magit-status' on project."
  (interactive)
  (let* ((pr (project-current t))
         (dir (cdr pr)))
    (magit-status dir)))

(setup project
  (:option project-switch-commands '((project-find-file "Find file" nil)
				     (project-find-regexp "Find regexp" nil)
				     (project-dired "Dired" nil)
				     (project-eshell "Eshell" nil)
				     (ap/project-magit-status "Magit" nil)))
  (:global "C-x p m" ap/project-magit-status))

(setup (:package vterm))

(provide 'ap-development)
