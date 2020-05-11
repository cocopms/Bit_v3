-- subquery : 제일 쉬움
-- 실행순서 : FROM(문,입구) - WHERE - SELECT
-- RequestBody와 같이 자바 instance와 연결하는 방법 : as

-- 예제
-- 소속팀 : 삼성블루윙즈, 전남드래곤즈
-- 포지션 : 미드필거 / 키 : 170 - 180

-- 다시 확인
SELECT player_name
FROM player
WHERE (team_id like (
		SELECT team_id
		FROM team
		WHERE team_name like '삼성%'
	) or (team_id like (
		SELECT team_id
		FROM team
		WHERE team_name like '드래곤즈%'
	))
	AND POSITION like 'MF'
	AND height >= 170 AND height <= 180
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

-- 수원을 연고지로 하는팀의 골기커는 누구인가?
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
order by height desc, weight desc
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
order by player_name desc
;


-- join
-- 4개의 table을 연결하여 목록 모두 출력
-- 1. join standard
select *
from team t
join player p on t.team_id like p.team_id
join stadium s on t.stadium_id like s.stadium_id
join schedule sc on s.stadium_id like sc.stadium_id
;
-- 4개의 table을 연결하여 player_id, team_id, stadium_id, sche_date 출력
-- 2. inline view
select b.player_id, b.team_id, b.stadium_id, sc.sche_date
from (select a.player_id, a.team_id, a.stadium_id
	from (select p.player_id, t.team_id, t.stadium_id
		from (select player_id, team_id
			from player) p
		join team t
		on p.team_id like t.team_id) a
	join stadium s
	on a.stadium_id like s.stadium_id) b
join schedule sc
on b.stadium_id like sc.stadium_id
;