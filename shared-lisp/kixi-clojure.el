;;; kixi-clojure -- cider and clojure
;;;
;;; Commentary:
;;;
;;; Code:
(customize-set-variable 'nrepl-log-messages t)
;; (setq
;;  cider-font-lock-dynamically nil ; use lsp semantic tokens
;;  cider-eldoc-display-for-symbol-at-point nil ; use lsp
;;  cider-prompt-for-symbol nil
;;  )

(require 'diminish)
(require 'clojure-mode)
(require 'clj-refactor)
(diminish 'clj-refactor-mode "🏗")
(require 'cider)
(customize-set-variable 'cider-eval-spinner-type 'vertical-breathing)
(customize-set-variable 'cider-mode-line
                        '(:eval
                          (format " 🍺[%s]"
                                  (cider--modeline-info))))

(diminish 'clojure-mode "λ")

;; yasnippet should be in the hook from prog-mode
;; (require 'yasnippet)
(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            ;; (yas-minor-mode 1)
            (cljr-add-keybindings-with-prefix "C-c C-r")))

(require 'clj-deps-new)
;; (require 'neil)

(defun clerk-show ()
  "Show the current buffer in a clerk managed browser window."
  (interactive)
  (save-buffer)
  (let
      ((filename
        (buffer-file-name)))
    (when filename
      (cider-interactive-eval
       (concat "(nextjournal.clerk/show! \"" filename "\")")))))


(provide 'kixi-clojure)

;;; kixi-clojure.el ends here
