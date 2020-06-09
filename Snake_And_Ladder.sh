#!/bin/bash -x

#CONSTANTS

START_POSITION=0
WINNING_POSITION=100
LADDER=1
SNAKE=2

#VARIABLES

player1RollCount=0
player2RollCount=0
declare -a player1Positions
declare -a player2Positions

#FUNCTION TO GENERATE OUTPUT OF THE EVENT ON BOARD AFTER DIE ROLL

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

#FUNCTION TO EVALUATE THE WINNER IN BETWEEN TWO PLAYERS

function game()
{
	player1CurrentPosition=$START_POSITION
	player2CurrentPosition=$START_POSITION
	while ((player1CurrentPosition<WINNING_POSITION && player2CurrentPosition<WINNING_POSITION ))
	do

#PLAYER 1 DIE ROLL
		
		dieResult=$(((RANDOM%6)+1));
		((player1RollCount++))
		eventResult=$LADDER

		while (( eventResult==LADDER ))
		do
			eventResult=$((RANDOM%3))
			playerCurrentPosition=$player1CurrentPosition
			player1CurrentPosition=$(eventCheck $eventResult)
			if (( player1CurrentPosition<START_POSITION ))
			then
				player1CurrentPosition=$START_POSITION

			elif (( player1CurrentPosition>WINNING_POSITION ))
			then
				player1CurrentPosition=$(( player1CurrentPosition - dieResult ))
			fi
		done
		player1Positions[$player1RollCount]=$player1CurrentPosition

#CONDITION CHECK FOR THE WINNING CASE OF PLAYER 1 IF FALSE THEN ROLL DIE FOR PLAYER 2

		if ((player1Positions[$player1RollCount] != WINNING_POSITION))
		then
#PLAYER 2 DIE ROLL
			dieResult=$(((RANDOM%6)+1));
			((player2RollCount++))
			eventResult=$LADDER
			while (( eventResult==LADDER ))
			do
				eventResult=$((RANDOM%3))
				playerCurrentPosition=$player2CurrentPosition
				player2CurrentPosition=$(eventCheck $eventResult)
				if (( player2CurrentPosition<START_POSITION ))
				then
					player2CurrentPosition=$START_POSITION
				elif (( player2CurrentPosition>WINNING_POSITION ))
				then
					player2CurrentPosition=$(( player2CurrentPosition - dieResult ))
				fi
			done
			player2Positions[$player2RollCount]=$player2CurrentPosition
		fi
	done
	}

echo "********		Welcome to Snake and Ladder Game		********"

game;

#DISPLAY OF THE WINNER

if (( player2Positions[$player2RollCount]== WINNING_POSITION ))
then
	echo "Player 2 won in $player2RollCount rolls"
else
	echo "Player 1 won in $player1RollCount rolls"
fi
