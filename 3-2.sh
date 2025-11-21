#!/usr/bin/env bash
read -p "첫 번째 x입력: " x1
read -p "두 번째 x입력: " x2
cal()
{
result1=$(((x1**2)/2))
result2=$(((x2**2)/2))
echo "첫 번째 y: $result1"
echo "두 번째 y: $result2"
}
cal x1 x2
