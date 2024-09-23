;;; package --- others
;;; Commentary:
;;; Code:

;; theme
(use-package dracula-theme
  :ensure t
  :config
  (load-theme 'dracula t))

;; magit
(use-package magit
  :ensure t
  :defer t)

;; sudoku
(use-package sudoku
  :ensure t
  :defer t)

;; chess
(use-package chess
  :ensure t
  :defer t)

;; terminal
(use-package vterm
  :ensure t
	:config
	    (defun multi-term()
      (interactive)
      (let ((name (concat "vterm://" (buffer-name))))
        (vterm (current-buffer)))))
;; pdf
(use-package pdf-tools
   :ensure t
   :config
   (pdf-tools-install))

;; all the icons
(use-package all-the-icons
  :if (display-graphic-p))

;; org-bullets
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
  (setq org-hide-leading-stars t)

;; parenthesis
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; auctex
(use-package tex
	:ensure auctex
  :config
  (with-eval-after-load 'tex
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "PDF Tools"))
	 	
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)))

;; css and other colors
(use-package rainbow-mode
  :ensure t
  :init
    (add-hook 'prog-mode-hook 'rainbow-mode))

;; emms
(use-package emms
	:ensure t)

;; list suggestion
(use-package counsel
  :ensure t
  :after ivy
  :config
    (counsel-mode))

(use-package ivy
  :ensure t
  :config
    (ivy-mode))

(use-package ivy-rich
  :after ivy
  :ensure t
  :init
    (ivy-rich-mode 1))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (which-key-mode))

(provide 'essentials)
;;; essentials.el ends here
