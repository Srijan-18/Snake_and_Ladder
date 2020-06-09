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

		dieResult=$(((RANDOM%6)+1))
		eventResult=$((RANDOM%3))
		playerCurrentPosition=$(eventCheck $eventResult)
		if (( playerCurrentPosition<START_POSITION ))
		then
			playerCurrentPosition=$START_POSITION
		elif (( playerCurrentPosition>WINNING_POSITION ))
		then
			playerCurrentPosition=$(( playerCurrentPosition - dieResult ))
		fi
	done
	echo $playerCurrentPosition
}
player1CurrentPosition=$(game)
