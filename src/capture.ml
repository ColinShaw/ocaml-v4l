open Bigarray

type video_status = | Success 
                    | Open_Error 
                    | IOCTL_Error 
                    | Select_Error 
                    | MMAP_Error 
                    | Close_Error

type capture_size = { capture_width: int; capture_height: int }

type ba_int = (int, int8_unsigned_elt, c_layout) Array1.t

external init_video : capture_size -> string -> video_status = "initialize_video"
external capture_video : ba_int -> video_status = "capture_video"
external close_video : unit -> video_status = "close_video"

let make_frame frame_size = 
    let size = frame_size.capture_width * frame_size.capture_height
    in 
    Array1.create int8_unsigned c_layout size
