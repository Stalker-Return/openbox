(DEFINE-CONFIGURATION (BUFFER WEB-BUFFER)
  ((DEFAULT-MODES %SLOT-DEFAULT%)))
(DEFINE-CONFIGURATION BUFFER
  ((CURRENT-ZOOM-RATIO 90)))
(DEFINE-CONFIGURATION BUFFER
  ((CURRENT-ZOOM-RATIO 80)))
(DEFINE-CONFIGURATION BUFFER
  ((DEFAULT-MODES %SLOT-DEFAULT%)))
(SETF (UIOP/OS:GETENV "WEBKIT_DISABLE_COMPOSITING_MODE") "1")
(SETF (UIOP/OS:GETENV "WEBKIT_DISABLE_COMPOSITING_MODE") "1")
