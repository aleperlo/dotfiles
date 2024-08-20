(setup c-mode
  (:require cc-mode)
  (:local-set indent-tabs-mode nil)
  (:bind "C-c c" compile)
  (:option c-default-style '((c-mode . "stroustrup")
			     (java-mode . "java")
			     (awk-mode . "awk")
			     (other . "gnu")))
  (:hook eglot-ensure))

(provide 'ap-lang-c)
