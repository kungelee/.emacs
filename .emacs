;; my emacs config fiele
(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")
(add-to-list 'load-path "~/") ; add smart-align to your load-path
(require 'smart-align)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(package-selected-packages
   '(rainbow-delimiters swiper fzf nyan-mode ace-window ace-jump-mode company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "outline" :slant normal :weight normal :height 102 :width normal)))))

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-hook 'after-init-hook 'global-company-mode)

(global-linum-mode t)

(add-to-list 'load-path "~/.emacs.d/elpa/ace-jump-mode-20140616.815/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)


(load-theme 'monokai t)

;;设置背景半透明效果 0.0 ~ 1.0
(set-frame-parameter nil 'alpha  0.9)


;;for org mode
(add-to-list 'load-path "~/test/")
`(require 'org-superstar)
(add-hook 'org-mode-hook 'org-superstar)


;;ace window
(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
;;(setq aw-background t)


;; nyan cat mode
(nyan-mode 1)

;; menu, tool, scroll,
(tool-bar-mode -1);

(menu-bar-mode -1);

(scroll-bar-mode -1)


;;高亮括号匹配
(show-paren-mode 1)

; ;; swiper begin
; (ivy-mode)
; (setq ivy-use-virtual-buffers t)
; (setq enable-recursive-minibuffers t)
; ;; enable this if you want `swiper' to use it
; ;; (setq search-default-mode #'char-fold-to-regexp)
; (global-set-key "\C-s" 'swiper)
; (global-set-key (kbd "C-c C-r") 'ivy-resume)
; (global-set-key (kbd "<f6>") 'ivy-resume)
; (global-set-key (kbd "M-x") 'counsel-M-x)
; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
; (global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
; (global-set-key (kbd "<f1> l") 'counsel-find-library)
; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
; (global-set-key (kbd "C-c g") 'counsel-git)
; (global-set-key (kbd "C-c j") 'counsel-git-grep)
; (global-set-key (kbd "C-c k") 'counsel-ag)
; (global-set-key (kbd "C-x l") 'counsel-locate)
; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

; ;; swiper end

;; 彩虹括号
(rainbow-delimiters-mode 1)

