(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(add-to-list 'load-path "~/.emacs.d/custom")

;; load customized
(load "00common-setup.el")
;;(load "01ruby.el")
;;(load "03scala.el")
;;(load "02ansi-term.el")
(load "04python.el")
(load "05orgmode.el")
;;(put 'upcase-region 'disabled nil)

