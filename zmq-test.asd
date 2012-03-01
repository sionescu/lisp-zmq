
(defsystem zmq-test
  :name "zmq-test"
  :author "Nicolas Martyanoff"
  :license "BSD"
  :description "Tests for the zmq binding."
  :depends-on (:zmq :fiveam :bordeaux-threads)
  :components ((:module "test"
                        :components ((:file "packages")
                                     (:file "suites"
                                            :depends-on ("packages"))
                                     (:file "main"
                                            :depends-on ("suites"))
                                     (:file "multithreading"
                                            :depends-on ("suites"))))))
