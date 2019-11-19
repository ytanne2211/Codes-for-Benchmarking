cd /mnt/d/anne/BaremetalBenchmarking

for i in {1..100}; do
	if [[ -d $i ]]; then
		cd $i
		touch datarealFrame.txt
		grep 'real' framerateDuration.txt >>datarealFrame.txt
	fi
	cd ..
done

