
- `sudo vgextend vg_name /dev/sdc1`
- `sudo lvextend -L+SIZE lv_name`
- `sudo resize2fs /dev/mapper/vg_name-lv_name`