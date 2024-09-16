;; Load config.org for init.el configuration
(org-babel-load-file
  (expand-file-name "config.org"
                    user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
	 '("/home/sunless/darkness/container.org" "/home/sunless/darkness/back.org" "/home/sunless/darkness/front.org" "/home/sunless/.config/emacs/config.org" "/home/sunless/murder/pure.org" "/home/sunless/murder/stats.org" "/home/sunless/murder/soul.org" "/home/sunless/darkness/lunix.org" "/home/sunless/darkness/programmer.org" "/home/sunless/darkness/coder.org" "/home/sunless/darkness/tinker.org" "/home/sunless/murder/hell.org"))
 '(package-selected-packages
	 '(elfeed tldr rainbow-delimiters rainbow-mode ivy-rich all-the-icons-ivy-rich counsel flycheck flyspell-correct all-the-icons projectile emacs-crossword sudoku dashboard vterm which-key magit catppuccin-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
