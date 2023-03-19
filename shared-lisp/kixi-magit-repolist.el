;;; kixi-magit-repolist --- keep project and repolist in sync
;;
;;; Commentary:
;;
;;
;;; Code:
(require 'magit)
(require 'project)

(defun projects->magit-repos (project-list)
  "Convert PROJECT-LIST to magit repo list."
  (mapcar
   (lambda (p)
     (cons (car p) 1))
   project-list))

(setq magit-repository-directories
      (if (listp project--list)
          (projects->magit-repos project--list)
        (progn
          ;; Need to bootstrap the project list.
          (project--read-project-list)
          (projects->magit-repos project--list))))

(add-variable-watcher
 'project--list
 (lambda (symbol newval op where)
   (message (format "symbol: %s newval: %s op: %s where: %s project--list: %s"
                    symbol newval op where project--list))
   (setq magit-repository-directories
         (projects->magit-repos newval))))

(provide 'kixi-magit-repolist)

;;; kixi-magit-repolist.el ends here
