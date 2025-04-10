#!/bin/bash
output_dir="_#!/bin/bash
output_dir="./_bin"

# Check if a file is provided
if [ $# -ne 1 ]; then
	  echo "Usage: $0 <path-to-chd-file>"
	    exit 1
	    fi
	    
	    # Check if the input CHD file exists
	    input_chd="$1"
	    if [ ! -f "$input_chd" ]; then
		      echo "Error: File '$input_chd' does not exist."
		        exit 1
			fi
			
			# Extract the base name (without extension) from the input CHD file
			base_name=$(basename "$input_chd" .chd)
			
			# Define output filenames
			cue_file="${base_name}.cue"
			bin_file="${base_name}.bin"
			
			# Convert CHD to BIN and CUE using chdman
			echo "Converting $input_chd to $cue_file and $bin_file..."
			#chdman extractcd "$input_chd" -o "$bin_file"
			mkdir "$output_dir/$base_name"
			chdman extractcd -i "$input_chd" -o "$output_dir/$base_name/$cue_file" -ob "$output_dir/$base_name/$bin_file"bin"

# Check if a file is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <path-to-chd-file>"
  exit 1
fi

# Check if the input CHD file exists
input_chd="$1"
if [ ! -f "$input_chd" ]; then
  echo "Error: File '$input_chd' does not exist."
  exit 1
fi

# Extract the base name (without extension) from the input CHD file
base_name=$(basename "$input_chd" .chd)

# Define output filenames
cue_file="${base_name}.cue"
bin_file="${base_name}.bin"

# Convert CHD to BIN and CUE using chdman
echo "Converting $input_chd to $cue_file and $bin_file..."
#chdman extractcd "$input_chd" -o "$bin_file"
mkdir "$output_dir/$base_name"
chdman extractcd -i "$input_chd" -o "$output_dir/$base_name/$cue_file" -ob "$output_dir/$base_name/$bin_file"
