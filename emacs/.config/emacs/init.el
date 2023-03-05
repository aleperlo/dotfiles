(defvar emacs-backup-directory
  (concat user-emacs-directory "backups/")
  "Directory where automatic backups created by emacs are stored")

(setq backup-directory-alist
      `((".*" . ,emacs-backup-directory)))
(setq version-control t)
(setq delete-old-versions t)
(setq create-lockfiles nil)

(setq custom-file "~/.config/emacs/custom.el")
(load custom-file 'noerror)

(setq indent-tabs-mode nil)

(require 'ap-setup)
(require 'ap-ui)
(require 'ap-completion)
(require 'ap-dired)
(require 'ap-development)
(require 'ap-org)
(require 'ap-chat)

(require 'ap-lang-c)
(require 'ap-lang-coq)
(require 'ap-lang-lisp)
(require 'ap-lang-haskell)
(require 'ap-lang-python)
