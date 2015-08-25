(defvar my-packages
  '(
    color-theme-solarized
    company
    cygwin-mount
    diminish
    evil
    evil-easymotion
    evil-escape
    evil-god-state
    evil-iedit-state
    evil-jumper
    evil-leader
    evil-lisp-state
    evil-matchit
    evil-nerd-commenter
    evil-org
    evil-surround
    evil-terminal-cursor-changer
    flycheck
    git-gutter
    god-mode
    helm
    js2-mode
    linum-relative
    magit
    monokai-theme
    powerline-evil
    powershell
    projectile
    seethru
    session
    skewer-mode
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

(require 'cygwin-mount)
  (cygwin-mount-activate)

(require 'evil)
  ;;; esc quits
  ;(define-key evil-normal-state-map [escape] 'keyboard-quit)
  ;(define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  ;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  ;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  ;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  ;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

(require 'evil-easymotion)
  (evilem-default-keybindings "SPC")
	 
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))
    (setq evil-emacs-state-cursor "violet")
    (setq evil-insert-state-cursor '("blue" (bar . 2)))
    (setq evil-motion-state-cursor "magenta")
    (setq evil-normal-state-cursor "green")
    (setq evil-operator-state-cursor '("cyan" evil-half-cursor))
    (setq evil-replace-state-cursor '("red" hbar))
    (setq evil-visual-state-cursor "orange")

(require 'seethru)
  (seethru 100)

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

(vc-mode vc-mode)

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

(require 'linum-relative)

(require 'git-gutter)
  (git-gutter:linum-setup)

(require 'magit)
  (global-set-key (kbd "C-x g") 'magit-status)

(load "~/.emacs.d/custom.el")

(require 'diminish)
  (defmacro my-diminish (package mode unicode ascii)
  (let ((dim (concat " " (if (display-graphic-p)
                 unicode
               (if ascii ascii unicode)))))
    `(eval-after-load ,package '(diminish ',mode ,dim))))
  (my-diminish "company"     company-mode     "ⓒ" "ς")
  (my-diminish "evil-escape" evil-escape-mode "ⓔ" "ε")
  (my-diminish "git-gutter"  git-gutter-mode  "ⓖ" "γ")
  (my-diminish "helm"        helm-mode        "ⓗ" "η")
  (my-diminish "isearch"     isearch-mode     "ⓢ" "σ")
  (my-diminish "undo-tree"   undo-tree-mode   "ⓤ" "θ")
  (my-diminish "yasnippet"   yas-minor-mode   "ⓨ" "υ")

; solarized
(set-terminal-parameter nil 'background-mode frame-background-mode)
(enable-theme 'monokai)

(require 'powerline-evil-themes)
  (powerline-evil-center-color-theme)

(require 'session)
  (add-hook 'after-init-hook 'session-initialize)
