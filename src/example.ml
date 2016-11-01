open Capture

let fsize = { capture_width = 160; capture_height = 120 }
let video = init_video fsize "/dev/video1"
let frame = make_frame fsize

let () = 
    while true do
        ignore (capture_video frame)
    done
