;;; package --- rss reader
;;; Commentary:
;;; Code:

(use-package elfeed
             :ensure t
 						 :bind ("C-c r" . 'elfeed)
             :config
             (setq elfeed-feeds (quote (
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
                                   ("https://morss.it/https://gizmodo.com/tag/diy/rss")
                                   ("https://morss.it/feeds.mashable.com/mashable/entertainment")
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
                                   ("https://morss.it/https://medium.com/feed/tag/software-development")
                                   ("https://morss.it/https://medium.com/feed/tag/technology")
                                   ("https://morss.it/https://hnrss.org/newest")
                                   ("https://morss.it/https://hnrss.org/frontpage")
                                   ("https://morss.it/https://medium.com/feed/tag/self-improvement")
                                   ))))
(provide 'rss)
;;; rss.el ends here
