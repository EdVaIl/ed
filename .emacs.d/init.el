(defvar my-packages
  '(
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
    leuven-theme
    linum-relative
    magit
    monokai-theme
    powerline-evil
    powershell
    projectile
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

(require 'god-mode)
  (defun my-update-cursor ()
    (evil-set-cursor (if (or god-local-mode buffer-read-only)
      'box
      'bar)))
  (add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)

(require 'evil)

(require 'evil-easymotion)
	 
(unless (display-graphic-p)
  (require 'evil-terminal-cursor-changer))
    (setq evil-emacs-state-cursor "violet")
    (setq evil-insert-state-cursor '("blue" (bar . 2)))
    (setq evil-motion-state-cursor "magenta")
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-operator-state-cursor '("cyan" evil-half-cursor))
    (setq evil-replace-state-cursor '("red" hbar))
    (setq evil-visual-state-cursor "orange")

(require 'evil-god-state)
  (add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
  (add-hook 'evil-god-state-exit-hook
	    (lambda () (diminish-undo 'god-local-mode)))

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

(load "~/.emacs.d/custom.el")
(load "~/.emacs.d/theme.el")
(load "~/.emacs.d/keys.el")

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

(require 'powerline-evil-themes)
  (powerline-evil-center-color-theme)

(require 'session)
  (add-hook 'after-init-hook 'session-initialize)
