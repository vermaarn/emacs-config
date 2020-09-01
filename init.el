;;; package --- summary
;;; Commentary:
;;; Code:
(setq inhibit-startup-message t)
(tool-bar-mode -1)

(require 'package)
(setq package-enable-at-startup nil)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  )

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package jupyter
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

;;(add-hook 'c++-mode-hook 'irony-mode)


(use-package go-mode
  :ensure t)
(add-hook 'before-save-hook' 'gofmt-before-save)

;;(setq indo-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "C-h") 'delete-backward-char)

(defalias 'list-buffers 'ibuffer)

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

(use-package counsel
  :ensure t
  )

(use-package go-errcheck
  :ensure t
  )

(use-package flycheck
  :ensure t
  )

(global-flycheck-mode)
;;(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++11")))

;; (require 'rtags)
;; (cmake-ide-setup)

(use-package swiper
  :ensure t
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    ;; enable this if you want `swiper' to use it
    ;; (setq search-default-mode #'char-fold-to-regexp)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-find-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
    ))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(tango-dark))
 '(package-selected-packages
   '(tide rtags cmake-ide irony jupyter which-key use-package try go-mode go-errcheck flycheck dracula-theme cuda-mode counsel ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
(provide 'init)
;;; init.el ends here
