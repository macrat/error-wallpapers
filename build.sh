for size in 1366x768 1440x900 1920x1080 2304x1440 3200x1800 3840x2160; do
	mkdir light-${size}
	mkdir dark-${size}

	for file in `ls svg/*.svg`; do
		inkscape --export-background=white --export-width=${size%%x*} --export-height=${size##*x} --export-png=light-${size}/$(basename ${file%.*}).png $file

		convert -alpha Remove -negate light-${size}/$(basename ${file%.*}).png dark-${size}/$(basename ${file%.*}).png
	done
done
