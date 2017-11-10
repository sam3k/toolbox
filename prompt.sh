read -p "Is this a good question (y/n)? " answer
case ${answer:0:1} in
    y|Y )
        echo Yes
				read -p "What about this question (y/n)? " answer2
				case ${answer2:0:1} in
						y|Y )
								echo Also good
						;;
						* )
								echo Meh
						;;
				esac
    ;;
    * )
        echo No
    ;;
esac
