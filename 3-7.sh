#!/usr/bin/env bash

while true; do
    echo "=========================="
    echo " 1) 사용자 정보 확인"
    echo " 2) CPU/GPU 사용량 확인"
    echo " 3) 메모리 사용량 확인"
    echo " 4) 디스크 사용량 확인"
    echo " 5) 종료"
    echo "=========================="

    read -p "메뉴 선택 (1~5): " menu

    case "$menu" in
        1)
            echo "----- 사용자 정보 -----"
            who
            id
            ;;

        2)
            echo "----- CPU/GPU 사용량 -----"

            echo "[CPU 사용량]"
            top -b -n 1 | head -n 5

            echo
            echo "[GPU 사용량]"
            if command -v nvidia-smi &> /dev/null; then
                nvidia-smi
            else
                echo "GPU 정보 명령어(nvidia-smi)를 찾을 수 없습니다."
            fi
            ;;

        3)
            echo "----- 메모리 사용량 -----"
            free -h
            ;;

        4)
            echo "----- 디스크 사용량 -----"
            df -h
            echo
            echo "현재 디렉토리 상세 용량:"
            du -sh .
            ;;

        5)
            echo "프로그램을 종료합니다."
            exit 0
            ;;

        *)
            echo "1~5 사이 숫자를 입력하세요."
            ;;
    esac

    echo
    read -p "계속하려면 Enter를 누르세요..."
done

