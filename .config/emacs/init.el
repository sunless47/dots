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
	 '("/home/sunless/.config/emacs/config.org" "/home/sunless/darkness/git.org" "/home/sunless/darkness/html.org" "/home/sunless/darkness/java.org" "/home/sunless/darkness/js.org" "/home/sunless/darkness/md.org" "/home/sunless/insanity/bash.org" "/home/sunless/insanity/church.org" "/home/sunless/insanity/evil.org" "/home/sunless/insanity/lunix.org" "/home/sunless/insanity/tex.org" "/home/sunless/murder/dreams.org" "/home/sunless/murder/pure.org"))
 '(package-selected-packages
	 '(elfeed tldr rainbow-delimiters rainbow-mode ivy-rich all-the-icons-ivy-rich counsel flycheck flyspell-correct all-the-icons projectile emacs-crossword sudoku dashboard vterm which-key magit catppuccin-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
