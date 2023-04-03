;;; kixi-keys --- Where we define all default keybindings

;;; Commentary:

;;; Code:
(customize-set-variable 'flymake-mode-line-format '("🦋" flymake-mode-line-exception flymake-mode-line-counters))
(require 'flymake)
(require 'bind-key)

(require 'paredit)

(require 'embark)
(define-key embark-heading-map "T" #'titlecase-line)

;;; consult rebindings
(bind-key "C-x b" #'consult-buffer)
(bind-key "C-x C-b" #'ibuffer)

;; from https://karthinks.com/software/a-better-yank-pop-binding/
(defun my/consult-yank-or-yank-pop (&optional arg)
  "Call `consult-yank'. If called after a yank, call `yank-pop' instead."
  (interactive "*p")
  (if (eq last-command 'yank)
      (yank-pop arg)
    (consult-yank-pop)))

;; Fix weird paredit repl behaviour 
;; see: https://docs.cider.mx/cider/additional_packages.html#paredit
(define-key paredit-mode-map (kbd "RET") nil)

;; (bind-key "C-y" #'consult-yank-from-kill-ring) ;; this really doesn’t work if you want it in a minibuffer
(bind-key "M-y" #'my/consult-yank-or-yank-pop)
(bind-key "M-g g" #'consult-goto-line)
(bind-key "M-g M-g" #'consult-goto-line)
(bind-key "M-g i" #'consult-imenu-multi)
(bind-key "M-g o" #'consult-outline)
(bind-key "C-x r b" #'consult-bookmark)
(bind-key "C-x `" #'consult-flymake flymake-mode-map)
(bind-key "M-g n" #'consult-flymake flymake-mode-map)

;;; Terminal friendly paredit bindings
(bind-key "C-c <right>" #'paredit-forward-slurp-sexp paredit-mode-map)
(bind-key "C-c <left>" #'paredit-forward-barf-sexp paredit-mode-map)
(bind-key "C-c M-<up>" #'paredit-splice-sexp-killing-backward paredit-mode-map)

;; Own own drag forward and drag back using paredit
(bind-key "C-M-<down>" #'transpose-sexp-forward paredit-mode-map)
(bind-key "C-M-<up>" #'transpose-sexp-backward paredit-mode-map)

;;; more refactoring bindings
(bind-key "C-c C-r A" #'eglot-code-actions eglot-mode-map)

;;; embark
(bind-key "C-c ." #'embark-act)
(bind-key "C-c ;" #'embark-dwim)
(bind-key "C-h B" #'embark-bindings)

;;; helpful rebindings
(bind-key "C-h f" #'helpful-callable)
(bind-key "C-h x" #'helpful-command)
(bind-key "C-h v" #'helpful-variable)
(bind-key "C-h k" #'helpful-key)
(bind-key "C-h o" #'helpful-symbol)

;;; vundo rebinds
(bind-key "C-/" #'vundo)
(bind-key "C-_" #'vundo)
(bind-key "C-x u" #'vundo)

;;; Window movement helpers
(bind-key "C-c w h" #'windmove-left)
(bind-key "C-c w j" #'windmove-down)
(bind-key "C-c w k" #'windmove-up)
(bind-key "C-c w l" #'windmove-right)

(bind-key "C-c w H" #'windmove-swap-states-left)
(bind-key "C-c w J" #'windmove-swap-states-down)
(bind-key "C-c w K" #'windmove-swap-states-up)
(bind-key "C-c w L" #'windmove-swap-states-right)

(bind-key "C-c w x h" #'windmove-delete-left)
(bind-key "C-c w x j" #'windmove-delete-down)
(bind-key "C-c w x k" #'windmove-delete-up)
(bind-key "C-c w x l" #'windmove-delete-right)
(bind-key "C-c w x 1" #'delete-other-windows)
(bind-key "C-c w x 0" #'delete-window)

(bind-key "C-c w s h" #'windmove-display-left)
(bind-key "C-c w s j" #'windmove-display-down)
(bind-key "C-c w s k" #'windmove-display-up)
(bind-key "C-c w s l" #'windmove-display-right)
(bind-key "C-c w s t" #'windmove-display-new-tab)
(bind-key "C-c w s f" #'windmove-display-new-frame)

(bind-key "C-c w /" #'split-window-horizontally)
(bind-key "C-c w -" #'split-window-vertically)

(bind-key "C-c w <right>" #'winner-redo)
(bind-key "C-c w <left>" #'winner-undo)

(provide 'kixi-keys)

;;; kixi-keys.el ends here
