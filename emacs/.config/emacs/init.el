(defvar ap-backup-directory
  (concat user-emacs-directory "backups/")
  "Directory where automatic backups created by emacs are stored")

(defvar ap-custom-file
  (concat user-emacs-directory "custom.el")
  "File for options set using emacs customization interface")

(setq backup-directory-alist
      `((".*" . ,ap-backup-directory)))
(setq version-control t)
(setq delete-old-versions t)
(setq create-lockfiles nil)

(setq custom-file ap-custom-file)
(load custom-file 'noerror)

(setq indent-tabs-mode nil)

(require 'ap-setup)
(require 'ap-ui)
(require 'ap-completion)
(require 'ap-dired)
(require 'ap-development)
(require 'ap-org)

(require 'ap-lang-c)
(require 'ap-lang-haskell)
(require 'ap-lang-python)
