;;; init.el --- main emacs startup script
;;;
;;; Commentary:
;;;
;;; Code:

(require 'early-init)

(setq guix-p (stringp (getenv "GUIX_PROFILE")))

;; Package setup
;; (eval-when-compile
;;   (package-initialize)
;;   (unless (package-installed-p 'use-package)
;;     (package-refresh-contents)
;;     (package-install 'use-package))
;;   (require 'use-package)
;;   (setq use-package-always-defer t
;;         use-package-verbose t))

(defun safe-getenv (env)
  "Provides a safe way to retrieve environment variables from ENV.

Examples TODO."
  (if (bound-and-true-p exec-path-from-shell-getenv)
      (exec-path-from-shell-getenv env)
    (getenv env)))

(defconst emacs-config-home user-emacs-directory)
(defconst emacs-cache-home (expand-file-name "emacs/" (or (safe-getenv "XDG_CACHE_HOME") "~/.cache")))
(defconst emacs-data-home (expand-file-name "emacs/" (or (safe-getenv "XDG_DATA_HOME") "~/.local/share")))
(defconst emacs-state-home (expand-file-name "emacs/" (or (safe-getenv "XDG_STATE_HOME") "~/.local/state")))

;; Customize this variable if you are not a new user.
(defcustom new-emacs-user t
  "For new Emacs users pop up a persistent cheatsheet buffer for you."
  :type 'boolean :group 'Help)

(add-hook 'after-init-hook
          (lambda () 
            (if
                (and (version< "29.0" emacs-version) new-emacs-user) (help-quick-toggle))))

;;; Shared emacs config packages
(require 'kixi-locations)
(require 'kixi-basics)
(require 'kixi-theme)
(require 'kixi-completion)
(require 'kixi-meow)
(require 'kixi-keys)
(require 'kixi-git)
(require 'kixi-magit-repolist)
(require 'kixi-org)
(require 'kixi-window)
(require 'kixi-programming)
(require 'kixi-clojure)
(require 'kixi-r)

;;; Personal Emacs config
(when (file-exists-p (expand-file-name "personal-init.el" (concat user-emacs-directory "personal-lisp/")))
  (message "Loading personal-init.el")
  (load-file (expand-file-name "personal-init.el" (concat user-emacs-directory "personal-lisp/"))))

(require 'server)
(if (not (server-running-p))
    (server-start)
  (message "Server already running. Not starting a new one"))

(message "Emacs init loaded.")

(provide 'init)
;;; init.el ends here
