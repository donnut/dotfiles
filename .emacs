(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(haskell-hoogle-command "hoogle")
 '(haskell-indent-spaces 4)
 '(haskell-mode-hook (quote (turn-on-haskell-doc turn-on-haskell-indentation))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-linum-mode t)

;; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; color improvement (maybe unnecessary)
(autoload 'color-theme-approximate-on "color-theme-approximate")
(color-theme-approximate-on)

;; theme
(load-theme 'misterioso)

;; disable toolbar
(tool-bar-mode -1)

;; turn off backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; remove scoll bars
(setq scroll-bar-mode -1)

;; set font height
(set-face-attribute 'default nil :height 100)

;; dismiss splash message
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; power line
(require 'powerline)
(powerline-default-theme)

;; typescript
;;
;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;;(require 'tss)

;; Key binding
;;(setq tss-popup-help-key "C-:")
;;(setq tss-jump-to-definition-key "C->")
;;(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
;;(tss-config-default)

;; disable word wrapping
(setq default-truncate-lines t)

;;; Use "%" to jump to the matching {}.
(defun goto-match-paren (arg)
  "Go to the matching {} if on {}, otherwise insertthe character typed."
  (interactive "p")
  (cond ((looking-at "\s{") (forward-list 1) (backward-char 1))
	((looking-at "\s}") (forward-char 1) (backward-list 1))
	(t                    (self-insert-command (or arg 1))) ))
(global-set-key "%" `goto-match-paren)

;; hide show minor mode enabled to fold stuff
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; use spaces for tabs only
(setq-default indent-tabs-mode nil)

;; enable markdown syntax
(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; If necessary, add JDK_HOME or JAVA_HOME to the environment
;; (setenv "JDK_HOME" "/path/to/jdk")
;; If necessary, make sure "sbt" and "scala" are in the PATH environment
;; (setenv "PATH" (concat "/path/to/sbt/bin:" (getenv "PATH")))
;; (setenv "PATH" (concat "/path/to/scala/bin:" (getenv "PATH")))
;; You can also customize `ensime-inf-get-project-root' and `ensime-inf-get-repl-cmd-line'
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; haskell mode
