-- join 디멘션을 올릴 때의 키값들은 처음부터 가지고 가야 함
-- 예제7 concat, 예제8 concat & case bmi, 

-- 예제1
-- 소속팀 : 삼성블루윙즈, 전남드래곤즈
-- 포지션 : 미드필거 / 키 : 170 - 180 인 선수들의 이름
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

-- 예제2
-- 전체 팀의 목록 출력
-- 단, 팀명을 오름차순으로 정렬
select *
from team
order by team_name asc
;

-- 예제3
-- 포지션의 종류를 모두 출력
-- 단, 중복 제거
select distinct position
from player
;

-- 예제4
-- 포지션의 종류 및 선수 이름 함께 출력
-- 포지션이 없으면 신입으로 기재
select case
	when position like ''
	then '신입'
	else position
	end as position, player_name
from player
;

-- 예제5
-- 수원을 연고지로 하는팀의 골기퍼 이름은 무엇인가?
select player_name
from player
where (team_id like(
	select team_id
	from team
	where region_name like '수원'))	
and position like 'GK'
;

-- 예제6
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

-- 예제7
-- 광주팀 선수들 이름과 키와 몸무게 목록을 출력하시오
-- 키와 몸무게가 없으면 "0" 표시하시오
-- 키와 몸무게는  내림차순으로 정렬하시오
select player_name as playerName
	case (
		when height like ''
		then '0'
		else height
		end),
	case (
		when weight like ''
		then '0'
		else weight
		end)
from player
order by height desc, weight desc;
;

-- 예제8
-- 성남팀 선수들 이름과 포지션과
-- 키(cm표시)와 몸무게(kg표시)와  각 선수의 BMI지수를 출력하시오(소숫점 두자리까지)
-- 단, 키와 몸무게가 없으면 "0" 표시하시오
-- BMI는 "NONE" 으로 표시하시오
-- 최종 결과는 이름내림차순으로 정렬하시오
select player_name as 선수명, position as 포지션,
	concat (
		case 
		when height like ''
		then '0'
		else height
		end, 'cm')as 키,
	concat (
		case 
		when weight like ''
		then '0'
		else weight
		end, 'kg')as 체중,
	case (
		when bmi is null
		then 'NONE'
		else round(weight/((height/100)*(height/100)),2)
		end)as BMI
from player
order by 1 desc
;

-- 예제9
-- 4개의 table을 연결하여 목록 모두 출력 : 키값들 나오게 하기
-- 1. join standard
select tps.teamId, tps.playerId, tps.staId, sche.sche_date
from(select tp.teamId, tp.playerId, s.stadium_id
	from (select t.team_id as teamId, p.player_id as playerId, t.stadium_id as staId
		from team t
		join player p using(team_id)) tp
	join stadium s using(stadium_id)) tps
join schedule sche using(stadium_id)
;

select tp.teamId, tp.playerId, tp.staId
	from (select t.team_id as teamId, p.player_id as playerId, t.stadium_id as staId
		from team t
		join player p using(team_id)) tp
	join stadium s using(stadium_id);


select t.team_id as teamId, p.player_id as playerId, t.stadium_id as staId
		from team t
		join player p using(team_id);

-- 2. join inline view


-- 예제10
-- 수원팀(K02)과 대전팀(K10) 선수들 중 포지현이 골키퍼인 선수명, 팀명 : 오름차순


-- 예제11
-- 팀과 연고지를 연결해서 출력
--        [팀명]           [홈구장]
-- 수원[ ]삼성블루윙즈  수원월드컵경기장


-- 예제12
-- 수원팀(K02)과 대전팀(K10) 선수들 중 키 18 이상 183 이하
-- 키, 팀명, 선수명 오름차순


-- 예제13
-- 모든 선수들 중 포지션을 배정받지 못한 선수들의 팀명, 선수이름 출력 : 오름차순


-- 예제14
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의
-- 팀이름, 스타디움, 어웨이팀 이름 출력


-- 예제15
-- 2012년 3월 17일 경기에
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함),
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오



-- 예제16
-- 홈팀이 3점이상 차이로 승리한 경기의
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오



-- 예제17
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록 하는 팀명 출력
-- 나와야 하는 값 : 20
-- data들을 잘 봐야 함



-- 예제18
-- 열 수 확인



-- 예제19
-- mariadb 고유 기능
-- pagenation : limit
-- 0부터 5개



-- 예제20
-- group by 문제
-- 평균키가 인천 유나이티스팀('K04')의 평균키  보다 작은 팀의
-- 팀ID, 팀명, 평균키 추출



-- 예제21
-- 포지션이 MF 인 선수들의 소속팀명 및 선수명, 백넘버 출력


-- 예제22
-- 가장 키큰 선수 5 추출, 단 키  값이 없으면 제외


-- 예제23
-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력


-- 예제24
-- 2012년 5월 한달간 경기가 있는 경기장  조회
-- EXISTS 쿼리는 항상 연관쿼리로  상요한다.
-- 아무리 조건을 만족하는 건이 여러건이라도 조건을 만족하는 1건만 찾으면 추가검색을 진행x




-- 예제25
