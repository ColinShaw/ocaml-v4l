# __OCaml V4L Interface__

This is simplistic code for an OCaml interface to V4L for frame capture.
It is based specifically around the idea of grayscale capture one frame 
at a time. You can build it either as an example or as a library.  You will
obviously need to have V4L and its headers installed.

There are some assumptions made about the capture device and the operations
it supports.  If you are not using a capture device that supports buffered
capture through memory mapping and YUYV as a format, then you will have to 
alter this code.
