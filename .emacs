(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass))))
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


;; turn off backup files
(setq make-backup-files nil)

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

(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;; Word wrap on vertical split
(setq truncate-partial-width-windows nil)

