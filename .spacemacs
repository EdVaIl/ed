;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     colors
     dash
     emacs-lisp
     git
     github
     gnus
     haskell
     html
     javascript
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     shell-scripts
     ;; spell-checking
     syntax-checking
     version-control
     windows-scripts
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(bbdb)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(bookmarks recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 19
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols (display-graphic-p)
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (fancy-battery-mode)
  (eval-after-load 'quail
    '(progn
       (add-to-list 'quail-keyboard-layout-alist
                    '("dvp" . "\
                              \
  %&7[5{3}1(9=0*2)4+6]8!`#    \
  ;:,<.>pPyYfFgGcCrRlL/?@^    \
  aAoOeEuUiIdDhHtTnNsS-_\\|    \
  '\"qQjJkKxXbBmMwWvVzZ        \
                              "))
       (add-to-list 'quail-keyboard-layout-alist
                    '("dvorak" . "\
                              \
  1!2@3#4$5%6^7&8*9(0)[{]}`~  \
  '\",<.>pPyYfFgGcCrRlL/?=+    \
  aAoOeEuUiIdDhHtTnNsS-_\\|    \
  ;:qQjJkKxXbBmMwWvVzZ         \
                             "))
       (quail-set-keyboard-layout "dvorak")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(bbdb-file "~/Dropbox/.emacs.d/bbdb")
 '(blink-cursor-mode nil)
 '(cal-tex-24 t)
 '(calendar-latitude 56.959454801)
 '(calendar-longitude 24.237804606)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(default-input-method "russian-computer")
 '(display-time-24hr-format t)
 '(display-time-default-load-average nil)
 '(display-time-mode t)
 '(evil-escape-key-sequence "hc")
 '(evil-escape-unordered-key-sequence t)
 '(fancy-battery-show-percentage t)
 '(global-auto-revert-mode t)
 '(highlight-changes-colors ("#FD5FF0" "#AE81FF"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(indent-tabs-mode nil)
 '(js2-basic-offset 2)
 '(json-reformat:indent-width 2)
 '(magit-commit-arguments (quote ("--all")))
 '(magit-diff-use-overlays nil)
 '(magit-log-arguments (quote ("--graph" "--color" "--decorate" "-n256")))
 '(magit-tag-arguments (quote ("--annotate")))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-custom-commands
   (quote
    (("d" . "Today")
     ("dd" "Today everywhere"
      ((tags "CATEGORY=\"Tickler\""
             ((org-agenda-overriding-header "Tickler")
              (org-agenda-files
               (quote
                ("~/Dropbox/.emacs.d/org/tickler.org")))
              (org-agenda-max-entries 1)))
       (agenda ""
               ((org-agenda-span
                 (quote day))))
       (tags-todo "-BLOCKED=\"t\"-MAYBE-SOMEDAY/PROJECT"
                  ((org-agenda-overriding-header "Determinare i prossimi passi:")))
       (tags "LEVEL=1"
             ((org-agenda-overriding-header "Arrivo (controllato documenti cartacei, registratore, le immagini, OneNote ed e-mail):")
              (org-agenda-files
               (quote
                ("~/Dropbox/.emacs.d/org/inbox.org")))
              (org-agenda-max-entries 1)))
       (tags-todo "@home-BLOCKED=\"t\"/-PROJECT"
                  ((org-agenda-overriding-header "Next actions at home:")))
       (tags-todo "@affari-BLOCKED=\"t\""
                  ((org-agenda-overriding-header "Le seguenti misure pratiche:")))
       (tags-todo "@also-BLOCKED=\"t\"|@lunch-BLOCKED=\"t\""
                  ((org-agenda-overriding-header "Next actions at ALSO Cloud:")))
       (tags-todo "@negozio/-PROJECT"
                  ((org-agenda-overriding-header "Cose da comprare:")))
       (tags-todo "@activelife-BLOCKED=\"t\"|@piscina-BLOCKED=\"t\"|@atm|@car-BLOCKED=\"t\""
                  ((org-agenda-overriding-header "Other context-dependent next actions:")))
       (tags-todo "-MAYBE-SOMEDAY-@home-@affari-@activelife-@piscina-@atm-@negozio-@car-BLOCKED=\"t\"/-PROJECT"
                  ((org-agenda-overriding-header "Next actions anywhere:")))
       (agenda ""
               ((org-agenda-start-day "+1")
                (org-agenda-span
                 (quote day)))))
      nil nil)
     ("da" "Today at ALSO Cloud"
      ((stuck "" nil)
       (tags-todo "-BLOCKED=\"t\"-MAYBE-SOMEDAY/PROJECT"
                  ((org-agenda-overriding-header "Determinare i prossimi passi:")))
       (agenda ""
               ((org-agenda-span
                 (quote day))))
       (tags-todo "-BLOCKED=\"t\""
                  ((org-agenda-overriding-header "Next actions at ALSO Cloud:")))
       (agenda ""
               ((org-agenda-start-day "+1")
                (org-agenda-span
                 (quote day)))))
      ((org-agenda-files
        (quote
         ("~/Dropbox/.emacs.d/org/also.org"))))
      nil)
     ("w" "Week everywhere"
      ((agenda ""
               ((org-agenda-start-day "-7")
                (org-agenda-span 15)
                (org-agenda-skip-function
                 (quote
                  (org-agenda-skip-entry-if
                   (quote todo)
                   (quote
                    ("DONE" "CANCELED")))))))
       (stuck "" nil)
       (tags "LEVEL=1"
             ((org-agenda-overriding-header "Inbox (check also OneNote and mail):")
              (org-agenda-files
               (quote
                ("~/Dropbox/.emacs.d/org/inbox.org")))))
       (tags-todo "BLOCKED=\"t\"/WAITING"
                  ((org-agenda-overriding-header "Force:")))
       (tags-todo "SOMEDAY" nil)
       (tags-todo "MAYBE" nil))
      nil nil))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/.emacs.d/org/grei.org" "~/Dropbox/.emacs.d/org/famiglia.org" "~/Dropbox/.emacs.d/org/io.org" "~/Dropbox/.emacs.d/org/inbox.org" "~/Dropbox/.emacs.d/org/tickler.org" "~/Dropbox/.emacs.d/org/todo.org" "~/Dropbox/.emacs.d/org/also.org" "~/Dropbox/.emacs.d/org/reference.org")))
 '(org-agenda-start-with-log-mode t)
 '(org-agenda-tags-todo-honor-ignore-options t)
 '(org-agenda-todo-ignore-deadlines (quote far))
 '(org-agenda-todo-ignore-scheduled (quote future))
 '(org-agenda-todo-ignore-timestamp (quote future))
 '(org-bullets-bullet-list (quote ("◉" "●" "○" "✿" "❀")))
 '(org-default-priority 68)
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-hierarchical-todo-statistics nil)
 '(org-log-done (quote time) t)
 '(org-lowest-priority 68)
 '(org-mobile-directory "~/Dropbox/Apps/MobileOrg")
 '(org-priority-start-cycle-with-default nil)
 '(org-startup-with-inline-images t t)
 '(org-stuck-projects
   (quote
    ("-MAYBE-SOMEDAY/PROJECT"
     ("TODO" "STARTED")
     nil "")))
 '(org-todo-keyword-faces
   (quote
    (("PROJECT" . "yellow4")
     ("WAITING" . "grey")
     ("STARTED" . "yellow")
     ("CANCELED" . "dim gray"))))
 '(org-todo-keywords
   (quote
    ((sequence "PROJECT(p)" "FINISHED(f)")
     (sequence "TODO(t)" "STARTED(s!)" "DONE(d)")
     (type "WAITING(w!)" "CANCELED(c)"))))
 '(package-selected-packages
   (quote
    (git-gutter-fringe+ git-gutter-fringe git-gutter+ git-gutter diff-hl ghc smartparens haskell-mode helm helm-core magit package-build bind-key evil bind-map mmm-mode markdown-toc markdown-mode gh-md zeal-at-point web-mode web-beautify toc-org tagedit smeargle slim-mode shm scss-mode sass-mode rainbow-mode rainbow-identifiers powershell orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets magit-gitflow magit-gh-pulls less-css-mode json-mode js2-refactor js2-mode js-doc jade-mode htmlize hindent helm-gitignore helm-flyspell helm-dash helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode gnuplot gitignore-mode github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gist flycheck-pos-tip flycheck-haskell flycheck evil-magit emmet-mode company-web company-tern company-statistics company-quickhelp company-ghc company-cabal company coffee-mode cmm-mode bbdb auto-yasnippet auto-dictionary ac-ispell zenburn-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package spacemacs-theme spaceline smooth-scrolling restart-emacs rainbow-delimiters quelpa popwin popup persp-mode pcre2el paradox page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-jumper evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu elisp-slime-nav define-word clean-aindent-mode buffer-move auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values (quote ((mode@ . org))))
 '(shell-file-name "bash")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(standard-indent 2)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
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
 '(web-mode-attr-indent-offset 2)
 '(web-mode-auto-close-style 2)
 '(web-mode-enable-auto-closing t)
 '(web-mode-enable-auto-expanding t)
 '(web-mode-enable-auto-indentation t)
 '(web-mode-enable-auto-opening t)
 '(web-mode-enable-auto-pairing t)
 '(web-mode-enable-auto-quoting t)
 '(web-mode-enable-block-face t)
 '(web-mode-enable-comment-interpolation t)
 '(web-mode-enable-css-colorization t)
 '(web-mode-enable-current-column-highlight t)
 '(web-mode-enable-current-element-highlight t)
 '(web-mode-enable-element-content-fontification t)
 '(web-mode-enable-element-tag-fontification t)
 '(web-mode-enable-engine-detection t)
 '(web-mode-enable-html-entities-fontification t)
 '(web-mode-enable-inlays t)
 '(web-mode-enable-sql-detection t)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-script-padding 2)
 '(web-mode-sql-indent-offset 2)
 '(web-mode-style-padding 2)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "#DCDCCC" :background "#3F3F3F" :family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 151 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
