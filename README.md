# copy_checker
A script to check that files/directories have copied correctly. I use it to check that things have copied correctly when moving large datasets from one drive to another.

How to use it:

check_copy.sh dir1 dir2

This will compare every file in dir1 with the equivalent file in dir2 and check that the md5sums are the same. It will alert you if files are present in dir1 that aren't in dir2. But if WON'T work the other way around, files existing in dir2 and not dir1 will be ignored.

