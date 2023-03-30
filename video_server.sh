# The D90 Live View is 640x426 at around 24fps
# The bottom 3 rows are magenta
# If we crop the 3 top and bottom rows we get 640x420

port=5000
host=192.168.2.1  # <- Set **client** IP here

gphoto2 --capture-movie --stdout | gst-launch-1.0 -v -e \
  fdsrc ! \
  image/jpeg,framerate='(fraction)'24/1,width=640,height=426 ! \
  jpegdec ! \
  videocrop top=3 bottom=3 ! \
  queue ! \
  x264enc pass=qual quantizer=35 tune=zerolatency ! \
  rtph264pay ! \
  udpsink host=${host} port=${port}