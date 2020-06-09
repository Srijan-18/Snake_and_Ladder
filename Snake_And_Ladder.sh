
echo "********		Welcome to Snake and Ladder Game		********"
START_POSITION=0
WINNING_POSITION=100
LADDER=1
SNAKE=2
rollCount=0
declare -a playerPositions
function eventCheck()
{

	case $1 in

		$LADDER)
			playerCurrentPosition=$((playerCurrentPosition + dieResult))
		;;

		$SNAKE)
			playerCurrentPosition=$((playerCurrentPosition - dieResult))
		;;

		*)
		#default is no play condition
		;;
	esac
	echo $playerCurrentPosition
}


function game()
{
	playerCurrentPosition=$START_POSITION
	while ((playerCurrentPosition<WINNING_POSITION))
	do

		dieResult=$(((RANDOM%6)+1));
		((rollCount++))
		eventResult=$((RANDOM%3))
		playerCurrentPosition=$(eventCheck $eventResult)
		if (( playerCurrentPosition<START_POSITION ))
		then
			playerCurrentPosition=$START_POSITION
		elif (( playerCurrentPosition>WINNING_POSITION ))
		then
			playerCurrentPosition=$(( playerCurrentPosition - dieResult ))
		fi
		playerPositions[$rollCount]=$playerCurrentPosition
	done
	}
game;
echo "Number of Rolls: $rollCount "
for (( counter=1;counter<=rollCount;counter++ ))
do
	echo "Roll$counter:  ${playerPositions[$counter]}"
done
