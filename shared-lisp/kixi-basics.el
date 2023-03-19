;;; kixi-basics --- kixi preferred emacs defaults

;;; Commentary:

;;; Code:

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

(require 'diminish)

(customize-set-variable 'uniquify-buffer-name-style 'forward)
(customize-set-variable 'indent-tabs-mode nil)
(customize-set-variable 'frame-title-format "%b — Emacs")
(customize-set-variable 'tool-bar-mode nil)

(add-hook 'text-mode-hook #'turn-on-auto-fill)

(add-hook 'text-mode-hook #'flyspell-mode)
;; (add-hook 'prog-mode-hook #'flyspell-prog-mode)

(show-paren-mode +1)
(global-auto-revert-mode +1)
(electric-pair-mode +1)
(electric-quote-mode +1)

(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . 
    ;; kixi-backup-dir
    "~/.saves"
    ))    ; don't litter my fs tree or my emacs-user-directory
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

(setq inhibit-startup-message t)

;;; Disable unnecessary stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)
(setq visible-bell t)

(column-number-mode)
(customize-set-variable 'display-line-numbers-width 3)
(require 'display-line-numbers)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq-default indent-tabs-mode nil)
(customize-set-variable 'global-auto-revert-non-file-buffers t)
(global-auto-revert-mode 1)

;; Make scrolling less stuttered
(setq auto-window-vscroll nil)
(customize-set-variable 'fast-but-imprecise-scrolling t)
(customize-set-variable 'scroll-conservatively 101)
(customize-set-variable 'scroll-margin 0)
(customize-set-variable 'scroll-preserve-screen-position t)

;; Better support for files with long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

;; Make shebang (#!) file executable when saved
(add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

;;; eldoc config
(add-to-list 'display-buffer-alist
             '("^\\*eldoc for" display-buffer-at-bottom
               (window-height . 4)))
(customize-set-variable 'eldoc-echo-area-prefer-doc-buffer t)
(customize-set-variable 'eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(customize-set-variable 'eldoc-add-command-completions "paredit-")
(customize-set-variable 'eldoc-add-command-completions "combobulate-")

;;; helpful
;;
;; Lots of C-h key rebinding in kixi-keys
(require 'helpful)

(require 'emojify)

;;; different undo
;;
;; rebind the various undo keys to this
(require 'vundo)
(setq vundo-glyph-alist vundo-unicode-symbols)

(require 'command-log-mode)
(global-command-log-mode 1)

(keycast-tab-bar-mode)

(message "kixi-basics loaded.")

(provide 'kixi-basics)
;;; kixi-basics.el ends here
