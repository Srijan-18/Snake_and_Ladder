#!/bin/bash -x

echo "********		Welcome to Snake and Ladder Game		********"
START_POSITION=0
WINNING_POSITION=100
LADDER=1
SNAKE=2

function eventCheck()
{

	case $1 in

		$LADDER)
			player1CurrentPosition=$((player1CurrentPosition + dieResult))
		;;

		$SNAKE)
			player1CurrentPosition=$((player1CurrentPosition - dieResult))
		;;

		*)
		#default is no play condition
		;;
	esac
	echo $player1CurrentPosition
}

player1CurrentPosition=$START_POSITION
while ((player1CurrentPosition<WINNING_POSITION))
do

	dieResult=$(((RANDOM%6)+1))
	eventResult=$((RANDOM%3))
	player1CurrentPosition=$(eventCheck $eventResult)
	if (( player1CurrentPosition<0 ))
	then
		player1CurrentPosition=$START_POSITION
	fi
done
