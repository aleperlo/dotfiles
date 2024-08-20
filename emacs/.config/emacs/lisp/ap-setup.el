(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-archive-priorities
      '(("melpa" . 1)
	("org" . 2)))

(setq package-pinned-packages
      '((telega . "melpa-stable")))

(unless (package-installed-p 'setup)
  (package-install 'setup))

(require 'setup)

(setup-define :load-after
    (lambda (&rest features)
      (let ((body `(require ',(setup-get 'feature))))
        (dolist (feature (nreverse features))
          (setq body `(with-eval-after-load ',feature ,body)))
        body))
  :documentation "Load the current feature after FEATURES.")

(provide 'ap-setup)
