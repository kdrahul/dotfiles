(setq package-archives
	  '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
		("MELPA"        . "https://melpa.org/packages/")
		("ORG"          . "https://orgmode.org/elpa/")
		("MELPA Stable" . "https://stable.melpa.org/packages/")
		("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
	  package-archive-priorities
	  '(("GNU ELPA"     . 20)
		("MELPA"        . 15)
		("ORG"          . 10)
		("MELPA Stable" . 5)
		("nongnu"       . 0)))

(package-initialize)
(tool-bar-mode     -1)    ;; Remove toolbar
      (scroll-bar-mode   -1)   ;; Remove scollbars
      (menu-bar-mode     -1)   ;; Remove menu bar
      (blink-cursor-mode -1)
      (set-fringe-mode -1)


(setq ring-bell-function 'ignore)
(setq enabled-option t
      disabled-option nil
      enabled-mode 1
      disabled-mode 0)
;; Blind me less
(load-theme 'tango-dark t)
(set-face-attribute 'default nil :font "Roboto Mono" :height 180)


;;(menu-bar-mode -1)
(setq line-number-mode t)
(use-package doom-themes
  :ensure t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-tokyo-night t)

  ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (nerd-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;(require 'lsp-mode)
;;(add-hook 'go-mode-hook #'lsp-deferred)

;;(defun lsp-go-install-save-hooks ()
  ;;(add-hook 'before-save-hook #'lsp-format-buffer t t)
;;  (add-hook 'before-save-hook #'lsp-organize-imports t t))
;;(add-hook 'go-mode-hook #'lsp-go-install-save-hook)
;;(lsp-register-custom-settings
;; '(("gopls.completeUnimported" t t )
;;   ("gopls.staticcheck" t t)))

;;;; DO NOT TOUCH BELOW LINES!!!
;;;; They are system generated.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d"
     "01f347a923dd21661412d4c5a7c7655bf17fb311b57ddbdbd6fce87bd7e58de6"
     default))
 '(inhibit-default-init t)
 '(package-selected-packages
   '(doom-themes flymake-go go-mode go-tag godoctor spacemacs-theme
		 tree-sitter)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
