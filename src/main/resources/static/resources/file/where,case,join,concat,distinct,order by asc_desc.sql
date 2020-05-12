-- subquery : 제일 쉬움
-- 실행순서 : FROM(문,입구) - WHERE - SELECT
-- RequestBody와 같이 자바 instance와 연결하는 방법 : as

-- 예제
-- 소속팀 : 삼성블루윙즈, 전남드래곤즈
-- 포지션 : 미드필거 / 키 : 170 - 180
select player_name
from player
where (team_id like (
		select team_id
		from team
		where team_name like '삼성%'
	)) or (team_id like (
		select team_id
		from team
		where team_name like '드래%'
	))
	and position like 'MF'
	and height >= 170 and height >= 180
;

-- 전체 팀의 목록 출력
-- 단, 팀명을 오름차순으로 정렬
SELECT team_name FROM team
ORDER BY team_name asc
;

-- 포지션의 종류를 모두 출력
-- 단, 중복 제거
SELECT DISTINCT POSITION
FROM player
;

-- 포지션의 종류를 출력
-- 포지션이 없으면 신입으로 기재
SELECT case
	when POSITION = ''
	then '신입'
	ELSE position
	END AS POSITION, player_name
FROM player
WHERE team_id = 'K08'
;

-- 수원을 연고지로 하는팀의 골기퍼 이름은 무엇인가?
select player_name
from player
	where (team_id like (
		select team_id
		from team
		where region_name like '수원'
	))
	and position like 'GK'
;

-- 수원 연고팀에서 키가 170 이상 선수
-- 이면서 성이 고씨인 선수
select player_name
from player
where (team_id like (
	select team_id
	from team
	where region_name like '수원'
	))
and height >= 170
and player_name like '고%'
;

-- 광주팀 선수들 이름과 키와 몸무게 목록을 출력하시오
-- 키와 몸무게가 없으면 "0" 표시하시오
-- 키와 몸무게는  내림차순으로 정렬하시오

select player_name as playerName,
	concat(case
		when height like ''
		then '0'
		else height
		end, 'cm')as height,
	concat(case
		when height like ''
		then '0'
		else weight
		end, 'kg')as weight
from player
	where (team_id like(
		select team_id
		from team
		where region_name like '광주'))
order by 2 desc, 3 desc
;

-- 성남팀 선수들 이름과 포지션과
-- 키(cm표시)와 몸무게(kg표시)와  각 선수의 BMI지수를 출력하시오(소숫점 두자리까지)
-- 단, 키와 몸무게가 없으면 "0" 표시하시오
-- BMI는 "NONE" 으로 표시하시오
-- 최종 결과는 이름내림차순으로 정렬하시오
select player_name as playerName, position,
	concat(
		case
		when height like ''
		then '0'
		else height
		end, 'cm'
		)as height,
	concat(
		case
		when weight like ''
		then '0'
		else weight
		end, 'kg'
		)as weight,
	concat(
		case
		when height like '' or weight like ''
		then 'NONE'
		else round(weight/((height/100)*(height/100)),2)
		end)as bmi
from player
	where (team_id like (
		select team_id
		from team
		where region_name like '성남'
	))
order by 1 desc
;


-- join
-- 4개의 table을 연결하여 목록 모두 출력
-- 1. join standard
create view full_scan as -- view를 full_scan이라는 인스턴스로 만들어서 공간을 최소화하자
select t.team_id, t.team_name -- 8,195
from team t
join player p on t.team_id like p.team_id
join stadium s on t.stadium_id like s.stadium_id
join schedule sc on s.stadium_id like sc.stadium_id
;

-- 200512
-- 4개의 table을 연결하여 player_id, team_id, stadium_id, sche_date 출력
-- 2. inline view, 카티전 프로덕트(using) 8,195
select b.player_id, b.team_id, b.stadium_id, sc.sche_date
from (select a.player_id, a.team_id, a.stadium_id
	from (select p.player_id, t.team_id, t.stadium_id
		from (select player_id, team_id
			from player) p
		join team t
		using(team_id)) a
	join stadium s
	using(stadium_id)) b
join schedule sc
using(stadium_id)
;

-- 수원팀(K02)과 대전팀(K10) 선수들 중 포지현이 골키퍼인 선수명, 팀명 : 오름차순
select p.player_name, t.team_name
from team t
join player p
using (team_id)
where (team_id like 'K02'
	or team_id like 'K10')
	and p.position like 'GK'
order by 1,2
;

