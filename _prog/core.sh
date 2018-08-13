##### Core

#https://stackoverflow.com/questions/20657432/rename-multiple-files-but-only-rename-part-of-the-filename-in-bash
_rename() {
	local bareword
	bareword="$1"
	shift
	
	local replacement
	replacement="$1"
	shift
	
	local currentFile
	
	for currentFile in "$@"
	do
		mv "$currentFile" "${currentFile/$bareword/$replacement}"
	done
}

_convert_pdf() {
	local imageName
	imageName=checks
	[[ "$3" != "" ]] && imageName="$3"
	
	local pdfDensity
	pdfDensity=144
	[[ "$4" != "" ]] && pdfDensity="$4"
	
	rm "$2"/*.png > /dev/null 2>&1
	convert -density "$pdfDensity" "$1" -gamma 1.6 "$2"/"$imageName"-%03d.png
}

_makeblank() {
	convert -size "$width"x"$height" xc:black "$1"
}

_pad_directory() {
	local padDirectory="$1"
	
	local padDirectoryFileCount
	local padDirectoryFileCountZeroPad
	local padDirectoryFileCountRemainder
	
	mkdir -p "$padDirectory"
	
	rm "$padDirectory"/zblack*.png > /dev/null 2>&1
	padDirectoryFileCount=$(ls -1 "$padDirectory" | wc -l)
	padDirectoryFileCountZeroPad=$(printf %02d "$padDirectoryFileCount")
	let "padDirectoryFileCountRemainder = ""$padDirectoryFileCount"" % 10"
	
	local padDirectoryFileCountZeroPad
	
	# || [[ "$padDirectoryFileCount" -lt 1 ]]
	while [[ "$padDirectoryFileCountRemainder" -gt 0 ]]
	do
		_makeblank "$padDirectory"/zblack-"$padDirectoryFileCountZeroPad".png
		
		padDirectoryFileCount=$(ls -1 "$padDirectory" | wc -l)
		padDirectoryFileCountZeroPad=$(printf %02d "$padDirectoryFileCount")
		let "padDirectoryFileCountRemainder = ""$padDirectoryFileCount"" % 10"
	done
	
	return 0
}

_dup() {
	rm "$1"-dup/*.png > /dev/null 2>&1
	[[ -e "$1"-dup ]] && [[ -e "$1" ]] && rmdir "$1"
	! [[ -e "$1" ]] && return 0
	mv "$1" "$1"-dup
	
	return 0
}

_na() {
	[[ -e "$1"-na ]] && [[ -e "$1" ]] && rmdir "$1"
	! [[ -e "$1" ]] && return 0
	mv "$1" "$1"-na
	rm "$1"-na/*.png > /dev/null 2>&1
	
	return 0
}

_guide_directory() {
	mkdir -p "$1"
	rm "$1"/*.png > /dev/null 2>&1
}


_refresh_anchors() {
	cp "$scriptAbsoluteFolder"/_anchor "$scriptAbsoluteFolder"/_guide
}
