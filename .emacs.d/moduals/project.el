;; You can make `project.el` recognize any directory as a project by adding an empty `.project` file inside it.
;; This works by defining a custom method that tells Emacs to treat such directories as valid projects. Now, you
;; can quickly switch to these projects using `C-x p p` just like Git-backed ones.
;; https://christiantietze.de/posts/2022/03/mark-local-project.el-directories/

(defgroup project-local nil
  "Local, non-VC-backed project.el root directories."
  :group 'project)

(defcustom project-local-identifier ".project"
  "Filename that identifies a directory as a project.
You can specify a single filename or a list of names."
  :type '(choice (string :tag "Single file")
                 (repeat (string :tag "Filename")))
  :group 'project-local)

(cl-defmethod project-root ((project (head local)))
  "Return root directory of current PROJECT."
  (cdr project))

(defun project-local-try-local (dir)
  "Determine if DIR is a non-VC project.
DIR must include a file with the name determined by the
variable `project-local-identifier' to be considered a project."
  (if-let ((root (if (listp project-local-identifier)
                     (seq-some (lambda (n)
                                 (locate-dominating-file dir n))
                               project-local-identifier)
                   (locate-dominating-file dir project-local-identifier))))
      (cons 'local root)))

(customize-set-variable 'project-find-functions
                        (list #'project-try-vc
                              #'project-local-try-local))
