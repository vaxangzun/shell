#!/usr/bin/env bash
read -p "국어 점수 입력: " kscore
read -p "수학 점수 입력: " mscore
grade()
	{
	score="$1"
	if [ "$score" -gt 100 ] || [ "$score" -lt 0 ]; then
		echo "number should be (0~100)"
	elif [ "$score" -ge 90 ]; then
		echo "grade: A"
	else
		echo "grade: B"
	fi
	}
echo "국어 등급"
grade "$kscore"
echo "수학 등급"
grade "$mscore"
avg=$(( (kscore + mscore) / 2 ))
echo "평균 등급"
grade "$avg"
