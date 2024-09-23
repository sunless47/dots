;;; package --- main
;;; Commentary:
;;; Code:

;; personal tinkers
(use-package minimal
             :load-path "~/.config/emacs/configs/sunless/")
(use-package taste
             :load-path "~/.config/emacs/configs/sunless/"
             :after (:all minimal)
             :bind (
                    ("M-n" . 'next-buffer)
                    ("M-p" . 'previous-buffer)
                    ("C-x k" . 'kill-this-buffer)
                    ("C-z" . 'multi-term)
                    ("C-c a" . 'org-agenda)))

;; packages
(use-package melpa
             :load-path "~/.config/emacs/configs/sunless/")

(use-package essentials
             :load-path "~/.config/emacs/configs/packages/")

(use-package rss
             :load-path "~/.config/emacs/configs/packages/")

(use-package startup
             :load-path "~/.config/emacs/configs/sunless/"
						 :config
						 (funcall 'config-visit)
						 (funcall 'notes-visit))
(provide 'init)
;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 '(which-key rainbow-mode vterm sudoku rainbow-delimiters pdf-tools org-bullets magit elfeed dracula-theme chess auto-compile auctex all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
