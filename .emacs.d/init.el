(defvar my-packages
  '(
    auto-complete
    company
    cygwin-mount
    evil-easymotion
    evil-god-state
    evil-leader
    evil-org
    evil-surround
    evil-terminal-cursor-changer
    git-gutter
    ido-hacks
    magit
    powerline-evil
    powershell
    projectile
    seethru
    web-mode
    yasnippet
    diminish
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
  (seethru 90)
(powerline-evil-center-color-theme)
(require 'evil-god-state)
  (global-set-key (kbd "<escape>") 'god-local-mode)
  (evil-define-key 'normal global-map "," 'evil-execute-in-god-state)
  (add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
  (add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail)
  (god-mode)
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))
    (setq evil-emacs-state-cursor "violet")
    (setq evil-insert-state-cursor '("blue" (bar . 2)))
    (setq evil-motion-state-cursor "magenta")
    (setq evil-normal-state-cursor "green")
    (setq evil-operator-state-cursor '("cyan" evil-half-cursor))
    (setq evil-replace-state-cursor '("red" hbar))
    (setq evil-visual-state-cursor "orange")
(require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(require 'ido-hacks)
(require 'evil-leader)
  (global-evil-leader-mode)
(require 'evil-org)
(require 'cygwin-mount)
  (cygwin-mount-activate)
(git-gutter:linum-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(apropos-do-all t)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wombat)))
 '(cygwin-mount-build-mount-table-asynch t)
 '(cygwin-mount-cygwin-bin-directory "C:\\cygwin64\\bin")
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(evil-mode t)
 '(global-auto-complete-mode t)
 '(global-auto-revert-mode t)
 '(global-evil-surround-mode t)
 '(global-git-gutter-mode t)
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
 '(org-startup-folded (quote content))
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(server-mode t)
 '(show-paren-mode t)
 '(show-paren-style (quote expression))
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(visible-bell t)
 '(xterm-mouse-mode t)
 '(yas-global-mode t nil (yasnippet)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
