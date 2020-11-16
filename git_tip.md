# GIT 사용 TIP


### 마스터 내용 merge

git checkout mybranch
git merge master

### 리모트 에서 브랜치 내용 가져오기 

git pull origin dfocus-dev
git pull origin dfocus-qa

### 리모트 브랜치 로 push

git push origin dfocus-dev
git push origin dfocus-da

### 마스터에서 브랜치 머지하기 (담당자만 사용)

git checkout master
git merge dfocus-dev
git merge dfocus-da

### 리모트 브랜치 로컬에 브랜치 생성과 동시에 생성

git checkout remotes/origin/dfocus-dev -b dfoucs-dev

-- 현재 상태 
git status <--프로젝트 폴더의 상태
코드리뷰, Merge Pull Reqest
PR을 받은 원본 저장소 관리자는 코드 변경내역을 확인하고 Merge 여부를 결정한다.
-- Merge 이후 동기화 및 branch 삭제
원본 저장소에 Merge가 완료되면 로컬 코드와 원본 저장소의 코드를 동기화 한다.
작업하던 로컬의 branch를 삭제한다.
--코드 동기화
$ git pull real-blog(remote 별명)
--브랜치 삭제
$ git branch -d develop(브랜치 별명)
--나중에 추가로 작업할 일이 있으면 git pull real-blog(remote 별명) 
명령을 통해 원본 저장소와 동기화를 진행하고 3~7을 반복한다.

### 현재 리모트 확인 

git remote -v

### 리모트 삭제

git remote remove orign 

### 리모트 추가 

git remote add origin https://github.com/ChoJinKyu/sppCapV.git

#### 예)

git remote add origin "http://1"
git remote set-url --add --push origin "http://1"
git remote set-url --add --push origin "http://2"

### 리모트 변경
git remote remove origin 
git remote add origin https://github.com/ChoJinKyu/sppCapV2.git



# 계정

### 계정 저장
git config credential.helper store

### 계정 등록
git config --global user.email "pangsezi@gmail.com"
git config --global user.name "neo"


# 브랜치

### 리포트 갱신 

git remote update 

### 원격 포함 브랜치 정보 확인

gir branch -a

### 브랜치 생성 (생성 깃허브에서 작업 더 편함)

git checkout -b testBranch

###- 브랜치 삭제
git branch -D testBranch

### 브랜치에서 마스터 값을 가져올때.

git checkout master
git merge sangwonl   # sangwonl 브랜치의 HEAD를 현재 브랜치

### 브랜치에서 작업후 브랜치에 반영하고자 할때(branch push)

git push origin dev(원격) /or/ git push --set-upstream origin dev(원격)

git push origin sangwonl

### 리모트의 브랜치 정보 확인후 브랜치 작업영역(로컬 or Bas) 로 가져오기
$ git remote update 
$ git fetch origin
$ git branch
* master
$ git branch -a

* master
  remotes/origin/master
  remotes/origin/txt <---가져올 브랜치 


### 리모트 브랜치를 로컬 txt 브랜치로 생성 
$ git checkout remotes/origin/dfocus -b dfocus    
$ git branch
  master
* txt   <--현재 브랜치 및 내역 확인 

### 내 로컬 브랜치 지우기
$ git branch
* master
txt
$ git branch -D txt
$ git branch
* master

### 리모트 브랜치 지우기 
$ git branch -a
* master
  remotes/origin/master
  remotes/origin/txt
$ git push origin :txt
$ git branch
* master
  remotes/origin/master
$ git branch -d origin/txt -r   # 혹은 이렇게


## git log

git log -p // 버젼별 변경사항을 볼수 있다.
git diff '버전 id'..'버전 id2'

--버전 번호를 선택 확인하면 해당 버전의 하위로만 볼수 있다.
git log b3a8cbf4612c18605224209042d6e27111afb9a4


## 복구
Reset vs revert   !!!!!!!!!!!!!!!!!!!!!!!!!!!
다시 복구 할 수 있다. 공 유이후 reset를 하면 안됨.

--reset 하지 않음 예제만..
git reset --hard "버전 id" 

git reset --hard "5ea3231044f457c10306506b974353ff63fa6ce0" (잘못하면 git 커밋 기록 모두 지운다. )

## 기타 
git commit --amend //git 저장 메시지를 다시 정한다. 


### Request Full 마스터에 병합하거나 개인적인 작업이후 진행 


- git pull requst 사용법 확인해야함

--push 이후 git hub에 접속하면 pull requst 활성화된다.

requst 요청시 merge 할 대상을 선택하고 멘트를 진행한다. 

master에 merge 요청을 하는것이다. 그럼 담당자가 확인후 merge한다...

https://wayhome25.github.io/git/2017/07/08/git-first-pull-request-story/

