;;; https://nullprogram.com/blog/2013/02/06/
;;; ~/test/my-mode.el
;;;
;;; (add-to-list 'load-path "~/test")
;;; (require 'my-mode)
;;;
;;; (global-set-key (kbd "<f6>") 'kunge/swap-two-window)
;;;



;;duplicate n lines
(defun duplicate-line (n)
  "duplicate n lines"
  (interactive "nEnter numer n for duplicate: ")
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (dotimes (i n)
    (open-line 1)
    (next-line)
    (yank)))


;; C-d for duplicate current line
(defun duplicate ()
  (interactive)
  (duplicate-line 1))

;;swip two windows
(defun kunge/swap-two-window ()
  (interactive)
  (let* ((this (selected-window))
         (other (next-window))
         (this-buffer (window-buffer this))
         (other-buffer (window-buffer other)))
    (set-window-buffer this other-buffer)
    (set-window-buffer other this-buffer)))
                    


(define-minor-mode my-mode
  "define my-mode"
  :lighter " my"
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "<f5>") 'duplicate-line)
            (define-key map (kbd "C-d") 'duplicate)
;            (define-key map (kbd "<f6>") 'kunge/swap-two-window)
            map))
            
;;  ---------------------------------set background image start---------------------------------
;;  --------------------------------- 2023年5月14日17:01:11--------------------------------------
;; set background alpha
(set-frame-parameter nil 'alpha 0.8)

;; disable tool bar and menu bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; set default path for backgound images
(defconst background-image-path "d:/background-image")

;; set last image
(defvar last-image nil)

;; change background image
(defun change-background-image ()
  (interactive)
  (let* ((images (cddr (directory-files background-image-path t))) ;; 图片列表
	 (images-length (length images))                           ;; 列表长度
	 (image-position (mod (random) images-length))             ;; 随机位置
	 (new-image (nth image-position images)))                  ;; 初始化图片
    (catch 'break
	  (while t
	    (if (equal new-image last-image)                       ;; 判断是否是上次设置过的图片
		(setq new-image (nth (mod (random) images-length) images))
		(throw 'break new-image))))
    (wallpaper-set new-image)
    ;; 保存最后一次设置的图片
    (setq last-image new-image)))
  
(change-background-image)

;; binding shortcut key
(global-set-key (kbd "C-c b") 'change-background-image)

;;  ---------------------------------set background image end --------------------------------

;;(define-minor-mode my-mode
;;  "Get your foos in the right places."
;;  :lighter " foo"
;;  :keymap (let ((map (make-sparse-keymap)))
;;            (define-key map (kbd "C-c f") 'insert-foo)
;;            map))
;;  

(provide 'my-mode)
