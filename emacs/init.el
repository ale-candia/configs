(setq custom-file "~/.emacs.d/emacs.custom.el")

;; Startup

(setq inhibit-startup-message t)    ; Disable startup message

(add-to-list 'default-frame-alist '(fullscreen . maximized)) ; maximize on startup

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(set-face-attribute 'default nil :font "Comic Mono" :height 180)

(load-theme 'tango-dark)

(setq make-backup-files nil) ; stop creating swap files

(setq scroll-conservatively 101) ; don't redisplay the pointer when scrolling

(global-display-line-numbers-mode) ; Line numbers
(setq display-line-numbers-type 'relative) ; Relative line numbers

;; Better movement

(define-key global-map (kbd "M-p") (lambda ()
                                     (interactive)
                                     (let ((current-prefix-arg 24))
                                       (call-interactively 'previous-line))))

(define-key global-map (kbd "M-n") (lambda ()
                                     (interactive)
                                     (let ((current-prefix-arg 24))
                                       (call-interactively 'next-line))))

(keymap-global-set "s-<up>" 'beginning-of-buffer)
(keymap-global-set "s-<down>" 'end-of-buffer)

;; Indentation

(setq-default indent-tabs-mode nil) ; Use spaces instead of tabs
(setq-default tab-width 4)          ; Set the width of a tab to 4 spaces
(setq-default c-basic-offset 4)     ; For C/C++ modes

;; Compilation mode

(global-set-key (kbd "C-c c") 'compile)  ; compile key-binding
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter) ; ansi-colors when compiling

;; Org Mode Configuration
(with-eval-after-load 'org
  "Defines key bindings for org-mode"
  ;; Use default word jumping in org mode
  (define-key org-mode-map (kbd "M-<right>") 'right-word)
  (define-key org-mode-map (kbd "M-<left>") 'left-word)
  ;; Rebind org-metaright and org-metaleft to <M-s-<direction>> instead
  (define-key org-mode-map (kbd "M-s-<right>") 'org-metaright)
  (define-key org-mode-map (kbd "M-s-<left>") 'org-metaleft))
  
;; Packages
(package-initialize)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(require 'use-package-ensure)
(setq use-package-always-defer t)
(setq use-package-always-ensure t)

(use-package rust-mode)
(use-package magit
  :ensure t
  :config
  (setq magit-diff-refine-hunk 'all))

(load-file custom-file)
