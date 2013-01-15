# audio2svg #
## Audio to SVG ##

This is a commandline tool for converting an audio files into an SVG file for viewing.  The SVG created isn't really a pure waveform it is more of an interpretation, you couldn't take the SVG and convert it back to the MP3 and get the exact tune.  I created it so I could make vector graphics compatible with laser cutting.  Feel free to use it or fork it, please follow the CC license.

### Requirements ###
* SoX - Also known as Sound eXchange. Translates sound samples between different file formats, and optionally applies various sound effects. SoX is intended as the Swiss Army knife of sound processing tools. It doesn't do anything very well, but sooner or later it comes in very handy.
    http://sox.sourceforge.net/
* ImageMagick - ImageMagick is a software suite to create, edit, compose, or convert bitmap images.
    http://www.imagemagick.org/script/index.php
* Autotrace - The aim of the AutoTrace project is the development of a freely available application with a functionality similar to CorelTrace or Adobe Streamline.
    http://autotrace.sourceforge.net/
* wav2png - Create waveform pngs out of audio files.
    https://github.com/beschulz/wav2png
    * Requires *boost*, *png++*, and *libsndfile* which you can install with brew or MacPorts.

### Operating Systems ###

* Linux - Install SoX/ImageMagick/AutoTrace with your package manager.
* OSX - Install MacPorts or Brew, then install SoX/ImageMagick/AutoTrace with that.
* Windows - May work with CYGWIN, I haven't tested it.

### Install ###

I usually put it in ~/bin/ and add that to my PATH.

### Usage ###

    audio2svg.sh -?

Shows help.

    audio2svg.sh -i somefile.mp3

Outputs somefile.mp3.svg

    audio2svg.sh -i somefile.mp3 -o somefile.svg

Outputs somefile.svg

    audio2svg.sh -i somefile.mp3 -t standard
    audio2svg.sh -i somefile.mp3 -t feathered
    audio2svg.sh -i somefile.mp3 -t skeleton
    audio2svg.sh -i somefile.mp3 -t crisp
    
Uses one of my pre-defined filters for the autotrace of the GIF generated from the WAV form.  You can add types starting at line 64, just follow the format I have and read the autotrace man page.

