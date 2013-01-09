#!/bin/bash

INPUT=
OUTPUT=
TYPE=

usage()
{
cat << EOF
usage: $0 options

Convert mp3 wave form to scalar vector graphic (SVG).

OPTIONS:
  -?	Show this message
  -i	Input File
  -o	Output File (optional)
  -t	Type (standard|feathered|skeleton|crisp) (optional)

EOF
}

while getopts "i:o:t:" OPTION
do
	case $OPTION in
		i)
			INPUT=$OPTARG
			;;
		o)
			OUTPUT=$OPTARG
			;;
		t)
			TYPE=$OPTARG
			;;
		?)
			usage
			exit 1
			;;
	esac
done

if [ -z "$INPUT" ]; then
	usage
	exit 1
fi

if [ -z "$OUTPUT" ]; then
	OUTPUT=$INPUT.svg
fi

if [ -z "$TYPE" ]; then
	TYPE=standard
fi

echo Converting MP3 to WAV
sox "$INPUT" -c 1 -r 8000 -b 8 /tmp/000000.wav
echo Converting WAV to PNG
wav2png -b ffffffff -f 000000ff /tmp/000000.wav -o /tmp/000000.png
echo Converting PNG to GIF
convert /tmp/000000.png /tmp/000000.gif

echo Converting GIF to svg
case $TYPE in
	standard)
		autotrace /tmp/000000.gif -background-color FFFFFF -dpi 1000000 -input-format GIF -output-format svg -output-file /tmp/000000.svg
		;;
	feathered)
		autotrace /tmp/000000.gif -background-color FFFFFF -remove-adjacent-corners -dpi 1000000 -input-format GIF -output-format svg -output-file /tmp/000000.svg
		;;
	skeleton)
		autotrace /tmp/000000.gif -centerline -background-color FFFFFF -dpi 1000000 -input-format GIF -output-format svg -output-file /tmp/000000.svg
		;;
	crisp)
		autotrace /tmp/000000.gif -filter-iterations 9 -background-color FFFFFF -dpi 1000000 -input-format GIF -output-format svg -output-file /tmp/000000.svg
		;;
esac

mv "/tmp/000000.svg" "./$OUTPUT"

echo Saved: $OUTPUT
