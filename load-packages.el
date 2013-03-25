(defun load-packages ()
  "initialize packages both for emacs 23 and above"
  (add-to-list 'load-path "~/.emacs.d/lisp")
  (unless (require 'package nil t)
    (url-copy-file "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" "~/.emacs.d/lisp/package.el"))
  (require 'package)
  (add-to-list 'package-archives 
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)
  (package-list-packages)
)
(provide 'load-packages)
