(setup (:package ef-themes)
  (load-theme 'ef-elea-light t))

(setup (:package minions)
  (:option minions-mode t))

(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

(setup (:package ligature)
  (:option global-ligature-mode t)
  (ligature-set-ligatures
   'prog-mode
   '("</" "</>" "~-" "-~" "~@" "<~" "<~>"
     "~>" "~~" "~~>" ">=" "<=" "<!" "<!--"
     "##" "###" "####" "|-" "-|" "|->" "<-|"
     ">-|" "|-<" "|=" "|=>" ">-" "<-" "<--"
     "-->" "->" "-<" ">->" ">>-" "<<-" "<->"
     "->>" "-<<" "<-<" "==>" "=>" "=/=" "!=="
     "!=" "<==" ">>=" "=>>" ">=>" "<=>" "<=<"
     "=<=" "=>=" "<<=" "=<<" ".-" ".=" "=:="
     "=!=" "==" "===" "::" ":=" ":>" ":<"
     ">:" "<:" ";;" "<|" "<|>" "|>" "<>" "<$"
     "<$>" "$>" "<+" "<+>" "+>" "?=" "/="
     "/==" "/\\" "\\/" "__" "&&" "++" "+++")))

(provide 'ap-ui)
