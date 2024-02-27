# Introduction 
These bash scripts generate a MKVToolNix compatible chapter text file using MediaInfo metadata from a video file. This can be extracted from the video file directly if you have the MediaInfo CLI tools installed, or from a text file containing a video file's MediaInfo.

# Prerequisites
## convert_chapters.sh
You will need a text file with a video file's MediaInfo metadata that contains chapter information. XML, JSON, etc are not currently supported. 

#### Example MediaInfo File
```
General
Unique ID                                : 123456789AD
Complete name                            : Movie.mkv
Format                                   : Matroska
Format version                           : Version 4
File size                                : 6.05 GiB
Duration                                 : 1 h 32 min
Overall bit rate                         : 8 829 kb/s
Frame rate                               : 23.976 FPS
Writing application                      : mkvmerge v79.0 ('Funeral Pyres') 64-bit
Writing library                          : libebml v1.4.4 + libmatroska v1.7.1

Video
ID                                       : 1
Format                                   : AVC
Format/Info                              : Advanced Video Codec
Format profile                           : High@L4
Format settings                          : CABAC / 4 Ref Frames
Format settings, CABAC                   : Yes
Format settings, Reference frames        : 4 frames
Codec ID                                 : V_MPEG4/ISO/AVC
Duration                                 : 1 h 41 min
Bit rate                                 : 7 591 kb/s
Nominal bit rate                         : 8 000 kb/s
Width                                    : 1 920 pixels
Height                                   : 1 080 pixels
Display aspect ratio                     : 16:9
Frame rate mode                          : Constant
Frame rate                               : 23.976 (24000/1001) FPS
Color space                              : YUV
Chroma subsampling                       : 4:2:0
Bit depth                                : 8 bits
Scan type                                : Progressive
Bits/(Pixel*Frame)                       : 0.153
Stream size                              : 5.38 GiB (89%)
Writing library                          : x264 core 164 r3094 bfc87b7
Encoding settings                        : cabac=1 / ref=4 / deblock=1:-1:-1 / analyse=0x3:0x133 / me=umh / subme=9 / psy=1 / psy_rd=1.00:0.15 / mixed_ref=1 / me_range=16 / chroma_me=1 / trellis=2 / 8x8dct=1 / cqm=0 / deadzone=21,11 / fast_pskip=1 / chroma_qp_offset=-3 / threads=12 / lookahead_threads=1 / sliced_threads=0 / nr=0 / decimate=1 / interlaced=0 / bluray_compat=0 / stitchable=1 / constrained_intra=0 / bframes=3 / b_pyramid=2 / b_adapt=2 / b_bias=0 / direct=3 / weightb=1 / open_gop=0 / weightp=2 / keyint=48 / keyint_min=4 / scenecut=0 / intra_refresh=0 / rc_lookahead=48 / rc=abr / mbtree=1 / bitrate=8000 / ratetol=1.0 / qcomp=0.60 / qpmin=0 / qpmax=69 / qpstep=4 / vbv_maxrate=8800 / vbv_bufsize=16000 / nal_hrd=none / filler=0 / ip_ratio=1.40 / aq=1:1.00
Language                                 : English
Default                                  : Yes
Forced                                   : No
Color range                              : Limited
Color primaries                          : BT.709
Transfer characteristics                 : BT.709
Matrix coefficients                      : BT.709

Audio
ID                                       : 2
Format                                   : E-AC-3 JOC
Format/Info                              : Enhanced AC-3 with Joint Object Coding
Commercial name                          : Dolby Digital Plus with Dolby Atmos
Codec ID                                 : A_EAC3
Duration                                 : 1 h 41 min
Bit rate mode                            : Constant
Bit rate                                 : 768 kb/s
Channel(s)                               : 6 channels
Channel layout                           : L R C LFE Ls Rs
Sampling rate                            : 48.0 kHz
Frame rate                               : 31.250 FPS (1536 SPF)
Compression mode                         : Lossy
Stream size                              : 558 MiB (9%)
Language                                 : English (US)
Service kind                             : Complete Main
Default                                  : Yes
Forced                                   : No
Complexity index                         : 16
Number of dynamic objects                : 15
Bed channel count                        : 1 channel
Bed channel configuration                : LFE

Menu
00:00:00.000                             : en:Chapter 01
00:07:19.939                             : en:Chapter 02
00:15:51.534                             : en:Chapter 03
00:18:49.421                             : en:Chapter 04
00:24:38.978                             : en:Chapter 05
00:32:00.837                             : en:Chapter 06
00:36:53.129                             : en:Chapter 07
00:40:46.571                             : en:Chapter 08
00:46:14.858                             : en:Chapter 09
00:48:57.896                             : en:Chapter 10
00:54:32.981                             : en:Chapter 11
01:01:27.187                             : en:Chapter 12
01:05:57.540                             : en:Chapter 13
01:12:26.429                             : en:Chapter 14
01:18:12.901                             : en:Chapter 15
01:21:45.780                             : en:Chapter 16
01:25:17.283                             : en:Chapter 17
01:29:52.183                             : en:Chapter 18
01:34:42.640                             : en:Chapter 19
01:37:32.977                             : en:Chapter 20
```

## convert_chapters_mediainfo_cli.sh
You need to have the MediaInfo CLI tool installed prior to using the script. The CLI tool can be downloaded from [Mediaarea.net](https://mediaarea.net) or a toolset pack such as [Homebrew](https://brew.sh) or [MacPorts](http://macports.org).

# How To Use

## convert_chapters.sh
Replace $input_file with your MediaInfo text file and $output_file withe destination path and filename you would like to use for your chapter text file.
```
./convert_chapters.sh $input_file $output_file
```
#### Example
```
./convert_chapters.sh ~/Downloads/Movie_MediaInfo.txt ~/Downloads/Movie_Chapters.txt
```
## convert_chapters_mediainfo_cli.sh
Replace $input_file with your movie file and $output_file withe destination path and filename you would like to use for your chapter text file.
```
./convert_chapters_mediainfo_cli.sh $input_file $output_file
```
#### Example
```
./convert_chapters.sh ~/Downloads/Movie.mkv ~/Downloads/Movie_Chapters.txt
```
# Output Format
These scripts will output a MKVToolNix compatible chapter text file in the following format:
```
CHAPTER1=00:00:00.000                             
CHAPTER1NAME=Chapter 01
CHAPTER2=00:07:19.939                             
CHAPTER2NAME=Chapter 02
CHAPTER3=00:15:51.534                             
CHAPTER3NAME=Chapter 03
CHAPTER4=00:18:49.421                             
CHAPTER4NAME=Chapter 04
CHAPTER5=00:24:38.978                             
CHAPTER5NAME=Chapter 05
CHAPTER6=00:32:00.837                             
CHAPTER6NAME=Chapter 06
CHAPTER7=00:36:53.129   
```
If the MediaInfo includes actual chapter names, they will be included. 
