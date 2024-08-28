#!/bin/bash

# Git 설정
git config user.name "yunee"
git config user.email "yunee@cleaninglab.co.kr"

# 모든 브랜치 가져오기
git fetch --all --unshallow

# main 브랜치로 체크아웃하고 최신 상태로 업데이트
git checkout main
git pull origin main

# dev 브랜치를 main 브랜치로 병합
if git merge origin/dev --allow-unrelated-histories; then
  # 병합이 성공하면 main 브랜치에 푸시
  git push origin main
else
  # 병합 충돌이 발생하면 오류 메시지 출력
  echo "Merge conflict detected"
  exit 1
fi