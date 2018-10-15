;;; flucui-themes.el --- Custom theme inspired by the Flat UI palette
;;
;; Copyright (C) 2018 MetroWind.
;;
;; This program is free software. It comes without any warranty, to
;; the extent permitted by applicable law. You can redistribute it
;; and/or modify it under the terms of the Do What the Fuck You Want
;; to Public License, Version 2, as published by Sam Hocevar. See
;; http://www.wtfpl.net/ for more details.

;; Author: MetroWind <chris.corsair@gmail.com>
;; URL: https://github.com/MetroWind/flucui-theme
;; Keywords: lisp
;; Version: 1.0
;; Package-Requires: ((emacs "24"))

;;; Commentary:
;;
;; Fluc UI theme is a custom theme for Emacs, inspired by
;; http://flatuicolors.com. It Has both light and dark variants. This
;; file provides some utilities to load and switch themes.

;;; Code:
(defvar flucui-themes-current-style nil)

;;;###autoload
(add-to-list 'custom-theme-load-path
             (file-name-directory load-file-name))

;;;###autoload
(defun flucui-themes-load-style (style)
  "Load FlucUI theme variant STYLE.

Argument STYLE can be either 'light or 'dark."

  (interactive)
  (cond ((equal style 'light)
         (load-theme 'flucui-light t))
        ((equal style 'dark)
         (load-theme 'flucui-dark t))

        (t (error (format "Unknown FlucUI theme style: %S" style)))))

;;;###autoload
(defun flucui-themes-switch-style ()
  "Toggle between the light and dark style of FlucUI theme."
  (interactive)
  (cond ((or (null flucui-themes-current-style)
             (equal flucui-themes-current-style 'dark))
         (flucui-themes-load-style 'light)
         (setq flucui-themes-current-style 'light))
        ((equal flucui-themes-current-style 'light)
         (flucui-themes-load-style 'dark)
         (setq flucui-themes-current-style 'dark))
        (t (error (format "Invalid FlucUI current style: %S"
                          flucui-themes-current-style)))))

(provide 'flucui-themes)

;;; FlatUI-theme-utils.el ends here
