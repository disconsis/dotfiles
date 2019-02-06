;; separate file for "customize" variables
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file :noerror t)

;; repositories

;; manual repos
(setq manual-plugin-dir "/home/disconsis/.emacs.d/manual-plugins/")
(if (not (member manual-plugin-dir load-path))
    (setq load-path (append load-path '("/home/disconsis/.emacs.d/manual-plugins/"))))
(require 'tbemail)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-enable-at-startup nil)
(package-initialize)

;; set up `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; package list
(use-package evil :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)

  (use-package evil-leader :ensure t
    :config
    (global-evil-leader-mode))

  :config
  (setq evil-mode-line-format nil)
  (evil-mode 1)

  (use-package evil-surround :ensure t
    :config (global-evil-surround-mode))

  ;; `evil-leader' config
  (evil-global-set-key 'motion (kbd "SPC") 'evil-repeat-find-char-reverse)
  (evil-leader/set-leader (kbd ","))

  (use-package evil-indent-textobject :ensure t)

  (use-package evil-commentary :ensure t
    :config (evil-commentary-mode)))

(use-package helm :ensure t
  :config
  (helm-mode 1))

(use-package haskell-mode :ensure t
  :config
  (setq haskell-font-lock-symbols t))

(use-package magit :ensure t)

(use-package which-key :ensure t
  :config (which-key-mode))

(use-package autopair :ensure t
  :config (autopair-global-mode))

(use-package org :ensure t
  :config
  (setq org-todo-keywords
        '((sequence "TODO" "|" "WAIT" "VERIFY" "DONE")))

  (org-display-inline-images)

  (setq org-blank-before-new-entry
        '((heading . nil) (plain-list-item . nil)))

  (use-package org-bullets :ensure t
    :config
    (setq org-bullets-bullet-list
          '("▶" "▷" "»" "›" "→" "-" "⋅"))

    (add-hook 'org-mode-hook 'org-bullets-mode))
  )

(use-package smart-mode-line :ensure t
  :config
  (setq sml/theme 'atom-one-dark)
  ;; set path aliases
  (setq sml/replacer-regexp-list
        '(("^~/\\.git/dotfiles/disconsis/\\.config" ":C:")
          ("^~/\\.git/dotfiles/disconsis/" ":Dot:")
	  ("^~/\\.emacs\\.d/init\\.el$" ":Init:")
	  ("^~/\\.emacs\\.d/" ":ED:")
	  ("^~/documents/" ":Doc:")
          ("^~/masters/" ":MS:")
          ("^~/class/" ":Class:")))

  (sml/setup))

(use-package rainbow-delimiters :ensure t
  :config (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode))

;; colorschemes
(use-package color-theme-sanityinc-tomorrow :ensure t)
(use-package gruvbox-theme :ensure t)
(use-package one-themes :ensure t)

;; colors
(load-theme 'one-dark t)

;; config edit/reload
(defun my/config-open ()
  (interactive)
  (find-file user-init-file))

(defun my/config-reload ()
  (interactive)
  (load user-init-file))

(evil-ex-define-cmd "co" 'my/config-open)
(evil-ex-define-cmd "cr" 'my/config-reload)

;; fix shell backspacing
(setq comint-prompt-read-only t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun my/line-before ()
  (interactive)
  (save-excursion
    (previous-line)
    (end-of-line)
    (insert "\n")))

(defun my/line-after ()
  (interactive)
  (save-excursion
    (end-of-line)
    (insert "\n")))

(evil-global-set-key 'normal (kbd "[ SPC") 'my/line-before)
(evil-global-set-key 'normal (kbd "] SPC") 'my/line-after)


;; line numbers
(add-hook 'prog-mode-hook 'linum-mode)
;; add space before linum
(setq linum-format 'my/linum-format-func)

(add-hook 'linum-before-numbering-hook
	(lambda ()
	    (setq-local linum-format-fmt
			(let ((w (length (number-to-string
					(count-lines (point-min) (point-max))))))
			(concat "%" (number-to-string w) "d")))))

(defun my/linum-format-func (line)
  (let ((space (propertize " " 'face 'linum)))
    (concat
      space
      (propertize (format linum-format-fmt line) 'face 'linum))))

;; expand tabs
(setq indent-tabs-mode nil)

;; no startup boilerplate
(setq inhibit-startup-screen t)

;; follow symlinks
(setq vc-follow-symlinks t)

;; show matching parens
(add-hook 'prog-mode-hook 'show-paren-mode)

;; wrap. always.
(global-visual-line-mode)

;; update diff-hl after magit
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

;; find files with helm
(evil-global-set-key 'normal (kbd "C-x C-f") 'helm-find-files)

;; indent-like promotion/demotion
(defun my/semantic-org-p ()
  "return t if in org-context, nil if in text-context.
   this is decided on the basis of whether the line starts with a `*'"
  (let* ((line-start (line-beginning-position))
	 (line-start-char
	  (buffer-substring-no-properties line-start (+ 1 line-start))))
    (string= "*" line-start-char)))

(defun my/semantic-org-promote ()
  (interactive)
  (if (my/semantic-org-p)
      (org-do-promote)
      (evil-shift-left-line 1)))

(defun my/semantic-org-demote ()
  (interactive)
  (if (my/semantic-org-p)
      (org-do-demote)
      (evil-shift-right-line 1)))

(evil-define-key 'insert org-mode-map (kbd "C-t") 'my/semantic-org-demote)
(evil-define-key 'insert org-mode-map (kbd "C-d") 'my/semantic-org-promote)

;; make window switching easier
(evil-global-set-key 'normal (kbd "C-h") 'evil-window-left)
(evil-global-set-key 'normal (kbd "C-j") 'evil-window-down)
(evil-global-set-key 'normal (kbd "C-k") 'evil-window-up)
(evil-global-set-key 'normal (kbd "C-l") 'evil-window-right)

 ;; use `:h(elp)?' instead of C-h
(evil-ex-define-cmd "h" 'help)

;; slower scaling
(setq text-scale-mode-step 1.1)

;; set single backup dir
(setq backup-directory-alist '(("." . "~/tmp/.emacs-backup-files")))

;; word boundaries
;; (modify-syntax-entry ?_ "w" python-mode-syntax-table)
(modify-syntax-entry ?- "w" emacs-lisp-mode-syntax-table)

;; projectile
(evil-define-key 'normal projectile-mode-map (kbd "C-p") 'projectile-command-map)

;; interactive-haskell-mode
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(evil-leader/set-key-for-mode haskell-mode-map (kbd "t") 'hakell-interactive-bring)
(evil-leader/set-key-for-mode haskell-mode-map (kbd "r") 'haskell-process-load-file)
(evil-leader/set-key-for-mode haskell-mode-map (kbd "l") 'haskell-interactive-mode-clear)
(evil-leader/set-key-for-mode haskell-mode-map (kbd "t") 'haskell-process-do-type)
(evil-leader/set-key-for-mode haskell-mode-map (kbd "i") 'haskell-process-do-info)

;; move visual lines (gj, gk)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; TODO: make keybind for Meta
;; TODO: use space key for maps like in spacemacs
;; TODO: write a keymap for org-mode to turn normal text into a subitem
;; TODO: replace C-x prefix with something better
;; TODO: consider evil-magit
;; TODO: remove s-/ minor mode
;; TODO: vim-vinegar? or just fuzzy finding
;; TODO: fix folding so that it doesn't have to be on the brace
;; TODO: exchange lines

;; (defun my/get-line (linum)
;;   (save-excursion
;;     (goto-line linum)
;;     (thing-at-point 'line t)))

;; (defun my/exchange-line-with-before ()
;;   "exchange the current line with the one before"
;;   (interactive)
;;   ; if first line, no-op
;;   (let ((linum (line-number-at-pos)))
;;     (if (= 1 linum)
;;       (return))
;;     (kill-region (line-beginning-position) (+ 1 (line-end-position)))
;;     (beginning-of-line)
;;     (yank)
;;     ))

;; ;; sdlkfj
;; (my/exchange-line-with-before)
;; (yank)
