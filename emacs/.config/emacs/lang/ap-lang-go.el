(setup (:package go-mode)
  (:with-mode before-save
    (:hook gofmt-before-save))
  (:hook eglot-ensure)
  (:hook (lambda ()
	   (setq tab-width 4))))


(provide 'ap-lang-go)
