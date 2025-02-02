#!/bin/bash

inputDir=$1
outDir=$2

# Check if ffprobe is available
command -v ffprobe >/dev/null 2>&1 || { echo "ffprobe not found, please install ffmpeg"; exit 1; }

# Loop through all video files in the current directory
for video in $inputDir/*.{mp4,mkv,avi,flv,mov,webm}; do
    # Check if the file exists (in case no video files match)
    if [[ -f "$video" ]]; then
        # Get the resolution using ffprobe
        resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$video")
        
        # Extract width and height (resolution)
        width=$(echo $resolution | cut -d'x' -f1)
        height=$(echo $resolution | cut -d'x' -f2)

        # Create the resolution folder if it doesn't exist
        folder="${width}x${height}"
        if [ ! -d "$outDir/$folder" ]; then
            mkdir -p "$outDir/$folder"
        fi

        # Move the video file into the resolution folder
        mv "$video" "$outDir/$folder/"
        echo "Moved $video to $outDir/$folder"
    fi
done

echo "Video sorting complete!"
