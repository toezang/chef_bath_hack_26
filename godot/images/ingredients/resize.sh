#!/bin/bash
for f in *.png; do
	ffmpeg -i "$f" -vf "scale=iw*0.6:ih*0.6" -update 1 -y tmp_resize.png && mv tmp_resize.png "$f"
done
