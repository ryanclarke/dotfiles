(server-start)
(setq frame-title-format
  '("_vim: "(:eval (if (buffer-file-name)
    (abbreviate-file-name (buffer-file-name)) "%B"))))
(if (display-graphic-p)
  (set-frame-size (selected-frame) 120 36))
(global-linum-mode)