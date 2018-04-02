(in-package :cl-user)
(defpackage dr-mario-utils.macros
  (:use :cl)
  (:export :->
           :->>
           :as->
           :cond->
           :cond->>))
(in-package :dr-mario-utils.macros)

(defmacro -> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((form (car form-list))
             ;; e.g. (-> 1 1-)
             (form (if (listp form)
                       form
                       (list form)))
             (cdr-form-list (cdr form-list))
             (fname (car form))
             (fargs (cdr form))
             (new-expr `(,fname ,expr ,@fargs)))
        `(-> ,new-expr ,@cdr-form-list))))

(defmacro ->> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((form (car form-list))
             (form (if (listp form)
                       form
                       (list form)))
             (cdr-form-list (cdr form-list))
             (new-expr `(,@form ,expr)))
        `(->> ,new-expr ,@cdr-form-list))))

(defmacro as-> (expr name &rest form-list)
  `(let* ((,name ,expr)
          ,@(mapcar #'list
                    (loop repeat (1- (length form-list)) collect name)
                    form-list)
          )
     ,(if (null form-list)
          name
          (lastcar form-list))))

(defmacro some-> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((form (car form-list))
             ;; e.g. (-> 1 1-)
             (form (if (listp form)
                       form
                       (list form)))
             (cdr-form-list (cdr form-list))
             (fname (car form))
             (fargs (cdr form))
             (new-expr `(,fname ,expr ,@fargs)))
        `(if (null ,expr)
             nil
             (some-> ,new-expr ,@cdr-form-list)))))

(defmacro some->> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((carf (car form-list))
             (carf (if (listp carf)
                       carf
                       (list carf)))
             (cdrf (cdr form-list))
             (new-expr `(,@carf ,expr)))
        `(if (null ,expr)
             nil
             (some->> ,new-expr ,@cdrf)))))

;; todo
(defmacro cond-> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((form (car form-list))
             ;; e.g. (-> 1 1-)
             (form (if (listp form)
                       form
                       (list form)))
             (cdr-form-list (cdr form-list))
             (fname (car form))
             (fargs (cdr form))
             (new-expr `(,fname ,expr ,@fargs)))
        `(-> ,new-expr ,@cdr-form-list))))

;; todo
(defmacro ->> (expr &rest form-list)
  (if (null form-list)
      expr
      (let* ((form (car form-list))
             (form (if (listp form)
                       form
                       (list form)))
             (cdr-form-list (cdr form-list))
             (new-expr `(,@form ,expr)))
        `(->> ,new-expr ,@cdr-form-list))))
