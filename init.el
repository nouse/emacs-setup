(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
)
;; UI
(when (> emacs-major-version 23)
  (load-theme 'tango-dark))
(when window-system
  (server-start)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(unless (eq window-system 'ns)
  (menu-bar-mode 0))

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
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

;; eshell alias
(defun eshell/emacs (file) (find-file file))
(defun eshell/vim (file) (find-file file))

(add-to-list 'load-path "~/.emacs.d/lisp")

(when (<= emacs-major-version 23)
  (require 'package)
)
(package-initialize)
;; evil
(setq evil-shift-width 2)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map " " 'evil-ex)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

;; rbenv
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") exec-path))

(require 'inf-ruby)
(require 'ruby-electric)

(require 'flycheck)
(define-key flycheck-mode-map (kbd "C-c b") 'flycheck-buffer)
(add-hook 'ruby-mode-hook 'flycheck-mode)
;; OS X only
(when (eq system-type 'darwin)
      (setenv "PATH" (concat (getenv "HOME") "/Library/Haskell/bin:" (getenv "PATH")))
      (setq exec-path (cons (concat (getenv "HOME") "/Library/Haskell/bin") exec-path))
      (load "~/.emacs.d/haskell-mode/haskell-site-file")
      (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
      (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
      (add-to-list 'load-path "~/.emacs.d/ghc-mod")
      (autoload 'ghc-init "ghc" nil t)
      (add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
      )
;; aliases
(defalias 'dtw 'delete-trailing-whitespace)
;; auto revert
(global-auto-revert-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
