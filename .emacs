(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(fset 'yes-or-no-p #'y-or-n-p)
(fset 'display-startup-echo-area-message #'ignore)

(setq inhibit-startup-screen t
      ring-bell-function #'ignore
      default-directory "~/"
      ;initial-scratch-message nil
      )

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://orgmode.org/elpa/")
                         ("elpa"  . "https://elpa.gnu.org/packages/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(org-journal
    company
    sly
    doom-themes
    helm
    doom-modeline
    paredit
    jupyter))

;; scan packages and if not installed, install it

(mapc #'(lambda (pkg)
          (unless (package-installed-p pkg)
            (package-install pkg)))
      my-packages)

;; scrolling

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ; three line at a time
(setq mouse-wheel-progressive-speed nil)            ; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ; scroll window under mouse

;; lisp

(require 'paredit)
(require 'sly)
(show-paren-mode)
(setq show-paren-delay 0)
(add-hook 'emacs-lisp-mode-hook  #'enable-paredit-mode)
(add-hook 'lisp-mode-hook        #'enable-paredit-mode)
(add-hook 'common-lisp-mode-hook #'enable-paredit-mode)

;; julia

(require 'julia-mode)

;; haskell

; (require 'haskell-mode)

;; company

(require 'company)
(setq company-idle-delay 0.5)
(global-company-mode)

;; python

; (require 'elpy)
; (elpy-enable)

;; org

(setq org-journal-dir "~/hypnopaedia/")
(require 'org-journal)

;; helm

(require 'helm-config)
(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; misc

(require 'doom-modeline)
(doom-modeline-mode 1)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(set-default-coding-systems 'utf-8)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(set-frame-font "Noto Mono-12" nil t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("da53441eb1a2a6c50217ee685a850c259e9974a8fa60e899d393040b4b8cc922" default))
 '(package-selected-packages
   '(jupyter paredit doom-modeline helm doom-themes sly company org-journal)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'doom-outrun-electric)
;(load-theme 'doom-one)
