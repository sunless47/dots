;;; package --- taste
;;; Commentary:
;;; Code:

;; show parent parenthesis
(show-paren-mode t)

;; normal scrolling
(setq scroll-conservatively 100)

;; changing splits
;;(windmove-default-keybindings)

;; font
(set-frame-font "JetBrainsMonoNerdFontMono" t)

;; org-temp for codeblocks
(require 'org-tempo)

;; org indenting
(use-package org
  :config
  (add-hook 'org-mode-hook 'org-indent-mode))
(use-package org-indent
  :diminish org-indent-mode)

;; more todo options
(setq org-todo-keywords
   '((sequence "APOCALYPSE" "THE END" "CHORE" "|" "NOICE")))

;; parenthesis
(electric-pair-mode t)

;; scratch
(setq initial-major-mode 'org-mode)

;; faster startup
;;(setq use-package-always-defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'taste)
;;; taste.el ends here
