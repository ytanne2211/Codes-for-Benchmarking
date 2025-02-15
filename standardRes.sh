cd /home/anne/Standard
#forResolutionExperiment

for file in {1..100};do
	if [[ -d $file ]];then
		cd ./$file
		pwd
		touch resolutionDuration.txt
		echo CONVERSION OF RESOLUTION TO 1920:1080 AND 640:360 FOR STANARD FORMAT CONTAINER IN VM >> resolutionDuration.txt
		for i in {1..20};do
			for f in standardoutput{1..300}.ts;do
				if [[ -f $f ]];then
					echo             >> resolutionDuration.txt
					( time docker run -it -v $(pwd):/home/anne/Standard/$file bareffmpeg -y -i /home/anne/Standard/$file/$f -vf scale=1920:1080 /home/anne/Standard/$file/1920res$f )|& grep -e real -e user -e sys >> resolutionDuration.txt
					echo GOP $f 1920:1080 >> resolutionDuration.txt
					rm 1920res$f
					echo            >> resolutionDuration.txt
					( time docker run -it -v $(pwd):/home/anne/Standard/$file bareffmpeg -y -i /home/anne/Standard/$file/$f -vf scale=640:360 /home/anne/Standard/$file/640res$f ) |& grep -e real -e user -e sys >> resolutionDuration.txt
					echo GOP $f 640:360 >> resolutionDuration.txt
					rm 640res$f
					echo            >> resolutionDuration.txt
				fi
			done
			echo ---------------------------------------------------- >> resolutionDuration.txt
		done
		cd ..
	fi 
done



