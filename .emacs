;; Use the Melpa package repository
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Remove the scrolle and menu bars
(menu-bar-mode -1)

;; Save temp files (*.~) to this directory instead
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set the theme
(load-theme 'wombat)
(set-frame-parameter nil 'font "DejaVu Sans Mono-10")

;; Use ido mode for opening files
(ido-mode t)

;; Run the compile command  using this keyboard shortcut
(add-hook 'go-mode-common-hook
	  (lambda () (define-key c-mode-base-map (kbd "C-c C-m") 'compile)))
