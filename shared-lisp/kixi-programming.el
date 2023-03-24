;;; kixi-programming --- Basic programming config
;;;
;;; Commentary:
;;;
;;; Code:
(diminish 'yas-minor-mode "🥱")
(require 'paredit)
(add-hook 'emacs-lisp-mode-hook #'paredit-mode)
(add-hook 'clojure-mode-hook #'paredit-mode)
(add-hook 'clojurescript-mode-hook #'paredit-mode)
(add-hook 'clojurec-mode-hook #'paredit-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

(defun transpose-sexp-forward ()
  (interactive)
  (forward-sexp)
  (transpose-sexps 1)
  (backward-sexp))

(defun transpose-sexp-backward ()
  (interactive)
  (forward-sexp)
  (transpose-sexps -1)
  (backward-sexp))

(require 'yasnippet)
(yas-global-mode 1)

(require 'consult-yasnippet)
(require 'aggressive-indent)
(diminish 'aggressive-indent-mode "😈")
(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'clojurescript-mode-hook #'aggressive-indent-mode)
(add-hook 'clojurec-mode-hook #'aggressive-indent-mode)
(add-hook 'cider-repl-mode-hook #'aggressive-indent-mode)

(require 'rainbow-mode)
(diminish 'rainbow-mode "🌈")
(add-hook 'prog-mode-hook #'rainbow-mode)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(require 'highlight-indent-guides)
(diminish 'highlight-indent-guides-mode "👋")
(add-hook 'prog-mode-hook #'highlight-indent-guides-mode)

;; Let’s use highlight symbol for now C-x w .
(require 'auto-highlight-symbol)
(diminish 'auto-highlight-symbol-mode "💡")
(add-hook 'prog-mode-hook #'auto-highlight-symbol-mode)

(customize-set-variable 'ediff-window-setup-function 'ediff-setup-windows-plain)
(require 'ediff)

(customize-set-variable 'separedit-default-mode 'markdown-mode)
(require 'separedit)
(require 'markdown-mode)

(setq markdown-command "multimarkdown")
(append auto-mode-alist '("README\\.md" . gfm-mode))


(require 'csv-mode)
(require 'commify)

(customize-set-variable 'eglot-connect-timeout 600)
(setq eglot-autoshutdown t)
(setq eglot-extend-to-xref t)
(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (setq eldoc-documentation-strategy
                  'eldoc-documentation-compose-eagerly)))

(customize-set-variable 'eglot-menu-string "🪺")
(require 'eglot)
;; Not everything has an eglot
;; (add-hook 'prog-mode-hook #'eglot-ensure)
(with-eval-after-load 'clojure-mode
  (add-hook 'clojure-mode-hook #'eglot-ensure))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs 
               '(nix-mode . ("/etc/profiles/per-user/bld/bin/rnix-lsp"))))
(add-hook 'nix-mode-hook #'eglot-ensure)

(require 'flymake)
(add-hook 'prog-mode-hook #'flymake-mode)

(provide 'kixi-programming)

;;; kixi-programming.el ends here
