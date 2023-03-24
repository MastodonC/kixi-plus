;;; kixi-theme --- make it all pretty
;;;
;;; Commentary:
;;;
;;; Code:
;; (require 'modus-themes)

;; Your customisations here.  For example:
;; (setq modus-themes-bold-constructs t
;;       modus-themes-mode-line '3d
;;       modus-themes-italic-constructs t
;;       modus-themes-bold-constructs nil
;;       modus-themes-common-palette-overrides modus-themes-preset-overrides-intense)

;; (load-theme 'modus-vivendi)
(require 'ef-themes)
(setq ef-themes-disable-other-themes t)
(load-theme 'ef-bio :no-confirm)

(setq ef-themes-to-toggle '(ef-bio ef-cherie))

(when (display-graphic-p)
  (require 'all-the-icons))

;; Optionally add a key binding for the toggle between the themes:
(define-key global-map (kbd "<f5>") #'ef-themes-toggle)

(provide 'kixi-theme)

;;; kixi-theme.el ends here
