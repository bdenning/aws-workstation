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
(add-hook 'go-mode-hook
	  (lambda () (define-key c-mode-base-map (kbd "C-c C-m") 'compile)))

;; Set a bunch of go-mode helpers
(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "C-c C-m") 'compile)
  (local-set-key (kbd "M-.") 'godef-jump)
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
	   "go build -v && go test -v && go vet")))
(add-hook 'go-mode-hook 'my-go-mode-hook)
