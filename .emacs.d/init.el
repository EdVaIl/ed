(defvar my-packages
  '(
    auto-complete
    color-theme-solarized
    company
    cygwin-mount
    diminish
    evil
    evil-easymotion
    evil-escape
    evil-god-state
    evil-leader
    evil-matchit
    evil-nerd-commenter
    evil-org
    evil-surround
    evil-terminal-cursor-changer
    flycheck
    git-gutter
    god-mode
    helm
    key-chord
    magit
    powerline-evil
    powershell
    projectile
    seethru
    session
    ssh-agency
    sublimity
    tabbar
    twittering-mode
    web-beautify
    web-mode
    windmove
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
  (seethru 100)

(require 'powerline-evil-themes)
  (powerline-evil-center-color-theme)

(require 'god-mode)
  (global-set-key (kbd ",") 'god-local-mode)
  (global-set-key (kbd "C-,") 'god-local-mode)
  (global-set-key (kbd "C-x C-1") 'delete-other-windows)
  (global-set-key (kbd "C-x C-2") 'split-window-below)
  (global-set-key (kbd "C-x C-3") 'split-window-right)
  (global-set-key (kbd "C-x C-0") 'delete-window)

  (defun my-update-cursor ()
    (setq cursor-type (if (or god-local-mode buffer-read-only)
      'box
      'bar)))
  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
  (add-hook 'god-mode-disabled-hook 'my-update-cursor)

  (defun c/god-mode-update-cursor ()
    (let ((limited-colors-p (> 257 (length (defined-colors)))))
      (cond (god-local-mode (progn
        (set-face-background 'mode-line (if limited-colors-p "white" "#e9e2cb"))
        (set-face-background 'mode-line-inactive (if limited-colors-p "white" "#e9e2cb"))))
        (t (progn
          (set-face-background 'mode-line (if limited-colors-p "black" "#0a2832"))
          (set-face-background 'mode-line-inactive (if limited-colors-p "black" "#0a2832")))))))
  (add-hook 'god-mode-enabled-hook 'c/god-mode-update-cursor)
  (add-hook 'god-mode-disabled-hook 'c/god-mode-update-cursor)

(require 'evil)
  ;;; esc quits
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  (unless (display-graphic-p)
    (require 'evil-terminal-cursor-changer))
      (setq evil-emacs-state-cursor "violet")
      (setq evil-insert-state-cursor '("blue" (bar . 2)))
      (setq evil-motion-state-cursor "magenta")
      (setq evil-normal-state-cursor "green")
      (setq evil-operator-state-cursor '("cyan" evil-half-cursor))
      (setq evil-replace-state-cursor '("red" hbar))
      (setq evil-visual-state-cursor "orange")

(require 'evil-easymotion)
  ;(evilem-default-keybindings "SPC")
	 
(require 'key-chord)
  (key-chord-mode t)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(require 'evil-god-state)
  (evil-define-key 'normal global-map "," 'evil-execute-in-god-state)
  (add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
  (add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail)

(require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'evil-leader)
  (global-evil-leader-mode)

(require 'evil-matchit)

(require 'evil-org)

(require 'cygwin-mount)
  (cygwin-mount-activate)

(require 'git-gutter)
  (git-gutter:linum-setup)

(require 'magit)
  (global-set-key (kbd "C-x g") 'magit-status)

(load "~/.emacs.d/custom.el")

(set-terminal-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)
(require 'session)
  (add-hook 'after-init-hook 'session-initialize)
