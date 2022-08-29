;; 找到window, 根据window取得buffer
;; 根据window设置buffer
(defun swap-two-window ()
         (interactive)
         (let* ((this (selected-window))
                (other (next-window))
                (this-buffer (window-buffer this))
                (other-buffer (window-buffer other)))
           (set-window-buffer other this-buffer)
           (set-window-buffer this other-buffer)))
