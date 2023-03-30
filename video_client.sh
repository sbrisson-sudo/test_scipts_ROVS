port=5000

gst-launch-1.0 -e -v udpsrc port=${port} ! \
  application/x-rtp, media=video, encoding-name=H264 ! \
  rtph264depay ! \
  queue ! \
  avdec_h264 ! \
  autovideosink sync=false