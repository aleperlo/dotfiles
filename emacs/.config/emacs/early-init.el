;; Disable some GUI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Emacs behaviour at startup
(setq inhibit-startup-screen t)
(setq inhibit-startup-buffer-menu t)

;; Add lisp and lang directories to load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))

;; Make native compilation warnings silent
(setq native-comp-async-report-warnings-errors 'silent)
