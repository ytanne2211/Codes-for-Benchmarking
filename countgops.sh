cd /mnt/d/Splits
#Count how many group of pictures

for i in {1..100};do
	if [[ -d $i ]];then
		cd ./$i
		count=0
		for f in *.ts;do
			if [[ -f $f ]];then
				$[count++]
			fi
		done
		echo count
	fi
done
