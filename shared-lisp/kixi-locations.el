;;; kixi-locations --- change the locations of things away from user-emacs-directory

;;; Commentary:

;; By default things like to save bits of state or config in your
;; `user-emacs-directory`, which was fine in the old days but is a real
;; pain now that we use things like `--init-directory` to point at
;; different configurations that more or less do the same thing.
;; 
;; This file attempts to move things to `emacs-state-home` so that they
;; don’t clutter up `user-emacs-directory`

;;; Code:

;;; # Enable some good basics
;;  - Find places for the following:
;;    - [x] auto-save-list directory
;;    - [x] bookmarks
;;    - [x] .cache
;;    - [x] diary
;;    - [x] history
;;    - [x] mastodon.plstore
;;    - [x] .org-id-locations
;;    - [x] org-roam.db
;;    - [x] persist
;;    - [x] places
;;    - [x] projects
;;    - [x] recentf
;;    - [x] request
;;    - [x] tramp
;;    - [x] transient
;;    - [x] url
;;    - [x] work-diary
;;    - [x] multisession

(customize-set-variable 'multisession-directory (expand-file-name "multisession/" emacs-state-home))

(customize-set-variable 'desktop-path (list emacs-state-home "~"))
(desktop-save-mode 1)

(customize-set-variable 'url-cookie-file (expand-file-name "url/cookies" emacs-state-home))
(customize-set-variable 'url-cache-directory (expand-file-name "url/cache" emacs-state-home))

(customize-set-variable 'request-storage-directory (expand-file-name "request" emacs-state-home))

(customize-set-variable 'project-list-file (expand-file-name "projects" emacs-state-home))

(customize-set-variable 'org-roam-db-location (expand-file-name "org-roam.db" emacs-state-home))
(customize-set-variable 'org-id-locations-file (expand-file-name ".org-id-locations" emacs-state-home))

(customize-set-variable 'tramp-persistency-file-name (expand-file-name "tramp" emacs-state-home))

(customize-set-variable 'transient-history-file (expand-file-name "transient/history.el" emacs-state-home))

(customize-set-variable 'auto-save-list-file-prefix (expand-file-name "auto-save-list/.saves-" emacs-state-home))

(customize-set-variable 'bookmark-default-file (expand-file-name "bookmarks" emacs-state-home))

(customize-set-variable 'save-place-file (expand-file-name "emacs-places" emacs-state-home))
(save-place-mode +1)

(customize-set-variable 'savehist-file (expand-file-name "emacs-history" emacs-state-home))
(customize-set-variable 'history-delete-duplicates t)
(savehist-mode +1)

(add-hook 'after-init-hook #'recentf-mode)
(customize-set-variable 'recentf-save-file (expand-file-name "recentf" emacs-state-home))

(customize-set-variable 'mc/list-file (expand-file-name ".mc-lists.el" emacs-state-home))

(setq persist--directory-location (expand-file-name "persist" emacs-state-home))
(customize-set-variable 'mastodon-client--token-file (expand-file-name "mastodon.plstore" emacs-state-home))

(provide 'kixi-locations)

;;; kixi-locations.el ends here
