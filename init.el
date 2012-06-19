(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-command "xelatex")
 '(TeX-command "tex")
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(js2-basic-offset 2))

;; UI
(cond
  ((fboundp 'load-theme) (load-theme 'tango-dark) )
)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; no backup and auto save
(setq make-backup-files nil)
(setq auto-save-default nil)

;; save my life
;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(fset 'yes-or-no-p 'y-or-n-p);; use y/n to anwser
(global-set-key (kbd "C-x C-p") 'previous-buffer)
(global-set-key (kbd "C-x C-n") 'next-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; disable both beeping and visible-bell
(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(icomplete-mode 1)

;; rubymode
(add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))

;; eshell alias
(defun eshell/emacs (file) (find-file file))
(defun eshell/vim (file) (find-file file))

(package-initialize)
;; evil
(add-to-list 'load-path "~/.emacs.d/evil")
(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map " " 'evil-ex)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; rbenv
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") exec-path))

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/markdown-mode")
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.mkd\\'" . markdown-mode))

(setq custom-load-paths (list "slim-mode" "rinari" "rhtml-mode" "markdown-mode" "ruby-electric" "flymake-ruby"))

(add-to-list 'load-path "~/.emacs.d/slim-mode")
(require 'slim-mode)

;; rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook (lambda () (rinari-launch)))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))

(add-to-list 'load-path "~/.emacs.d/ruby-electric")
(require 'ruby-electric)
(add-to-list 'load-path "~/.emacs.d/flymake-ruby")
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook (lambda () (flymake-ruby-load)))

;; aliases
(defalias 'dtw 'delete-trailing-whitespace)
(defalias 'rb 'revert-buffer)
