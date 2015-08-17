(package-initialize)
(require 'ido-hacks)
<<<<<<< HEAD
;(require 'web-mode)
;(require 'seethru)
=======
(require 'web-mode)
;(require 'seethru)
(require 'evil-terminal-cursor-changer)
     (setq evil-visual-state-cursor 'box) ; █
     (setq evil-insert-state-cursor 'bar) ; ⎸
     (setq evil-emacs-state-cursor 'hbar) ; _
>>>>>>> refs/remotes/origin/master
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;(powerline-evil-center-color-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (base16-default-dark)))
 '(custom-safe-themes
   (quote
    ("9f3a4edb56d094366afed2a9ba3311bbced0f32ca44a47a765d8ef4ce5b8e4ea" default)))
 '(evil-mode t)
 '(global-auto-complete-mode t)
 '(global-evil-surround-mode t)
 '(global-linum-mode t)
 '(ido-enable-flex-matching t)
 '(ido-hacks-mode t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-scratch-message nil)
 '(linum-delay t)
 '(menu-bar-mode nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 5) ((control)))))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(server-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(xterm-mouse-mode t)
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 139 :family "DejaVu Sans Mono for Powerline")))))
