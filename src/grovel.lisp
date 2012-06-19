
(include "zmq.h")
#+win32 (include "Winsock2.h")

(in-package :zmq)

(ctype size-t "size_t")
(ctype fd-t "int")

#+win32 (ctype win32-socket "SOCKET")

(constant (max-vsm-size "ZMQ_MAX_VSM_SIZE"))

(constantenum error-code
              ;; Stqndard error codes
              ((:einval "EINVAL"))
              ((:enodev "ENODEV"))
              ((:eintr "EINTR"))
              ((:efault "EFAULT"))
              ((:enomem "ENOMEM"))
              ((:eagain "EAGAIN"))
              ((:emfile "EMFILE"))
              ((:enotsup "ENOTSUP"))
              ((:eprotonosupport "EPROTONOSUPPORT"))
              ((:enobufs "ENOBUFS"))
              ((:enetdown "ENETDOWN"))
              ((:eaddrinuse "EADDRINUSE"))
              ((:eaddrnotavail "EADDRNOTAVAIL"))
              ((:econnrefused "ECONNREFUSED"))
              ((:einprogress "EINPROGRESS"))
              ((:enotsock "ENOTSOCK"))
              ;; ZMQ native error codes
              ((:efsm "EFSM"))
              ((:enocompatproto "ENOCOMPATPROTO"))
              ((:eterm "ETERM"))
              ((:emthread "EMTHREAD")))

(bitfield event-types
          ((:pollin "ZMQ_POLLIN"))
          ((:pollout "ZMQ_POLLOUT"))
          ((:pollerr "ZMQ_POLLERR")))

(bitfield recv-options
          ((:noblock "ZMQ_NOBLOCK")))

(bitfield send-options
          ((:noblock "ZMQ_NOBLOCK"))
          ((:sndmore "ZMQ_SNDMORE")))

(constantenum socket-type
              ((:pair "ZMQ_PAIR"))
              ((:pub "ZMQ_PUB"))
              ((:sub "ZMQ_SUB"))
              ((:req "ZMQ_REQ"))
              ((:rep "ZMQ_REP"))
              ((:dealer "ZMQ_DEALER"))
              ((:router "ZMQ_ROUTER"))
              ((:pull "ZMQ_PULL"))
              ((:push "ZMQ_PUSH"))
              ((:xpub "ZMQ_XPUB"))
              ((:xsub "ZMQ_XSUB"))
              ((:xreq "ZMQ_XREQ"))
              ((:xrep "ZMQ_XREP"))
              ((:upstream "ZMQ_UPSTREAM"))
              ((:downstream "ZMQ_DOWNSTREAM")))

(constantenum socket-option
              ((:hwm "ZMQ_HWM"))
              ((:swap "ZMQ_SWAP"))
              ((:affinity "ZMQ_AFFINITY"))
              ((:identity "ZMQ_IDENTITY"))
              ((:subscribe "ZMQ_SUBSCRIBE"))
              ((:unsubscribe "ZMQ_UNSUBSCRIBE"))
              ((:rate "ZMQ_RATE"))
              ((:recovery-ivl "ZMQ_RECOVERY_IVL"))
              ((:recovery-ivl-msec "ZMQ_RECOVERY_IVL_MSEC"))
              ((:mcast-loop "ZMQ_MCAST_LOOP"))
              ((:sndbuf "ZMQ_SNDBUF"))
              ((:rcvbuf "ZMQ_RCVBUF"))
              ((:rcvmore "ZMQ_RCVMORE"))
              ((:fd "ZMQ_FD"))
              ((:events "ZMQ_EVENTS"))
              ((:type "ZMQ_TYPE"))
              ((:linger "ZMQ_LINGER"))
              ((:reconnect-ivl "ZMQ_RECONNECT_IVL"))
              ((:backlog "ZMQ_BACKLOG"))
              ((:reconnect-ivl-max "ZMQ_RECONNECT_IVL_MAX")))

(constantenum device-type
              ((:queue "ZMQ_QUEUE"))
              ((:forwarder "ZMQ_FORWARDER"))
              ((:streamer "ZMQ_STREAMER")))
