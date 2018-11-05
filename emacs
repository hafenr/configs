;////////////////////////////////////////////////////////////////////////////////

;                ____   __  ___   ___   _____   ____        ___   _____
;              / __/  /  |/  /  / _ | / ___/  / __/       / _ \ / ___/
;            / _/   / /|_/ /  / __ |/ /__   _\ \        / , _// /__
;          /___/  /_/  /_/  /_/ |_|\___/  /___/       /_/|_| \___/

;////////////////////////////////////////////////////////////////////////////////


;================================================================================
; General
;================================================================================

; Disable icon bar
(tool-bar-mode -1)

; Change window size
; (setq initial-frame-alist '((top . 0) (left . 0) (width . 600) (height . 480)))

; Font size, height is /100
(set-face-attribute 'default nil :height 160)

; Many binaries are under /usr/local/bin under OSX (brew stuff)
(setq exec-path (append exec-path '("/usr/local/bin")))

; Default dir
(setq default-directory "~/")

; Auto-reload buffer
(global-auto-revert-mode t)

; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

; Change to other window when splitting
(global-set-key "\C-x2" (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key "\C-x3" (lambda () (interactive)(split-window-horizontally) (other-window 1)))

; Save session on exit
;; (desktop-save-mode 1)

; Close old buffers automatically
; (setq midnight-mode 't)

; Make buffer names unique even if the files have the same names
(setq uniquify-buffer-name-style 'forward)
; http://stackoverflow.com/questions/11403862/how-to-have-emacs-helm-list-offer-files-in-current-directory-as-options

;; Dired
; Pressing c in dired mode will copy the file name to the clipboard
(defun dired-copy-filename ()
  "push the path and filename of the file under the point to the kill ring"
  (interactive)
  (message "added %s to kill ring" (kill-new (dired-get-filename))))

; And this will bind it to 'c' on entering dired
(add-hook 'dired-mode-hook
  (lambda ()
    (define-key dired-mode-map "c" 'dired-copy-filename)))


;================================================================================
; Package management
;================================================================================
; Initialize ELPA
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("tromey" . "http://tromey.com/elpa/")))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

; All non-built-in packages
(defvar my-elpa-packages '(
                           ;; Sane defaults
                           starter-kit

                           auto-complete
                           dropdown-list

                           ;; Clojure/Lisp support
                           clojure-mode
                           clojure-test-mode
                           clojure-snippets
		           cider
                           paredit
                           paredit-menu
                           rainbow-delimiters

                           eimp
                           smartparens
                           yasnippet

                           undo-tree
                           window-numbering
                           linum-off
                           projectile
                           
                           auctex

                           ;; Fuzzy matching for nearly everything
                           helm
                           helm-flycheck
                           helm-emmet
                           helm-projectile

                           smex
                           flx-ido
                           ido-ubiquitous

                           expand-region

                           ;; Vim emulation
                           evil
                           surround
                           evil-matchit
                           evil-indent-textobject
                           evil-numbers
                           evil-nerd-commenter
                           evil-leader

                           ;; Themeing
                           org
                           org-ac
                           moe-theme
                           obsidian-theme
                           color-theme
                           color-theme-molokai
                           color-theme-solarized

                           ;; Git plugin
                           magit

                           ;; Syntax checking / Linting
                           flycheck

                           ac-nrepl
                           ace-jump-mode
                           markdown-mode
                           popwin))

;; Initialize package managers and load/install packages
(dolist (p my-elpa-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Initialize el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(setq my:el-get-packages
      '(
        ess ; ESS from elpa is outdated! => Install with el-get
        ))

(el-get 'sync my:el-get-packages)


;================================================================================
; Sections
;================================================================================

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; SLIME
;--------------------------------------------------------------------------------
; (add-to-list 'load-path "~/.emacsplugins/slime")
; (require 'slime)
; (eval-after-load 'slime '(setq slime-protocol-version 'ignore))
; (slime-setup '(slime-repl))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Auto Complete
;--------------------------------------------------------------------------------
(auto-complete-mode 1)
(require 'auto-complete-config)
(ac-config-default)

; Otherwise ac will not work with yasnippet someshow
(setq-default ac-sources '(
                           ac-source-yasnippet
                           ac-source-abbrev
                           ac-source-dictionary
                           ac-source-words-in-same-mode-buffers
                           ))

(setq
      ac-auto-show-menu 1
      ac-show-menu-immediately-on-auto-complete t
      ;; ac-candidate-limit nil
      ac-delay 0.1
      ;; ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face))
      ;; ac-ignore-case 'smart
      ;; ac-menu-height 10
      ac-quick-help-delay 0.5
      ;; ac-quick-help-prefer-pos-tip t
      ac-auto-start 1
      ac-delay 0.0
      ac-trigger-key "TAB"
      ac-use-menu-map t
      ac-use-quick-help t)

; Navigate in auto-complete list
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
; Disable ENTER
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Yasnippet
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Expand with TAB and Navigate with TAB and S-TAB
; (yas-minor-mode 1)
(eval-after-load "auto-complete"
  '(progn
     (yas-global-mode 1)
     (setq yas-prompt-functions '(yas-dropdown-prompt
                                  yas-ido-prompt
                                  yas-completing-prompt))))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Clojure, Elisp, etc.
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Clojure mode
(add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))

; Cider
; Put this into yout leiningen project.clj:
; plugins [[cider/cider-nrepl "0.6.0"]]
;
; or add it globally to ~/.lein/profiles.clj
; Something like this:
; {:user {:plugins [[lein-exec "0.3.3"] [cider/cider-nrepl "0.6.0"]]}}

; When using switch-to-buffer, pressing SPC after the command will
; make the hidden buffers visible.
; They'll always be visible in list-buffers (C-x C-b).
(setq nrepl-hide-special-buffers t)
(setq cider-auto-select-error-buffer t)

(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-popup-stacktraces t)
(setq cider-repl-popup-stacktraces nil)
(setq cider-auto-select-error-buffer t)
(setq cider-repl-history-file "~/.emacs.d/cider-history")
(setq cider-repl-wrap-history t)

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-hook 'cider-repl-mode-hook 'subword-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

; Paredit, enable for all lisps
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook          #'enable-paredit-mode)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Projectile (Vim's CTRLP for emacs)
;--------------------------------------------------------------------------------
(projectile-global-mode 1)
; If you want Projectile to be usable in every directory (even without the presence of project file):
;; (setq projectile-require-project-root nil)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Fuzzy matching
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Activate flexible file matching
(ido-mode 1)

(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-use-faces nil) ; Disable ido faces to see flx highlights

; Use M-h and M-l to move between words in the minibuffer
(define-key minibuffer-local-map (kbd "M-h") 'ido-prev-match)
(define-key minibuffer-local-map (kbd "M-l") 'ido-next-match)

; Enable improved ido mode for M-x
(smex-initialize)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Mu4te - Mail client
;--------------------------------------------------------------------------------
; http://www.djcbsoftware.nl/code/mu/mu4e.html
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Smartparens
;--------------------------------------------------------------------------------
; https://github.com/Fuco1/smartparens
(require 'smartparens-config)
(smartparens-global-mode 1)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Status bar
;--------------------------------------------------------------------------------
; Power line, (a custom version frm git)
; (add-to-list 'load-path "~/.emacs.d/powerline")
; (require 'powerline)
;; (powerline-default-theme)
; (powerline-default-theme)

; Smart-mode-line
; M-x package-install RET smart-mode-line RET
; (setq sml/theme 'respectable)
; (sml/setup)

; More clear highlighting of active window
; (set-face-attribute  'mode-line         ; active
;                  nil
;                  :foreground "gray50"
;                  :background "gray20"
;                  :box '(:line-width 1 :style released-button))
; (set-face-attribute  'mode-line-inactive
;                      nil
;                      :foreground "gray20"
;                      ;; :background "black"
;                      :box '(:line-width 1 :style released-button))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Expand-region ; press C-= to expand selection
;--------------------------------------------------------------------------------
(global-set-key (kbd "C-=") 'er/expand-region)
(delete-selection-mode 1)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Magit - Git plugin
;--------------------------------------------------------------------------------
;; Cheathseet with basic commands: http://daemianmack.com/magit-cheatsheet.html
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Starter-kit overrides
;--------------------------------------------------------------------------------
;; Starter-kit (I think) overrides this => enable again
(menu-bar-mode 1)
;; Another override of starter-kit
(remove-hook 'prog-mode-hook 'idle-highlight-mode)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Org
;--------------------------------------------------------------------------------
; Make org-mode available

; ; For using beamer in org-mode
; (require 'ox-latex)
; (add-to-list 'org-latex-classes
;              '("beamer"
;                "\\documentclass\[presentation\]\{beamer\}"
;                ("\\section\{%s\}" . "\\section*\{%s\}")
;                ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
;                ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

(global-set-key (kbd "C-c l") 'org-store-link)
; brew install imagemagick
; (setq org-latex-create-formula-image-program 'imagemagick)

(autoload 'eimp-mode "eimp" "Emacs Image Manipulation Package." t)
  (add-hook 'image-mode-hook 'eimp-mode)

; Image mode
(iimage-mode)

(defun refresh-iimages ()
  "Only way I've found to refresh iimages (without also recentering)"
  (interactive)
  (clear-image-cache nil)
  (iimage-mode nil)
  (iimage-mode t))

(add-to-list 'compilation-finish-functions
             (lambda (buffer msg)
               (save-excursion
                 (set-buffer buffer)
                 (refresh-iimages))))

(add-to-list 'iimage-mode-image-regex-alist
             (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex
                           "\\)\\]")  1))

(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode ‘toggle))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)))

; Babel stuff
(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((R . t)
    (latex . t)))

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-display-inline-images)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Window numbering
;--------------------------------------------------------------------------------
; Enable window numbering mode, all windows are accessible by M-1, M-2, ...
(window-numbering-mode)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Python
;--------------------------------------------------------------------------------
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \\[[0-9]+\\]: "
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code
        "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code
        "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code
        "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Flycheck
;--------------------------------------------------------------------------------
; Use C-c ! n and C-c ! p to navigate between error locations.
(add-hook 'after-init-hook #'global-flycheck-mode)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Evil
;--------------------------------------------------------------------------------
(evil-mode 1)

(setq evil-emacs-state-cursor '("red" box)
      evil-normal-state-cursor '("green" box)
      evil-insert-state-cursor '("yellow" box))

; Evil Surround
(add-to-list 'load-path "~/.emacs.d/evil-surround")
(global-surround-mode 1)

; Evil leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

; Evil nerd commenter
(setq evilnc-hotkey-comment-operator "gc")
(require 'evil-nerd-commenter) ; Has to be required here

; Evil keybindings
(eval-after-load "evil"
  ;; (define-key evil-normal-state-map ",ci" 'evilnc-comment-or-uncomment-lines)
  ;; (define-key evil-normal-state-map ",cl" 'evilnc-comment-or-uncomment-to-the-line)
  ;; (define-key evil-normal-state-map ",cc" 'evilnc-copy-and-comment-lines)
  ;; (define-key evil-normal-state-map ",cp" 'evilnc-comment-or-uncomment-paragraphs)
  ;; (define-key evil-normal-state-map ",cr"
  ;; 'comment-or-uncomment-region)
  '(progn
    ;; Emacs-like editing while in insert mode
    (define-key evil-insert-state-map "\C-e" 'end-of-line)
    (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
    (define-key evil-insert-state-map "\C-b" 'evil-backward-char)
    (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
    (define-key evil-insert-state-map "\C-k" 'kill-line)
    )
  )

; Restore default keybinding (gets overridden
; by evil-nerc-commenter
(global-set-key (kbd "M-;") 'comment-dwim)

; Set keys like this:
(evil-leader/set-key
  "j" 'ace-jump-line-mode
  "b" 'ido-switch-buffer
  "o" 'helm-everything
  "d" 'dired
  "p" 'helm-mini
  ";" 'smex)

; Evil paredit
;; (add-to-list 'load-path "~/.emacs.d/evil-paredit")
;; (require 'evil-paredit)
;; (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
;; (add-hook 'clojure-mode-hook 'evil-paredit-mode)
; From: http://wikemacs.org/index.php/Evil#Enter_an_emacs_mode_in_a_given_state

; Set default modes depending on modes
(loop for (mode . state) in '((inferior-emacs-lisp-mode . emacs)
                              (inferior-ess-mode . emacs)
                              (nrepl-mode . emacs)
                              (cider-repl-mode . emacs)
                              (undo-tree-visualizer-mode . emacs)
                              (pylookup-mode . emacs)
                              (comint-mode . normal)
                              (shell-mode . emacs)
                              (git-commit-mode . insert)
                              (git-rebase-mode . emacs)
                              (term-mode . emacs)
                              (help-mode . emacs)
                              (helm-grep-mode . emacs)
                              (grep-mode . emacs)
                              (bc-menu-mode . emacs)
                              (magit-branch-manager-mode . emacs)
                              (rdictcc-buffer-mode . emacs)
                              (dired-mode . normal)
                              (wdired-mode . normal))
      do (evil-set-initial-state mode state))

; https://github.com/tarao/evil-plugins
(add-to-list 'load-path "~/.emacs.d/evil-plugins")
(define-key evil-ex-completion-map (kbd "C-r") #'evil-ex-paste-from-register)


; Enable easy window movement everywhere (evil and emacs)
;; (windmove-default-keybindings)
;; (global-set-key (kbd "M-h") 'windmove-left)
;; (global-set-key (kbd "M-j") 'windmove-down)
;; (global-set-key (kbd "M-k") 'windmove-up)
;; (global-set-key (kbd "M-l") 'windmove-right)

; Change to split window
(global-set-key [(control ?,)] (lambda () (interactive) (other-window -1)))
(global-set-key [(control ?.)] (lambda () (interactive) (other-window 1)))

; Save buffer
(global-set-key (kbd "C-SPC") 'save-buffer)

; Escape should escape everything, just like in VIM
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)


; Provide some evil mappings for org mode
(evil-define-key 'normal org-mode-map
  (kbd "RET") 'org-open-at-point
  "za"        'org-cycle
  "zA"        'org-shifttab
  "zm"        'hide-body
  "zr"        'show-all
  "zo"        'show-subtree
  "zO"        'show-all
  "zc"        'hide-subtree
  "zC"        'hide-all
  "zj"        'outline-next-visible-heading
  "zk"        'outline-previous-visible-heading

  "gs" 'org-shiftright
  "gS" 'org-shiftleft

  (kbd "M-h") 'org-metaleft
  (kbd "M-l") 'org-metaright
  (kbd "M-j") 'org-metadown
  (kbd "M-k") 'org-metaup

  (kbd "M-H") 'org-shiftmetaleft
  (kbd "M-J") 'org-shiftmetadown
  (kbd "M-K") 'org-shiftmetaup
  (kbd "M-L") 'org-shiftmetaright)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; ESS - R plugin
;--------------------------------------------------------------------------------
(require 'ess-site)
(add-hook 'ess-mode-hook 'r-autoyas-ess-activate)

(evil-define-key 'normal ess-mode-map
  ",d" 'ess-eval-line-and-step
  ",l" 'ess-eval-line
  ",f" 'ess-eval-function
  ",F" 'ess-eval-function-or-paragraph-and-step
  ",p" 'ess-eval-paragraph
  ",P" 'ess-eval-paragraph-and-step
  ",D" 'ess-eval-paragraph-and-step
  ",aa" 'ess-eval-buffer
  )

(evil-define-key 'visual ess-mode-map
  ",s" 'ess-eval-region)

; Some stuff from: http://permalink.gmane.org/gmane.emacs.vim-emulation/1135
(eval-after-load 'ess-help
  '(progn
     (add-hook 'ess-help-mode-hook 'evil-change-to-initial-state)
     ))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Helm
;--------------------------------------------------------------------------------
(helm-mode t)
(recentf-mode t)

;; (global-set-key (kbd "M-x")                     'helm-M-x)
(global-set-key (kbd "M-y")                     'helm-show-kill-ring)
(global-set-key (kbd "C-c f")                   'helm-recentf)
;; (global-set-key (kbd "C-x C-f")                 'helm-find-files)
;; (global-set-key (kbd "C-x b")                 'helm-buffers-list)
;; (global-set-key (kbd "C-c <SPC>")               'helm-all-mark-rings)
;; (global-set-key (kbd "C-x r b")                 'helm-filtered-bookmarks)
;; (global-set-key (kbd "C-h r")                   'helm-info-emacs)
;; (global-set-key (kbd "C-:")                     'helm-eval-expression-with-eldoc)
;; (global-set-key (kbd "C-,")                     'helm-calcul-expression)
;; (global-set-key (kbd "C-h d")                   'helm-info-at-point)
;; (global-set-key (kbd "C-c g")                   'helm-google-suggest)
;; (global-set-key (kbd "M-g s")                   'helm-do-grep)
;; (global-set-key (kbd "C-x C-d")                 'helm-browse-project)
;; (global-set-key (kbd "<f1>")                    'helm-resume)
(global-set-key (kbd "C-h C-f")                 'helm-apropos)
;; (global-set-key (kbd "<f5> s")                  'helm-find)
(define-key global-map [remap jump-to-register] 'helm-register)
(define-key global-map [remap list-buffers]     'helm-buffers-list)
(define-key global-map [remap dabbrev-expand]   'helm-dabbrev)
(define-key global-map [remap find-tag]         'helm-etags-select)
 ; shell history.
(define-key shell-mode-map (kbd "M-P")          'helm-comint-input-ring)

;; (define-key helm-find-files-map (kbd "C-d") 'helm-ff-persistent-delete)
;; (define-key helm-buffer-map (kbd "C-d")     'helm-buffer-run-kill-persistent)

;; (setq helm-google-suggest-use-curl-p             t
;;       ;helm-kill-ring-threshold                   1

;;       helm-scroll-amount                         4
;;       helm-quick-update                          t
;;       helm-idle-delay                            0.01
;;       helm-input-idle-delay                      0.01

;;       ;helm-completion-window-scroll-margin       0
;;       ;helm-display-source-at-screen-top          nil
;;       helm-ff-search-library-in-sexp             t
;;       ;helm-kill-ring-max-lines-number            5
;;       ;; helm-default-external-file-browser         "thunar"
;;       ;; helm-pdfgrep-default-read-command          "evince --page-label=%p '%f'"
;;       ;helm-ff-transformer-show-only-basename     t

;;       helm-ff-auto-update-initial-value          t
;;       ;; helm-grep-default-command                  "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
;;       ;; helm-grep-default-recurse-command          "ack-grep -H --smart-case --no-group --no-color %e %p %f"

;;       helm-reuse-last-window-split-state         nil
;;       helm-split-window-default-side             'right

;;       ;helm-split-window-in-side-p                nil
;;       helm-always-two-windows                    t
;;       ;helm-persistent-action-use-special-display t
;;       helm-buffers-favorite-modes                (append helm-buffers-favorite-modes
;;                                                          '(picture-mode artist-mode))
;;       helm-ls-git-status-command                 'magit-status

;;       ;helm-never-delay-on-input                  nil
;;       helm-candidate-number-limit                200
;;       helm-M-x-requires-pattern                  0
;;       helm-dabbrev-cycle-thresold                5
;;       helm-surfraw-duckduckgo-url                "https://duckduckgo.com/?q=%s&ke=-1&kf=fw&kl=fr-fr&kr=b&k1=-1&k4=-1"
;;       helm-boring-file-regexp-list               '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$")
;;       ;helm-mode-handle-completion-in-region      t
;;       ;helm-moccur-always-search-in-current        t
;;       ;helm-tramp-verbose                         6
;;       ;helm-ff-file-name-history-use-recentf      t
;;       ;helm-follow-mode-persistent                t
;;       helm-move-to-line-cycle-in-source           t
;;       ido-use-virtual-buffers                     t             ; Needed in helm-buffers-list
;;       helm-tramp-verbose                          6
;;       helm-buffers-fuzzy-matching                 t
;;       )

(setq helm-split-window-default-side             'right
      helm-reuse-last-window-split-state         nil
      helm-scroll-amount                         4
      ido-use-virtual-buffers                    t             ; Needed in helm-buffers-list
      helm-quick-update                          t
      helm-idle-delay                            0.01
      helm-input-idle-delay                      0.01
      helm-buffers-fuzzy-matching                t)


;; (defun helm-everything ()
;;   (interactive)
;;   (require 'helm-files)
;;   (let ((helm-ff-transformer-show-only-basename nil))
;;     (helm-other-buffer '(helm-source-buffers-list
;;                          helm-source-recentf
;;                          helm-source-projectile-files-list
;;                          helm-source-files-in-current-dir
;;                          ;; helm-source-findutils
;;                          ;; helm-source-bookmarks
;;                          ;; helm-source-locate
;;                          ;; helm-source-file-name-history
;;                          ;; helm-source-buffer-not-found
;;                          )
;;                        "*my-helm*")))

; adding projectile sources to another helm command somehow requires
; projectile to be executed at least once (to populate the sources or whatever)
; Thus, just add everything to projectile.
(eval-after-load 'helm-projectile
  '(progn
    (add-to-list 'helm-projectile-sources-list' helm-source-buffers-list)
    (add-to-list 'helm-projectile-sources-list' helm-source-recentf)
    (add-to-list 'helm-projectile-sources-list' helm-source-files-in-current-dir)))


; Global normal key bindings
(evil-define-key 'normal global-map
  "\C-p" 'helm-projectile
  "q" 'evil-record-macro
  ":" 'evil-repeat-find-char
  ",gs" 'magit-status
  ",ls" 'ido-switch-buffer
  ";" 'evil-ex)

(define-key evil-visual-state-map (kbd "SPC SPC") 'smex)
(define-key evil-normal-state-map (kbd "SPC SPC") 'smex)
(define-key evil-normal-state-map (kbd ",re") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "SPC o") 'imenu)
(define-key evil-normal-state-map (kbd "SPC b") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "SPC k") 'ido-kill-buffer)
(define-key evil-normal-state-map (kbd "SPC f") 'ido-find-file)

(evil-define-key 'visual global-map
  ";" 'evil-ex)

(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c o") 'helm-projectile)
(global-set-key (kbd "C-c C-/") 'helm-complete-file-name-at-point)

; Unimpaired
(define-key evil-normal-state-map (kbd "[ e") (kbd "ddkP"))
(define-key evil-normal-state-map (kbd "] e") (kbd "ddp"))
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[ q") 'previous-error)
(define-key evil-normal-state-map (kbd "] q") 'next-error)
(define-key evil-normal-state-map (kbd "[ SPC") '(progn (evil-insert-newline-above) (forward-line)))
(define-key evil-normal-state-map (kbd "] SPC") '(progn (evil-insert-newline-below) (forward-line -1)))

; Killing words in minibuffer just like in insert mode
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Better line numbers
;--------------------------------------------------------------------------------
; Disable linum on starred buffers
(require 'linum-off)                    ; Needs to be imported here
(add-to-list 'linum-disabled-modes-list 'doc-view-mode)
(global-linum-mode)                     ; Enable line numbers everywhere
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Popwin - show help-buffers and the like as popup-windows
;--------------------------------------------------------------------------------
(require 'popwin)
(popwin-mode 1)
;--------------------------------------------------------------------------------

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Color-theme
;--------------------------------------------------------------------------------
; Color-theme plugin, has to be installed by M-x el-get-install RET color-theme RET
(color-theme-initialize)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
; (color-theme-molokai)
; (load-theme 'tomorrow-night-bright t)
; (load-theme 'obsidian t)

(require 'moe-theme) ; autoload doesn't work with this somehow
(moe-dark)
(setq moe-theme-mode-line-color 'green)

;; Resize titles
;; (setq moe-theme-resize-markdown-title '(2.0 1.7 1.5 1.3 1.0 1.0))
;; (setq moe-theme-resize-org-title '(2.2 1.8 1.6 1.4 1.2 1.0 1.0 1.0 1.0))
;; (setq moe-theme-resize-rst-title '(2.0 1.7 1.5 1.3 1.1 1.0))

; (powerline-moe-theme)

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c000b4df55334750116b9b937582cf4ed56ffe1dd6182a03a8aac92bcbc15ed0" "9e7fe7a9d03911bf1d7ede8f0c9c6c584378870560d72545c665a85c650e4147" "3b7e62b9884f1533f8eac5d21b252e5b8098274d7d9096521db84e4f10797ae3" "fc55a921b2c1d24233b678d133b9899e03144877d558cf6807ed51f83459d2d9" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Cleaning up the mode line
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(defvar mode-line-cleaner-alist
  `((auto-complete-mode . "")
    (yas-minor-mode . " ¥")
    (paredit-mode . " π")
    (eldoc-mode . "")
    (abbrev-mode . "")
    ;; Major modes
    (lisp-interaction-mode . " λ")
    (hi-lock-mode . "")
    (python-mode . " Py")
    (emacs-lisp-mode . " λ")
    (flymake-mode . " ✓")
    (projectile-mode . " Π")
    (helm-mode . " H")
    (undo-tree-mode . " Undo")
    (auto-fill-mode . " af")
    (nxhtml-mode . " nx"))
  "Alist for `clean-mode-line'.

;; When you add a new element to the alist, keep in mind that you
;; must pass the correct minor/major mode symbol and a string you
;; want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; alias the new `flymake-report-status-slim' to
;;; `flymake-report-status'
(defalias 'flymake-report-status 'flymake-report-status-slim)
(defun flymake-report-status-slim (e-w &optional status)
  "Show \"slim\" flymake status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " Φ"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line (message "FORMATSTRING" &optional ARGS)ode-line)
    (force-mode-line-update)))


(defun window-toggle-split-direction ()
  "Switch window split from horizontally to vertically, or vice versa.

i.e. change right window to bottom, or change bottom window to right."
  (interactive)
  (require 'windmove)
  (let ((done))
    (dolist (dirs '((right . down) (down . right)))
      (unless done
        (let* ((win (selected-window))
               (nextdir (car dirs))
               (neighbour-dir (cdr dirs))
               (next-win (windmove-find-other-window nextdir win))
               (neighbour1 (windmove-find-other-window neighbour-dir win))
               (neighbour2 (if next-win (with-selected-window next-win
                                          (windmove-find-other-window neighbour-dir next-win)))))
          ;;(message "win: %s\nnext-win: %s\nneighbour1: %s\nneighbour2:%s" win next-win neighbour1 neighbour2)
          (setq done (and (eq neighbour1 neighbour2)
                          (not (eq (minibuffer-window) next-win))))
          (if done
              (let* ((other-buf (window-buffer next-win)))
                (delete-window next-win)
                (if (eq nextdir 'right)
                    (split-window-vertically)
                  (split-window-horizontally))
                (set-window-buffer (windmove-find-other-window neighbour-dir) other-buf))))))))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Keybindings
;--------------------------------------------------------------------------------
; Enable vim-window switching in emacs!
(define-key evil-emacs-state-map (kbd "C-w h") 'windmove-left)
(define-key evil-emacs-state-map (kbd "C-w j") 'windmove-down)
(define-key evil-emacs-state-map (kbd "C-w k") 'windmove-up)
(define-key evil-emacs-state-map (kbd "C-w l") 'windmove-right)

(define-key evil-emacs-state-map (kbd "C-w H") 'window-toggle-split-direction)
(define-key evil-emacs-state-map (kbd "C-w J") 'window-toggle-split-direction)
(define-key evil-emacs-state-map (kbd "C-w K") 'window-toggle-split-direction)
(define-key evil-emacs-state-map (kbd "C-w L") 'window-toggle-split-direction)

(define-key evil-emacs-state-map (kbd "C-w o") 'delete-other-windows)
(define-key evil-emacs-state-map (kbd "C-w c") 'delete-window)

(define-key evil-emacs-state-map (kbd "C-w w") 'other-window)
(define-key evil-emacs-state-map (kbd "C-w C-w") 'other-window)
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
; Custom functions
;--------------------------------------------------------------------------------
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
