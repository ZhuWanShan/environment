;; Set the starting position and width and height of Emacs Window
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 45))
(add-to-list 'default-frame-alist '(width . 175))

;;hightlight current line
;;(global-hl-line-mode 1) 

;;default show line number
(setq linum-format "%4d \u2502 ")
(global-linum-mode t)

;; To get rid of Weird color escape sequences in Emacs.
;; Instruct Emacs to use emacs term-info not system term info
;; http://stackoverflow.com/questions/8918910/weird-character-zsh-in-emacs-terminal
(setq system-uses-terminfo nil)
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; ansi-term
;; (global-set-key "\C-x\C-a" '(lambda ()(interactive)(ansi-term "/bin/zsh")))
;; (global-set-key "\C-x\ a" '(lambda ()(interactive)(ansi-term "/bin/zsh")))
 
;; Prefer utf-8 encoding
(prefer-coding-system 'utf-8)
 
;; Use windmove bindings
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
;;(windmove-default-keybindings 'meta) 
;;(require 'windmove)
;;(windmove-default-keybindings 'super)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)

(set-frame-font "-apple-Fira_Mono-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
 
;; Display continuous lines
(setq-default truncate-lines nil)
;; Do not use tabs for indentation
(setq-default indent-tabs-mode nil)
(global-set-key "\t" (lambda () (interactive) (insert-char 32 2))) ;; [tab] inserts two spaces

(menu-bar-mode -1)

;;turn on bracket match
(show-paren-mode 1) 
 
;; trucate even even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)
 
;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)              
 
(set-cursor-color "red")
 
(setq default-frame-alist
      '((cursor-color . "red")))
 
;; Highlight incremental search
(setq search-highlight t)
(transient-mark-mode t)
 
(global-visual-line-mode 1)
 
(display-time)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;;(scroll-bar-mode nil)
 
;; Enable copy and pasting from clipboard
(setq x-select-enable-clipboard t)
 
(global-set-key [f2] 'comment-region)
(global-set-key [f3] 'uncomment-region)
(global-set-key [f5] 'indent-region)
;;(global-set-key "\C-l" 'end-of-line)
 
(global-set-key "\C-xt" 'select-frame-by-name)
 
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
 
(global-set-key "\C-xy" 'revert-buffer)
 
;; Disable backups
(setq backup-inhibited t)
;;disable auto save
(setq auto-save-default nil)
 
;;some custom functions, stolen for internet
(defun geosoft-forward-word ()
   ;; Move one word forward. Leave the pointer at start of word
   ;; instead of emacs default end of word. Treat _ as part of word
   (interactive)
   (forward-char 1)
   (backward-word 1)
   (forward-word 2)
   (backward-word 1)
   (backward-char 1)
   (cond ((looking-at "_") (forward-char 1) (geosoft-forward-word))
         (t (forward-char 1)))) 
(defun geosoft-backward-word ()
 ;; Move one word backward. Leave the pointer at start of word
 ;; Treat _ as part of word
  (interactive)
  (backward-word 1)
  (backward-char 1)
  (cond ((looking-at "_") (geosoft-backward-word))
        (t (forward-char 1)))) 
 
(global-set-key [C-right] 'geosoft-forward-word)
(global-set-key [C-left] 'geosoft-backward-word)



(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

(global-set-key "\C-ct" 'visit-tags-table)
(global-set-key "\C-cd" 'create-tags)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
(global-set-key (kbd "C-c r")  'rename-file-and-buffer)

;; neo tree
(require 'neotree)
(global-set-key (kbd "C-c n") 'neotree-toggle)

;;ansi delechar
;;(global-set-key (kbd "C-x d") 'delete-backward-char)

;; powerline
;; (require 'powerline)
;; (powerline-default-theme)

;;(load-theme 'idea-darkula t)
(load-theme 'jbeans t)

;; (require 'uniquify)
;; (setq uniquify-buffer-name-style  'reverse)
(projectile-global-mode)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
