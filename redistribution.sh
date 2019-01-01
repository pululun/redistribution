#!/bin/bash
arrayFileExtension=(.exe .MP4 .mp4 .avi .mkv .wmv .mp3 .flac .pdf .iso .jpg .rar .zip)
arrayPathExtension=(soft/ video/ video/ video/ video/ video/ audio/ audio/ book/ ISO/ images/ archives/ archives/)
lengthArrayFileExtension=${#arrayFileExtension[*]}
lengthArrayPathExtension=${#arrayPathExtension[*]}
if [[ $lengthArrayFileExtension == $lengthArrayPathExtension ]]
then
	if [[ "$1" == "first" ]]
	then
	mkdir -p ${arrayPathExtension[@]}
	fi
	findFiles () {
		temp=$(ls -1 | fgrep "$1")
		if [[ $temp != "" ]]
		then
		mv *$1 $2
		echo "Файлы $1 перемещены в каталог $2"
		else 
		echo "Не найдены файлы $1 для перемещения"
		fi
		}
	for ((i=0; i < $lengthArrayFileExtension; i++))
	do
	findFiles "${arrayFileExtension[$i]}" "${arrayPathExtension[$i]}"
	done
else
	echo "Ошибка: для одного или нескольких расширений файлов не указан каталог!"
fi