-- 팀과 연고지를 연결해서 출력
--        [팀명]           [홈구장]
-- 수원[ ]삼성블루윙즈  수원월드컵경기장
select concat (t.region_name,'[ ]',t.team_name) as 팀명, s.stadium_name as 홈구장
from team t
join stadium s
using (stadium_id)
;

-- 수원팀(K02)과 대전팀(K10) 선수들 중 키 18 이상 183 이하
-- 키, 팀명, 선수명 오름차순
select p.player_name as 선수명, t.team_name as 팀명, p.height as 키
from player p
join team t
using(team_id)
where (team_id like 'K02'
	or team_id like 'K10')
	and height >= 180
	and height <= 183
order by 3,2,1
;

-- 모든 선수들 중 포지션을 배정받지 못한 선수들의 팀명, 선수이름 출력 : 오름차순
select t.team_name as 팀명, p.player_name as 선수명
from player p
join team t using(team_id)
where position like ''
order by 1,2
;

-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의
-- 팀이름, 스타디움, 어웨이팀 이름 출력
select ts.팀이름, ts.스타디움, sche.awayteam_id as 어웨이팀
from (select t.team_name as 팀이름, s.stadium_id, s.stadium_name as 스타디움
	from team t
	join stadium s
	using(stadium_id)) ts
join schedule sche
using(stadium_id)
where sche.sche_date like '20120317'
;

-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
select tps.선수명, tps.position as 포지션, tps.팀명, tps.스타디움, sche.sche_date as 경기날짜
from(select tp.선수명, tp.position, tp.팀명, s.stadium_name as 스타디움, tp.stadium_id
	from(select p.player_name as 선수명, p.position,
		concat(t.region_name,'[]',t.team_name) as 팀명, t.team_id, t.stadium_id
		from player p
		join team t using(team_id)) tp
	join stadium s using(stadium_id)) tps
join schedule sche using(stadium_id)
where (sche.sche_date like '20120317')
	and (tps.position like 'GK')
;	

-- 홈팀이 3점이상 차이로 승리한 경기의
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오
select s.stadium_name as 스타디움, sche.sche_date as 경기날짜,
	sche.hometeam_id as 홈팀명, sche.awayteam_id as 원정팀명
from schedule sche
join stadium s using(stadium_id)
where home_score >= 3
;

-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록 하는 팀명 출력
-- 나와야 하는 값 : 20
-- data들을 잘 봐야 함
select stadium_name, t.team_name
from stadium s
left join team t using(stadium_id)
;

-- 열 수 확인
select count(*)
from player
;

-- mariadb 고유 기능
-- pagenation : limit
-- 0부터 5개
select player_name
from player
order by player_name limit 0,5
;

-- group by 문제
-- 평균키가 인천 유나이티스팀('K04')의 평균키  보다 작은 팀의
-- 팀ID, 팀명, 평균키 추출
select team_id 팀ID, team_name 팀명, round(avg(height), 2)평균키
from team t
join player p using(team_id)
group by team_id
having round(avg(height), 2) < (select round(avg(height), 2) a
								 	 from team t
								    join player p using(team_id)
									 where team_id like 'K04')
;

-- 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력
select team_name 소속팀명, player_name 선수명, back_no 백넘버
from player p
join team t using(team_id)
where position like 'MF'
;

-- 가장 키큰 선수 5 추출, 단 키  값이 없으면 제외
-- 키값이 없으면 제외 못함 --
select height
from player
order by height desc limit 5
;

-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력
-- 틀림 --
select p.*
from player p
where height < (select round(avg(height), 2)
						from player p2
						where p.team_id like p2.team_id
						and p2.height != 0
						group by p2.team_id)
;

-- 2012년 5월 한달간 경기가 있는 경기장  조회
-- EXISTS 쿼리는 항상 연관쿼리로  상요한다.
-- 아무리 조건을 만족하는 건이 여러건이라도 조건을 만족하는 1건만 찾으면 추가검색을 진행x
-- > 사실상 exist 안 써도 됨.... 그냥 하는 게 더 빠름.. 문제풀이를 위함..
select stadium_name 경기장
from stadium s
join schedule sche using(stadium_id)
where exists (
	select sche_date
	from schedule
	where sche_date like '201205%')
	and sche_date like '201205%'
;

-- 이현 선수 소속팀의 선수명단 출력
--X.PLAYER_NAME 선수명
--    ,X.POSITION 포지션
--    ,X.BACK_NO 백넘버


-- 팀별 포지션별 인원수와 팀별 전체  인원수 출력


-- 전체 선수들의  포지션별 평균 키 및 전체 평균 키 출력


