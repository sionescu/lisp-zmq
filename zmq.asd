
(cl:eval-when (:load-toplevel :execute)
  (asdf:operate 'asdf:load-op 'cffi-grovel))

(defsystem zmq
  :name "zmq"
  :version "1.3.0"
  :author "Nicolas Martyanoff"
  :license "BSD"
  :description "A binding of the zmq transport layer."
  :depends-on (:cffi :bordeaux-threads)
  :in-order-to ((test-op (load-op zmq-test)))
  :components ((:module "src"
                :components ((:file "packages")
                             (cffi-grovel:grovel-file "grovel"
                                                      :depends-on ("packages"))
                             (:file "ffi" :depends-on ("grovel"))
                             (:file "zmq" :depends-on ("ffi"))))))

(defmethod perform ((o asdf:test-op) (c (eql (find-system :zmq))))
  (let ((suites '(main multithreading)))
    (dolist (suite suites)
      (funcall (intern "RUN!" :5am)
               (intern (symbol-name suite) :zmq-test)))))
