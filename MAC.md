#Config Mac or use Mac

### creating bootable usb drives (to boot on mac)

1. download image
2. convert image to UDRW format
```
$ hdiutil convert -format UDRW -o destination_file.img source_file.iso
```
3. disk dump new converted image
```
$ dd if=destination_file.img.dmg of=/dev/disk2 bs=1m
```
