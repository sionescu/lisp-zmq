
(in-package :zmq)

(define-foreign-library libzmq
  (t (:default "libzmq")))

(use-foreign-library libzmq)

(defcfun (%memcpy "memcpy") :pointer
  (dst  :pointer)
  (src  :pointer)
  (len  :long))

(defctype socket :pointer)
(defctype context :pointer)
(defctype msg :pointer)

(defcstruct pollitem
  (socket socket)
  (fd #+win32 win32-socket
      #-win32 :int)
  (events :short)
  (revents :short))

(defcstruct msg
  (content :pointer)
  (flags :uchar)
  (vsm-size :uchar)
  (vsm-data :uchar :count #.max-vsm-size))

(defcfun (%bind "zmq_bind") :int
  (socket socket)
  (endpoint :string))

(defcfun (%close "zmq_close") :int
  (socket socket))

(defcfun (%connect "zmq_connect") :int
  (socket socket)
  (endpoint :string))

(defcfun (%errno "zmq_errno") :int)

(defcfun (%getsockopt "zmq_getsockopt") :int
  (socket socket)
  (option-name socket-option)
  (option-value :pointer)
  (option-len (:pointer size-t)))

(defcfun (%init "zmq_init") context
  (io-threads :int))

(defcfun (%msg-close "zmq_msg_close") :int
  (msg (:pointer (:struct msg))))

(defcfun (%msg-copy "zmq_msg_copy") :int
  (dest (:pointer (:struct msg)))
  (src (:pointer (:struct msg))))

(defcfun (%msg-data "zmq_msg_data") :pointer
  (msg (:pointer (:struct msg))))

(defcfun (%msg-init-data "zmq_msg_init_data") :int
  (msg (:pointer (:struct msg)))
  (data :pointer)
  (size size-t)
  (ffn :pointer)
  (hint :pointer))

(defcfun (%msg-init-size "zmq_msg_init_size") :int
  (msg (:pointer (:struct msg)))
  (size size-t))

(defcfun (%msg-init "zmq_msg_init") :int
  (msg (:pointer (:struct msg))))

(defcfun (%msg-move "zmq_msg_move") :int
  (dest (:pointer (:struct msg)))
  (src (:pointer (:struct msg))))

(defcfun (%msg-size "zmq_msg_size") size-t
  (msg (:pointer (:struct msg))))

;; (defcfun (%poll "zmq_poll") :int
;;   (items (:pointer (:struct pollitem)))
;;   (nitems :int)
;;   (timeout :long))

(defcfun (%poll "zmq_poll") :int
  (items   :pointer)
  (nitems  :int)
  (timeout :long))

;; (defcfun (%recv "zmq_recv") :int
;;   (socket socket)
;;   (msg    (:pointer (:struct msg)))
;;   (flags  recv-options))

(defcfun (%recv "zmq_recv") :int
  (socket :pointer)
  (msg    :pointer)
  (flags  :unsigned-int))

(defcfun (%send "zmq_send") :int
  (socket socket)
  (msg (:pointer (:struct msg)))
  (flags send-options))

(defcfun (%setsockopt "zmq_setsockopt") :int
  (socket socket)
  (option-name socket-option)
  (option-value :pointer)
  (option-len size-t))

(defcfun (%socket "zmq_socket") socket
  (context context)
  (type socket-type))

(defcfun (%strerror "zmq_strerror") :string
  (errnum :int))

(defcfun (%term "zmq_term") :int
  (context context))

(defcfun (%version "zmq_version") :void
  (major (:pointer :int))
  (minor (:pointer :int))
  (patch (:pointer :int)))

(defcfun (%device "zmq_device") :int
  (device device-type)
  (frontend socket)
  (backend socket))

(defcfun (%stopwatch-start "zmq_stopwatch_start") :pointer)

(defcfun (%stopwatch-stop "zmq_stopwatch_stop") :ulong
  (watch :pointer))

(defcfun (%sleep "zmq_sleep") :void
  (seconds :int))
