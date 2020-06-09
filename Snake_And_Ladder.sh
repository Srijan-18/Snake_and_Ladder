#!/bin/bash -x

echo "********		Welcome to Snake and Ladder Game		********"
START_POSITION=0
LADDER=1
SNAKE=2

function eventCheck()
{

	case in $1

		$LADDER)
			player1CurrentPosition=$((player1CurrentPosition + diceResult))
		;;

		$SNAKE)
			player1CurrentPosition=$((player1CurrentPosition - diceResult))
		;;

		*)
		#default is no play condition
		;;
	esac
	echo $player1CurrentPosition
}

player1CurrentPosition=$START_POSITION
dieResult=$(((RANDOM%6)+1))
eventResult=$((RANDOM%3))
player1CurrentPosition=$(eventCheck $eventResult)

