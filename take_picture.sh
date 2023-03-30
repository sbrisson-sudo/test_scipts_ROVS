id_prise=$1
out_dir=""
user=""
gphoto2 --capture-image-and-download --filename ${id_prise}.%C
scp ${id_prise}.* ${user}@192.168.2.1:${out_dir}
