#!/usr/bin/env bash
read -p "첫 숫자 입력: " num1
read -p "둘째 숫자 입력: " num2
calculate() 
{
echo "plus: $((num1 + num2))"
echo "minus: $((num1 - num2))"
echo "multiply: $((num1 * num2))"
echo "devide: $((num1 / num2))"
}
calculate num1 num2
