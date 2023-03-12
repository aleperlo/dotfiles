(setup (:package vertico)
  (:option vertico-mode t
	   vertico-cycle t
	   vertico-mouse-mode t))

(setup savehist
  (:option savehist-mode t))

(setup recentf
  (:option recentf-mode t))

(setup (:package marginalia)
  (:option marginalia-mode t)
  (:bind-into minibuffer-local-map
    "M-A" marginalia-cycle))

(setup (:package orderless)
  (:option completion-styles '(orderless basic)
	   completion-category-overrides '((file (styles basic partial-completion)))))

(setup (:package consult)
  (:global [remap switch-to-buffer] #'consult-buffer
           [remap goto-line] #'consult-goto-line
           [remap project-switch-to-buffer] #'consult-project-buffer
	   [remap isearch-forward] #'consult-line
	   [remap yank-pop] #'consult-yank-pop
	   ;; M-s prefix (search)
           "M-s g" (if (executable-find "rg")
                       #'consult-ripgrep
                     #'consult-grep)
           "M-s d" consult-find
	   ;; M-g prefix (navigation)
	   "M-g e" consult-compile-error
           "M-g f" consult-flymake
	   "M-g i" consult-imenu
           "M-g o" consult-outline)
  (:option xref-show-xrefs-function #'consult-xref
           xref-show-definitions-function #'consult-xref))

(setup ibuffer
  (:global [remap list-buffers] #'ibuffer-other-window))

(setup (:package embark)
  (:global "C-." embark-act
	   "C-;" embark-dwim))

(setup (:package embark-consult)
  (:load-after embark)
  (:with-hook embark-collect-mode-hook
    (:hook consult-preview-at-point-mode)))

(setup (:package corfu)
  (:bind-into corfu-map
    "C-ò" corfu-insert-separator)
  (:option global-corfu-mode t
	   corfu-auto t
	   corfu-cycle t))

(setup (:package kind-icon)
  (:load-after corfu)
  (:option kind-icon-default-face 'corfu-default
	   kind-icon-use-icons nil
	   kind-icon-blend-background nil
	   (append corfu-margin-formatters)
	   #'kind-icon-margin-formatter))

(setup (:package which-key)
  (:option which-key-mode t))

(provide 'ap-completion)
