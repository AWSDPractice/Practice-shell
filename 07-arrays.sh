#1/bin/bash

MOVIES=("bahubali" "chatrapathi" "brundavanam")

echo "1st movie:$(MOVIES(0))"
echo "2nd movie:$(MOVIES(1))"
echo "3rd movie:$(MOVIES(3))"

echo "All movies:$(MOVIES(@))"


