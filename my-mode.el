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
            


;;(define-minor-mode my-mode
;;  "Get your foos in the right places."
;;  :lighter " foo"
;;  :keymap (let ((map (make-sparse-keymap)))
;;            (define-key map (kbd "C-c f") 'insert-foo)
;;            map))
;;  

(provide 'my-mode)