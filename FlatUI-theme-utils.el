(defvar fui-theme-current-style nil)

;;;###autoload
(defun fui-theme-load-style (style)
  "Load FlatUI theme style `style'. Argument `style' can be
either 'light or 'dark."
  (interactive)
  (cond ((equal style 'light)
         (load-theme 'FlatUI t))
        ((equal style 'dark)
         (load-theme 'FlatUI-Dark t))

        (t (error (concat "Unknown FlatUI theme style: " (format "%S" style))))))

;;;###autoload
(defun fui-theme-switch-style ()
  "Toggle between the light and dark style of FlatUI theme."
  (interactive)
  (cond ((or (null fui-theme-current-style)
             (equal fui-theme-current-style 'dark))
         (fui-theme-load-style 'light)
         (setq fui-theme-current-style 'light))
        ((equal fui-theme-current-style 'light)
         (fui-theme-load-style 'dark)
         (setq fui-theme-current-style 'dark))
        (t (error (concat "Invalid FlatUI current style: "
                          (format "%S" fui-theme-current-style))))))

(provide 'FlatUI-theme-utils)
