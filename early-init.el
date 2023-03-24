;;; early-init.el --- things that need to run early in Emacs startup
;;;
;;; Commentary:
;;;
;;; Code:

;; Setting load files and paths
(setq custom-file (concat (expand-file-name user-emacs-directory) "custom.el"))
(if (file-exists-p custom-file)
    (load custom-file))

(push (concat (expand-file-name user-emacs-directory) "/shared-lisp") load-path)
(push (concat (expand-file-name user-emacs-directory) "/personal-lisp") load-path)

;; Remove tool-bar-mode, because it's an outdated visual
;; metaphor. Scroll bar and menu bar can stay until the user wants to
;; remove them.
(if window-system
    (progn
      (customize-set-variable 'tool-bar-mode nil)
      (tool-bar-mode -1)))

(defvar old-file-name-handler file-name-handler-alist)
(defvar default-gc-cons-threshold gc-cons-threshold)
(setq file-name-handler-alist nil
      gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
          (lambda nil
            (setq gc-cons-threshold default-gc-cons-threshold
                  gc-cons-percentage 0.1
                  file-name-handler-alist (delete-dups
					   (append file-name-handler-alist
						   old-file-name-handler)))))

(message "Early init loaded.")

(provide 'early-init)

;;; early-init.el ends here
