(require 'powerline)

(defun my-theme ()
  (if (string= frame-background-mode 'light)
      (load-theme 'leuven)
    (load-theme 'monokai))
  (powerline-reset))

(defun my-theme-toggle ()
  (interactive)
  (evil-god-state-bail)
  (if (string= frame-background-mode 'light)
      (progn (setq frame-background-mode 'dark) (disable-theme 'leuven))
    (progn (setq frame-background-mode 'light) (disable-theme 'monokai)))
  (frame-set-background-mode (selected-frame))
  (set-terminal-parameter nil 'background-mode frame-background-mode)
  (my-theme))

(my-theme)
