;;; kixi-completion --- vertico and friends
;;;
;;; Commentary:
;;;
;;; Code:
;; vertico
(require 'which-key)
(diminish 'which-key-mode "💖")
(which-key-mode)

(customize-set-variable 'vertico-cycle t)
(require 'vertico)
(vertico-mode)

(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))
(require 'orderless)

(require 'marginalia)
(marginalia-mode)

(require 'consult)
;; Use Consult to select xref locations with preview
(setq xref-show-xrefs-function #'consult-xref
      xref-show-definitions-function #'consult-xref)

(require 'embark)

(require 'embark-consult)
(add-hook 'embark-collect-mode-hook #'consult-preview-at-point)

(customize-set-variable 'corfu-cycle t)
(customize-set-variable 'corfu-auto t)
(customize-set-variable 'corfu-auto-delay 0.5)
(customize-set-variable 'corfu-auto-prefix 2)
(customize-set-variable 'corfu-echo-documentation 0.75)

(customize-set-variable 'corfu-quit-at-boundary 'separator)
(customize-set-variable 'corfu-quit-no-match 'separator)
(customize-set-variable 'corfu-preview-current t)
(require 'corfu)
(global-corfu-mode)


;; FIXME: Migrate to corfu-popupinfo in a way that works in the terminal
;; (require 'corfu-doc)
;; (add-hook 'corfu-mode-hook #'corfu-doc-mode)
(require 'corfu-popupinfo)

;; (straight-use-package
;;  '(popon :type git :repo "https://codeberg.org/akib/emacs-popon.git"))
(require 'popon)

;; (straight-use-package
;;  '(corfu-terminal :type git :repo "https://codeberg.org/akib/emacs-corfu-terminal.git"))
(require 'corfu-terminal)
(unless (display-graphic-p)
  (corfu-terminal-mode +1))

(require 'cape)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-dabbrev)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)
(advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)

;; Needs consult rather than eglot
(require 'consult-eglot)
(defun consult-eglot-copy-symbol (arg)
  "Copy ARG symbol that you find using consult."
  (interactive "p")
  (save-excursion
    (call-interactively 'consult-eglot-file-symbols)
    (let ((symbol (thing-at-point 'symbol)))
      (when symbol
        (kill-new symbol)
        (message "\"%s\" has been copied" symbol)))))


(provide 'kixi-completion)

;;; kixi-completion.el ends here
