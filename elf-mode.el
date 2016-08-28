(defvar-local elf-mode nil)

;; TODO check existence of progs first

;;;###autoload
(defun elf-mode ()
  (interactive)
  (let ((inhibit-read-only t))
    (if elf-mode
        (progn
          (delete-region (point-min) (point-max))
          (insert-file-contents (buffer-file-name))
          (setq elf-mode nil))
      (setq elf-mode t)
      (delete-region (point-min) (point-max))
      (insert (shell-command-to-string
               (format "readelf --syms %s | c++filt" (buffer-file-name)))))
    (set-buffer-modified-p nil)
    (read-only-mode 1)))
