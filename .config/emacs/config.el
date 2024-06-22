(add-to-list 'load-path "scripts/")

;; enable line numbers
;;(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;(add-hook 'text-mode-hook 'display-line-numbers-mode)

(show-paren-mode t)

(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default mode-line-format nil)

(setq x-select-enable-clipboard t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq scroll-conservatively 100)

(setq ring-bell-function 'ignore)

(set-frame-parameter nil 'alpha-background 20)
(add-to-list 'default-frame-alist '(alpha-background . 20))

(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq c-basic-offset tab-width)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)
(setq backward-delete-char-untabify-method 'nil)

(global-prettify-symbols-mode t)

(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            ))
(electric-pair-mode t)

(defun split-and-follow-horizontally ()
      (interactive)
      (split-window-below)
      (balance-windows)
      (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
      (interactive)
      (split-window-right)
      (balance-windows)
      (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq initial-scratch-message "")

;; switch windows
  (windmove-default-keybindings)

;;(global-hl-line-mode t)

(global-set-key "\M-n" 'next-buffer)
(global-set-key "\M-p" 'previous-buffer)

(setq confirm-kill-processes nil)

;; idk, indenting?
(use-package org
  :config
  (add-hook 'org-mode-hook 'org-indent-mode)
  (add-hook 'org-mode-hook
            '(lambda ()
               (visual-line-mode 1))))
(use-package org-indent
  :diminish org-indent-mode)

;; export numbers
;;(setq org-export-with-section-numbers nil)

;; org-temp <s source block
(require 'org-tempo)

;; more todo options
(setq org-todo-keywords
   '((sequence "APOCALYPSE" "DOOM" "ECLIPSE" "GIT RITUAL" "|" "HORIZON")))

;; logging time
(setq org-log-done 'time)

;; entries from diary
(setq org-agenda-include-diary t)

;; agenda files
(setq org-agenda-files (list "~/darkness"
                             "~/insanity"
                             "~/murder"))


;; adding my email when mailing
(setq mail-default-headers
  "From: sunlesskelv@gmail.com")
;; why not personal information
(setq user-full-name "Sunless"
      user-mail-address "sunlesskelv@gmail.com")

;; message
(defun display-startup-echo-area-message ()
  (message " "))

;; load org files
(find-file "~/.config/emacs/config.org")
(find-file "~/.config/emacs/diary")
(find-file "~/darkness/git.org")
(find-file "~/darkness/js.org")
(find-file "~/darkness/html.org")
(find-file "~/darkness/java.org")
(find-file "~/darkness/md.org")
(find-file "~/darkness/code.org")
(find-file "~/darkness/css.org")
(find-file "~/darkness/meriola.org")
(find-file "~/darkness/angular.org")
(find-file "~/darkness/spring.org")
(find-file "~/insanity/bash.org")
(find-file "~/insanity/church.org")
(find-file "~/insanity/evil.org")
(find-file "~/insanity/lunix.org")
(find-file "~/murder/dreams.org")
(find-file "~/murder/pure.org")
(find-file "~/murder/survivor.org")
(find-file "~/murder/world.org")

(put 'dired-find-alternate-file 'disabled nil)
(add-hook 'dired-mode-hook
        (lambda ()
          (define-key dired-mode-map (kbd "^")
                      (lambda () (interactive) (find-alternate-file "..")))))

(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil :depth 1
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
                                                 ,@(when-let ((depth (plist-get order :depth)))
                                                     (list (format "--depth=%d" depth) "--no-single-branch"))
                                                 ,(plist-get order :repo) ,repo))))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))
;; Install a package via the elpaca macro
;; See the "recipes" section of the manual for more details.

;; (elpaca example-package)

;; Install use-package support
(elpaca elpaca-use-package
  ;; Enable use-package :ensure support for Elpaca.
  (elpaca-use-package-mode))

;;When installing a package which modifies a form used at the top-level
;;(e.g. a package which adds a use-package key word),
;;use the :wait recipe keyword to block until that package has been installed/configured.
;;For example:
;;(use-package general :ensure (:wait t) :demand t)

;; Expands to: (elpaca evil (use-package evil :demand t))
;; (use-package evil :ensure t :demand t)

;;Turns off elpaca-use-package-mode current declaration
;;Note this will cause the declaration to be interpreted immediately (not deferred).
;;Useful for configuring built-in emacs features.

(use-package catppuccin-theme
  :ensure t
  :init
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload))

(use-package magit
  :ensure t
  :defer t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode))

(use-package vterm
    :ensure t)

  ;; name your new term
;;  (defun tm(Name)
;;  (interactive "sName: ")
;;  (vterm "/bin/bash")
;;  (rename-buffer (concat "*" Name "*") t))

  ;; speed
  (defun tm()
    (interactive)
    (let ((name (concat "vterm://" (buffer-name))))
      (vterm (current-buffer))))
  (global-set-key (kbd "s-o") 'tm)

(use-package sudoku
  :ensure t)

(use-package projectile
  :ensure t
  :config
    (projectile-mode 1))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package flyspell-correct
  :ensure t)
(use-package flycheck
  :ensure t
  :defer t
  :diminish
  :init 
    (global-flycheck-mode))

(use-package counsel
  :ensure t
  :after ivy
  :config
    (counsel-mode))

(use-package ivy
  :ensure t
  :config
    (ivy-mode))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init
    (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init
    (ivy-rich-mode 1))

(use-package rainbow-mode
  :ensure t
  :hook org-mode prog-mode)

(use-package rainbow-delimiters
  :ensure t
  :hook ((emacs-lisp-mode . rainbow-delimiters-mode)
         (clojure-mode . rainbow-delimiters-mode)))

(use-package tldr
  :ensure t)

(use-package elfeed
             :ensure t
             :config
             (setq elfeed-feeds (quote
                                  (;; tech
                                   ("https://www.reddit.com/r/TechNews.rss")
                                   ("https://www.reddit.com/r/TechSupport.rss")
                                   ("https://www.reddit.com/r/ITCareerQuestions.rss")
                                   ("https://www.reddit.com/r/Privacy.rss")
                                   ("https://www.reddit.com/r/Cyberpunk.rss")
                                   ("https://www.reddit.com/r/Technology.rss")
                                   ("https://www.reddit.com/r/dotfiles.rss")

                                   ;; web
                                   ("https://www.reddit.com/r/WebDev.rss")
                                   ("https://www.reddit.com/r/Javascript.rss")
                                   ("https://www.reddit.com/r/LearnWebDev.rss")
                                   ("https://www.reddit.com/r/LearnJavascript.rss")
                                   ("https://www.reddit.com/r/Node.rss")
                                   ("https://www.reddit.com/r/Frontend.rss")

                                   ;; coding
                                   ("https://www.reddit.com/r/Coding.rss")
                                   ("https://www.reddit.com/r/CodingHelp.rss")
                                   ("https://www.reddit.com/r/BadCode.rss")
                                   ("https://www.reddit.com/r/LearnProgramming.rss")
                                   ("https://www.reddit.com/r/AskProgramming.rss")
                                   ("https://www.reddit.com/r/LearnPython.rss")

                                   ;; linux
                                   ("https://www.reddit.com/r/linux.rss")
                                   ("https://www.reddit.com/r/terminal.rss")
                                   ("https://www.reddit.com/r/commandline.rss")
                                   ("https://www.reddit.com/r/linuxadmin.rss")
                                   ("https://www.reddit.com/r/ubuntu.rss")
                                   ("https://www.reddit.com/r/debian.rss")
                                   ("https://www.reddit.com/r/gentoo.rss")
                                   ("https://www.reddit.com/r/piracy.rss")
                                   ("https://www.reddit.com/r/archlinux.rss")

                                   ;; tech
                                   ("https://morss.it/https://www.tecmint.com/feed/")
                                   ("https://morss.it/https://itsfoss.com/rss/")
                                   ("https://morss.it/https://www.theverge.com/rss/index.xml")
                                   ("https://morss.it/https://www.theverge.com/tech/rss/index.xml")
                                   ("https://morss.it/https://www.theverge.com/rss/entertainment/index.xml")
                                   ("https://morss.it/https://www.theverge.com/reviews/rss/index.xml")
                                   ("https://morss.it/https://www.wired.com/feed/rss")
                                   ("https://morss.it/https://www.wired.com/feed/category/security/latest/rss")
                                   ("https://morss.it/https://www.wired.com/feed/category/ideas/latest/rss")
                                   ("https://morss.it/feeds.mashable.com/mashable")
                                   ("https://morss.it/feeds.feedburner.com/hackaday")
                                   ("https://morss.it/feeds.mashable.com/mashable/tech")
                                   ("https://morss.it/https://gizmodo.com/tag/diy/rss")        ("https://morss.it/feeds.mashable.com/mashable/entertainment")
                                   ("https://morss.it/rss.cnn.com/rss/edition_world.rss")
                                   ("https://morss.it/https://feeds.feedburner.com/TechCrunch/Twitter")

                                   ("https://morss.it/https://www.theguardian.com/uk/rss")
                                   ("https://morss.it/https://www.theguardian.com/world/rss")
                                   ("https://morss.it/https://www.theguardian.com/us-news/rss")
                                   ("https://morss.it/https://www.theguardian.com/world/africa/rss")
                                   ("https://morss.it/https://www.theguardian.com/uk/technology/rss")
                                   ("https://morss.it/https://www.theguardian.com/books/rss")
                                   ("https://morss.it/https://www.theguardian.com/music/rss")
                                   ("https://morss.it/https://www.theguardian.com/crosswords/rss")
                                   ("https://morss.it/https://www.theguardian.com/games/rss")
                                   ;; games
                                   ("https://morss.it/https://kotaku.com/rss")
                                   ("https://morss.it/https://www.polygon.com/rss/index.xml")
                                   ("https://morss.it/feeds.feedburner.com/ign/pc-reviews")
                                   ("https://morss.it/feeds.feedburner.com/ign/pc-articles")
                                   ("https://morss.it/feeds.feedburner.com/ign/tech-articles")
                                   ("https://morss.it/feeds.feedburner.com/ign/movies-articles")
                                   ("https://morss.it/feeds.feedburner.com/ign/game-reviews")
                                   ("https://morss.it/feeds.feedburner.com/ign/games-all")
                                   ("https://morss.it/feeds.feedburner.com/ign/news")
                                   ("https://morss.it/feeds.feedburner.com/ign/reviews")
                                   ))))
