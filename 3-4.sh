#!/usr/bin/env bash
scores=()  

while true; do
    echo "===================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "===================="

    read -p "메뉴 선택 (1~5): " menu

    case "$menu" in
        1)
            read -p "점수를 입력하세요 (0~100): " s
            if [[ "$s" =~ ^[0-9]+$ ]] && [ "$s" -ge 0 ] && [ "$s" -le 100 ]; then
                scores+=("$s")
                echo "추가됨."
            else
                echo "잘못된 입력입니다."
            fi
            ;;
        
        2)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                echo "입력된 점수 목록:"
                printf "%s\n" "${scores[@]}"
            fi
            ;;
        
        3)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "평균을 계산할 점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$((sum / ${#scores[@]}))
                echo "평균 점수: $avg"
            fi
            ;;
        
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "GPA를 계산할 점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$((sum / ${#scores[@]}))

                # GPA 변환 기준 (4.5 만점)
                if [ "$avg" -ge 90 ]; then
                    gpa=4.5
                elif [ "$avg" -ge 80 ]; then
                    gpa=3.5
                elif [ "$avg" -ge 70 ]; then
                    gpa=2.5
                elif [ "$avg" -ge 60 ]; then
                    gpa=1.5
                else
                    gpa=0.5
                fi

                echo "평균 점수: $avg"
                echo "평균 GPA: $gpa"
            fi
            ;;
        
        5)
            echo "종료합니다."
            exit 0
            ;;
        
        *)
            echo "1~5 사이의 숫자를 입력하세요."
            ;;
    esac
done

