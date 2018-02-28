#!/bin/sh

#Directory comparison script

#You probably don't want to run this script directly, run check_copy.sh instead
#compares md5sums of a single file
#takes a filename from the current directory as the first argument
#takes the directory to compare to as the second

#Copyright Colin Sauze 2018

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.


if [ "$#" != "3" ] ; then
    echo "Usage:"
    echo "	check_copy2.sh <filename> <dir1> <dir2>"
    echo "	filename = the full path of the file to check"
    echo "	dir1 = the first top level directory being compared, filename should be inside this directory"
    echo "	dir2 = the second top level directory being compared"
    exit 1
fi

dirname=$2


filename=`echo $1 | sed "s|//|/|" | sed "s|$dirname||"`


file2=`ls "$3/$filename"`

echo -e "Comparing:\n$1\nand\n$file2\n"

sum1=`md5sum "$1" | awk '{print $1}'`
sum2=`md5sum "$file2" | awk '{print $1}'`

if [ "$sum1" != "$sum2" ] ; then
    echo "**** Checksums differ for file $1 and $file2. $1 = $sum1, $file2 = $sum2 ****"
    exit 2
fi
