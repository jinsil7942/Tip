# GIT 사용 TIP


### 마스터 내용 merge

  git checkout mybranch

    git merge master

### 리모트 에서 브랜치 내용 가져오기 

    git pull origin dfocus-dev

    git pull origin dfocus-qa

### 리포트 정보 업데이트 

    git remote update

### 로컬 브랜치 생성->커밋-> 리모트 에 올리기(브랜치 신규 새성)

    git push origin <브랜치명>

### 리모트 브랜치 로 push

    git push origin dfocus-dev

    git push origin dfocus-da

### 마스터에서 브랜치 머지하기 (담당자만 사용)

    git checkout master

    git merge dfocus-dev

    git merge dfocus-da

### 리모트 브랜치 로컬에 브랜치 생성과 동시에 생성

    git checkout remotes/origin/dfocus-dev -b dfoucs-dev


#### 현재 상태 

    git status <--프로젝트 폴더의 상태
  
    코드리뷰, Merge Pull Reqest

    PR을 받은 원본 저장소 관리자는 코드 변경내역을 확인하고 Merge 여부를 결정한다.

    Merge 이후 동기화 및 branch 삭제

    원본 저장소에 Merge가 완료되면 로컬 코드와 원본 저장소의 코드를 동기화 한다.

    작업하던 로컬의 branch를 삭제한다.

#### 코드 동기화
  
    git pull real-blog(remote 별명)

  - 브랜치 삭제
  
        git branch -d develop(브랜치 별명)

      나중에 추가로 작업할 일이 있으면 git pull real-blog(remote 별명) 
    
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

# pull의 경우 뭍지도 따지지도 않고 최신 push 된 정보를 가져와 병합 합니다. fetch를 통하여 최신 push 된 정보를 가져오고 내 로컬에 있는 버전이 리모트 서버에 있는 버전보다 이전 버전이라면 pull 명령어를 사용하여 내 컴퓨터의 소스 코드를 갱신 하면 됩니다. 동일한 파일을 수정하지 않으면 fetch를 이용하 최신 정보를 가져오는것이 좋을꺼 같습니다. 

### fetch

    fetch는 리모트 서버의 최신 이력을 내 클라이언트로 가져오되 병합은 하지 않는 명령 merge와 사용법은 같습니다. 
    
   

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
      - txt branch 
      $ git branch -D txt
      $ git branch
      * master
### 리모트 브랜치 지우기 
      $ git branch -a
      * master
        remotes/origin/master
        remotes/origin/txt

## user: sppCap $ git branch -d origin/mi -r


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


git stash pop

그럼 다시 원래 있던 브런치로 수정된 파일들이 돌아온다~ ㅎㅎ

 
## STASH 

    git stash list : 백업한 리스트
    git stash clear : 백업 리스트 지우기
    git stash apply : 최근 stack 영역에 저장되어 있던 작업 내용 복원(stash list 해보면 리스트가 남아있음)
    git stash pop : stack 영역에 저장되어 있던 작업 내용 복원되고, list에서 삭제됨
    git stash pop stash@{1} : stash list 명령어를 이용하여 출력된 리스트에서 선택적 복원 
    git stash drop stash@{1} : stash list 명령어를 이용하여 출력된 리스트에서 선택적 삭제 

    git stash show : 무슨 파일이 수정됐는지 나옴
    git stash show stash@{1} : 선택적으로 수정된 내용 나옴
    git stash show  -p : diff 한것처럼 어떤 내용이 수정됐는지 나옴

    git stash brach new-branch : 새로운 브런치를 만듬
    git stash branch new-branch stahs@{1} : 새로운 브런치를 만듬


### Request Full 마스터에 병합하거나 개인적인 작업이후 진행 

  - git pull requst 사용법 확인해야함

  --push 이후 git hub에 접속하면 pull requst 활성화된다.

  requst 요청시 merge 할 대상을 선택하고 멘트를 진행한다. 

  master에 merge 요청을 하는것이다. 그럼 담당자가 확인후 merge한다...

  https://wayhome25.github.io/git/2017/07/08/git-first-pull-request-story/

