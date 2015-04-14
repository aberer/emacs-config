(setq  default-mode-line-format 
       '("%e"
         (:eval
          (if
              (display-graphic-p)
              #(" " 0 1
                (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))
            #("-" 0 1
              (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
         mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification
         #("   " 0 3
           (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))
         mode-line-position
         (vc-mode vc-mode)
         #("  " 0 2
           (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))
         mode-line-modes
         (which-func-mode
          ("" which-func-format
           #(" " 0 1
             (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
         (global-mode-string
          ("" global-mode-string
           #(" " 0 1
             (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
         (:eval
          (unless
              (display-graphic-p)
            #("-%-" 0 3
              (help-echo "mouse-1: Select (drag to resize)\nmouse-2: Make current window occupy the whole frame\nmouse-3: Remove current window from display"))))
         "[Mail:"   
         (:eval (shell-command-to-string "echo -n $(mu find m:/andre.aberer@googlemail.com/INBOX g:unread OR m:/aberer.io/INBOX g:unread   2>/dev/null | wc -l )") )
         "/"
         (:eval (shell-command-to-string "echo -n $(mu find m:/thirsty.dreamer@gmail.com/INBOX g:unread OR m:/andre.aberer@googlemail.com/Gmail.Bin g:unread OR m:/aberer.io/Server g:unread OR  m:/aberer.io/Info g:unread 2>/dev/null | wc -l )") )
         "/"
         (:eval (shell-command-to-string "echo -n $(mu find m:/aberer.io/rss g:unread 2>/dev/null | wc -l )") )
         ;; "/" 
         ;; (:eval (shell-command-to-string "echo -n $(mu find m:/system g:unread 2>/dev/null | wc -l )") )
         "]" )
       )
