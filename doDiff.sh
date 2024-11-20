dir1=~/Documents/MyFiles/development
dir2=~/Documents/MyFiles/uat
dir3=~/Documents/MyFiles/diff
count=0
for file in $dir1/*.cls; do
    if [ -f "$file" ]; then
        f=`basename $file`
        echo -n -e "                                                         "
        echo -n -e "\rcomparing: $f"
        if [ -f "$dir2/$f" ]; then
            diff $dir1/$f $dir2/$f >$dir3/$f.txt 2>&1
            count=$((count + 2))
        fi
    fi
done
echo -n -e "\r$count file(s) compared."
echo
