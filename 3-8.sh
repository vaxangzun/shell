#!/usr/bin/env bash
if [ ! -d "DB" ]; then
    echo "DB 폴더가 없습니다. 새로 생성합니다."
    mkdir DB
else
    echo "DB 폴더가 이미 존재합니다."
fi

cd DB || exit 1

echo "DB 폴더 안에 임의의 5개 파일을 생성합니다."
for i in {1..5}; do
    echo "This is file $i" > "file$i.txt"
done

echo "생성한 5개 파일을 tar.gz로 압축합니다."
tar -czf db_files.tar.gz file1.txt file2.txt file3.txt file4.txt file5.txt

cd ..

if [ ! -d "train" ]; then
    echo "train 폴더를 생성합니다."
    mkdir train
else
    echo "train 폴더가 이미 존재합니다."
fi

echo "train 폴더 안에 DB 폴더의 5개 파일에 대한 심볼릭 링크를 생성합니다."
for i in {1..5}; do
    ln -sf "../DB/file$i.txt" "train/file$i.txt"
done

echo "작업이 완료되었습니다."

