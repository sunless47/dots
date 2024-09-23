;;; package --- minimalism
;;; Commentary:
;;; Code:

;; welcome to GNU emacs disable
(setq inhibit-startup-message t)

;; disable various GUI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default mode-line-format nil)

;; disable automatic backup files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; disable bell
(setq ring-bell-function 'ignore)

;; transparency
(set-frame-parameter nil 'alpha-background 20)
(add-to-list 'default-frame-alist '(alpha-background . 20))

;; indentation
(setq-default tab-width 2)
(setq-default standard-indent 2)
(setq-default electric-indent-inhibit t)
(setq-default indent-tabs-mode t)

;; yes and no to y | n
(defalias 'yes-or-no-p 'y-or-n-p)

;; scratch and minibuffer (hack) message
(setq initial-scratch-message "")
(defun display-startup-echo-area-message ()
	(message ""))

;; confirmation on exit
(setq confirm-kill-processes nil)

;; like lambda
(global-prettify-symbols-mode t)

;; setting utf-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; close buffers
(defun close-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-M-s-k") 'close-all-buffers)


;;; line wrap
  (add-hook 'org-mode-hook
	    '(lambda ()
	       (visual-line-mode 1)))

;; cursor moves during splits
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'minimal)
;;; minimal.el ends here
