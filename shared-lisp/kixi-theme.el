;;; kixi-theme --- make it all pretty
;;;
;;; Commentary:
;;;
;;; Code:
(require 'modus-themes)

;; Your customisations here.  For example:
;; (setq modus-themes-bold-constructs t
;;       modus-themes-mode-line '3d
;;       modus-themes-italic-constructs t
;;       modus-themes-bold-constructs nil
;;       modus-themes-common-palette-overrides modus-themes-preset-overrides-intense)

(load-theme 'modus-vivendi)

(require 'diminish)
(diminish 'rainbow-mode "🌈")
(diminish 'highlight-indent-guides-mode "👋")
(diminish 'yas-minor-mode "🥱")
(diminish 'paredit-mode "()")
(diminish 'eldoc-mode)
(diminish 'command-log-mode "⭐")
(diminish 'which-key-mode "💖")
(diminish 'clj-refactor-mode "🏗️")
(diminish 'aggressive-indent-mode "😈")
(diminish 'flyspell-mode "📔")
;; (diminish 'flymake-mode"🦋")

(customize-set-variable 'flymake-mode-line-format '("🦋" flymake-mode-line-exception flymake-mode-line-counters))

(when (display-graphic-p)
  (require 'all-the-icons))

;; Optionally add a key binding for the toggle between the themes:
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(provide 'kixi-theme)

;;; kixi-theme.el ends here
