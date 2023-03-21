;;; kixi-git --- configure basic git things

;;; Commentary:

;;; Code:

(require 'magit)
(customize-set-variable 'magit-diff-refine-hunk t)
(customize-set-variable 'magit-diff-refine-ignore-whitespace t)

;; we use delta to make our diffs better
;; https://github.com/dandavison/magit-delta

(if (executable-find "delta")
    (progn
      (message "delta found. Adding magit-delta-mode")
      (add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1))))
  (message "delta diff programme not found. Using standard magit-diff."))

(require 'magit-todos)

(require 'hl-todo)
(add-hook 'prog-mode-hook (lambda () (hl-todo-mode)))

(require 'git-auto-commit-mode)

(provide 'kixi-git)

;;; kixi-git.el ends here
