#!/bin/sh

#Directory comparison script
#This script compares the md5sum of every file in the specified directories. 
#this is the script you should run.


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
                                        




if [ "$#" -ne "2" ] ; then
    echo "Compares every file in two directories to check they are identical."
    echo "Usage:"
    echo "    check_copy.sh dir1 dir2"
    echo "    Where dir1 and dir2 are the two directories you wish to compare"
    exit 1
fi

find "$1" -type f -exec ./check_copy2.sh {} "$1" "$2" \;

