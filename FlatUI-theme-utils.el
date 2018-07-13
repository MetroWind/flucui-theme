;;; FlatUI-theme-utils.el --- Utils for the FlatUI theme.
;;
;; Copyright (C) 2018 MetroWind.
;;
;; This program is free software. It comes without any warranty, to
;; the extent permitted by applicable law. You can redistribute it
;; and/or modify it under the terms of the Do What the Fuck You Want
;; to Public License, Version 2, as published by Sam Hocevar. See
;; http://www.wtfpl.net/ for more details.

;;; Commentary:
;;
;; FlatUI theme is a custom theme for Emacs, inspired by
;; http://flatuicolors.com. It Has both light and dark variants. This
;; file provides some utilities to load and switch themes.

;;; Code:
(require 'flatui-theme-mw "flatui-theme-mw" t)

(defvar fui-theme-current-style nil)

;;;###autoload
(defun fui-theme-load-style (style)
  "Load FlatUI theme variant STYLE.

Argument STYLE can be either 'light or 'dark."

  (interactive)
  (cond ((equal style 'light)
         (load-theme 'FlatUI t))
        ((equal style 'dark)
         (load-theme 'FlatUI-Dark t))

        (t (error (format "Unknown FlatUI theme style: %S" style)))))

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
        (t (error (format "Invalid FlatUI current style: %S"
                          fui-theme-current-style)))))

(provide 'FlatUI-theme-utils)

;;; FlatUI-theme-utils.el ends here
