#!/usr/bin/env bash
DB_FILE="DB.txt"
if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true; do
    echo "===================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "===================="

    read -p "메뉴 선택 (1~5): " menu

    case "$menu" in
        1)
            read -p "팀원 이름: " name
            read -p "학번: " sid
            echo "MEMBER|$name|$sid" >> "$DB_FILE"
            echo "팀원 정보가 저장되었습니다."
            ;;

        2)
            read -p "날짜 (예: 2025-11-21): " date
            read -p "팀원 이름: " name
            read -p "수행 내용: " work
            echo "WORK|$date|$name|$work" >> "$DB_FILE"
            echo "수행 내용이 저장되었습니다."
            ;;

        3)
            read -p "검색할 팀원 이름: " name

            echo "----- 팀원 기본 정보 -----"
            grep "^MEMBER|$name|" "$DB_FILE" 2>/dev/null | \
            while IFS="|" read type n sid; do
                echo "이름: $n, 학번: $sid"
            done

            echo "----- 수행 내용 -----"
            grep "^WORK|.*|$name|" "$DB_FILE" 2>/dev/null | \
            while IFS="|" read type date n work; do
                echo "날짜: $date, 내용: $work"
            done
            ;;

        4)
            read -p "검색할 날짜 (예: 2025-11-21): " date

            echo "----- $date 수행 내용 -----"
            grep "^WORK|$date|" "$DB_FILE" 2>/dev/null | \
            while IFS="|" read type d name work; do
                echo "이름: $name, 내용: $work"
            done
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "1~5 사이의 숫자를 입력하세요."
            ;;
    esac

    echo
done

