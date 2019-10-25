;; Add package repos
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://stable.melpa.org/packages/" )
	     '("marmalade" . "http://marmalade-repo.org/packages/")
	     )
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Initializing use-package
(eval-when-compile
  (require 'use-package))

;; Bind-key setup
(use-package bind-key
  :ensure t)

;; Elpy Setup
(use-package elpy
  :ensure t
  :init (elpy-enable))

;; Flycheck setup
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(when (require 'flycheck nil t)
  (setq elpy-module (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Magit setup
(use-package magit
  :ensure t
  :init (global-set-key (kbd "C-x g") 'magit-status))

;; Enable linum mode globally
(global-linum-mode 1)

;; Cucumber major mode setup
(use-package feature-mode
  :ensure t)

;; Salt major mode setup
(use-package salt-mode
  :ensure t)

;; Terraform major mode setup
(use-package terraform-mode
  :ensure t)

;; Indium setup
(use-package indium
  :ensure t)
(add-hook 'js-mode-hook #'indium-interaction-mode)

;; Ido mode setup
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-mode 1)

;; IPython setup
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i")
