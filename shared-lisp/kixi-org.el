;;; kixi-org --- org and related things bascially
;;;
;;; Commentary:
;;;
;;; Just the basics for org.  org-roam you should configure yourself.
;;;
;;; Code:

;; org-mode
(require 'org)
(require 'org-appear)
(require 'org-cliplink)
(require 'org-protocol)
(require 'org-modern)
(require 'orgit)

(customize-set-variable 'org-startup-folded 'show2levels)

(setq diary-list-include-blanks t)
(add-hook 'diary-list-entries-hook 'diary-include-other-diary-files)
(add-hook 'diary-mark-entries-hook 'diary-mark-included-diary-files)

(provide 'kixi-org)

;;; kixi-org.el ends here
