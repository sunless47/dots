;;; package --- loaded buffers
;;; Commentary:
;;; Code:

;; config
(defun config-visit ()
  (interactive)
	(find-file "~/.config/emacs/configs/packages/essentials.el")
	(find-file "~/.config/emacs/configs/packages/rss.el")
 	(find-file "~/.config/emacs/configs/sunless/startup.el")
  (find-file "~/.config/emacs/configs/sunless/taste.el")
	(find-file "~/.config/emacs/configs/sunless/melpa.el")
  (find-file "~/.config/emacs/configs/sunless/minimal.el")
  (find-file "~/.config/emacs/init.el"))
(global-set-key (kbd "C-c e") 'config-visit)

;; notes
(defun notes-visit ()
  (interactive)
  ;; insanity
  (find-file "~/insanity/insanity.org")
  (find-file "~/insanity/pure.org")
  (find-file "~/insanity/soul.org")
  (find-file "~/insanity/stats.org")
  (find-file "~/.config/emacs/diary")

  ;; darkness
  (find-file "~/darkness/back.org")
	(find-file "~/darkness/scholar.org")
  (find-file "~/darkness/front.org")
  (find-file "~/darkness/coder.org")
  (find-file "~/darkness/container.org")
  (find-file "~/darkness/lunix.org")
  (find-file "~/darkness/programmer.org")
  (find-file "~/darkness/tinker.org")
  (find-file "~/darkness/hell.org"))
(global-set-key (kbd "C-c n") 'notes-visit)

(provide 'startup)
;;; startup.el ends here
