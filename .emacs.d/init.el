(defvar my-packages
  '(
    auto-complete
    company
    evil-easymotion
    evil-leader
    evil-org
    evil-surround
    evil-terminal-cursor-changer
    ido-hacks
    magit
    powerline-evil
    projectile
    seethru
    web-mode
    yasnippet
  )
  "A list of packages to ensure are installed at launch.")
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(require 'cl)
; method to check if all packages are installed
(defun my-packages-installed-p ()
  (loop for p in my-packages
	when (not (package-installed-p p)) do (return nil)
	finally (return t)))
(package-initialize)
; if not all packages are installed, check one by one and install the missing ones.
(unless (my-packages-installed-p)
; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))
(require 'seethru)
  (seethru 80)
(powerline-evil-center-color-theme)
(require 'evil-terminal-cursor-changer)
  (setq evil-visual-state-cursor 'box) ; █
  (setq evil-insert-state-cursor 'bar) ; ⎸
  (setq evil-emacs-state-cursor 'hbar) ; _
(require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(require 'ido-hacks)
(require 'evil-leader)
(global-evil-leader-mode)
(require 'evil-org)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("a444b2e10bedc64e4c7f312a737271f9a2f2542c67caa13b04d525196562bf38" default)))
 '(evil-mode t)
 '(fci-rule-color "#383838")
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
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
 '(scroll-bar-mode nil)
 '(server-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visible-bell t)
 '(xterm-mouse-mode t)
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 143)))))
