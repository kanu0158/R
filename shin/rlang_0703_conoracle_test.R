#30
df_win_count <- dbGetQuery(conn,"SELECT 
                           A.WINNER TEAM,
                           COUNT(A.WINNER) WINCOUNT
                           FROM(SELECT
                                K.SCHE_DATE 경기날짜,
                                CASE
                                WHEN K.HOME_SCORE > K.AWAY_SCORE THEN HT.TEAM_NAME
                                WHEN K.AWAY_SCORE > K.HOME_SCORE THEN AT.TEAM_NAME
                                ELSE '무승부'
                                END WINNER
                                FROM SCHEDULE K
                                JOIN TEAM HT
                                ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                                JOIN TEAM AT
                                ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                                WHERE
                                K.GUBUN LIKE 'Y'
                                AND K.SCHE_DATE LIKE '2012%'
                           )A
                           WHERE A.WINNER NOT LIKE '무승부'
                           GROUP BY A.WINNER
                           ORDER BY wincount DESC
                           ")

df_win_count
# java[0][3] == R[0,3] ,  R[,3] == 3번째 컬럼값들 다 가져옴
barplot(df_win_count[,2],names.arg=df_win_count[,1])
barplot(df_win_count$WINCOUNT , names.arg=df_win_count$TEAM)

#29

##파이차트

df_seat_count <- dbGetQuery(conn,"SELECT
                           ROWNUM NUM,
                           A.*
                           FROM(SELECT
                           STADIUM_NAME ST_NAME, SEAT_COUNT SEAT
                           FROM STADIUM
                           ORDER BY SEAT_COUNT DESC) A
                           ")

pie(df_seat_count[,3],df_seat_count[,2])

#28
df_match_count <- dbGetQuery(conn,"SELECT A.*
                             FROM(SELECT
                             K.SCHE_DATE,
                             HT.TEAM_NAME || ' VS ' || AT.TEAM_NAME SCHE,
                             CASE
                             WHEN K.HOME_SCORE >= 
                             K.AWAY_SCORE THEN (K.HOME_SCORE - K.AWAY_SCORE)
                             ELSE K.AWAY_SCORE - K.HOME_SCORE
                             END GOAL
                             FROM
                             SCHEDULE K
                             JOIN TEAM HT
                             ON K.HOMETEAM_ID LIKE HT.TEAM_ID
                             JOIN TEAM AT
                             ON K.AWAYTEAM_ID LIKE AT.TEAM_ID
                             WHERE
                             K.SCHE_DATE LIKE '2012%'
                             AND K.GUBUN LIKE 'Y'
                             
                             ORDER BY GOAL DESC) A
                            ")
hist(df_match_count[,3],xlab = "goal",col = c("yellow","blue","red","green","brown"),border = "blue")


##20 월별경기수
##산포도차트
df_month_count <- dbGetQuery(conn,"SELECT 
                            (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201201%') oneM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201202%') twoM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201203%') threeM,
                             (SELECT COUNT(*)  
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201204%') fourM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201205%') fiveM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201206%') sixM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201207%') sevenM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201208%') eightM,
                             (SELECT COUNT(*)
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201209%') nineM,
                             (SELECT COUNT(*)
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201210%') tenM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201211%') eleM,
                             (SELECT COUNT(*) 
                             FROM SCHEDULE
                             WHERE SCHE_DATE LIKE '201212%') twelM
                             FROM DUAL")
df_month_count[,7]
#inputY <- c(df_month_count[,4],df_month_count[,5],df_month_count[,6],df_month_count[,7],df_month_count[,8],df_month_count[,9],df_month_count[,10],df_month_count[,11],df_month_count[,12])
inputY <- df_month_count[,]
inputX <- c(1:12)

plot(x =  c(1:12),y = df_month_count[,],
     xlab = "월",
     ylab = "경기수",
     #xlim = c(4,12),
     #ylim = c(1,50),
     #type = 'o',
     main = "월별경기수", axes=FALSE
)
axis(1, at=1:12) #x축
axis(2,at=2*0:50)

# 27 팀별 평균키 
#라인차트SQL27 
#팀별 평균키로 라인차트 
#(인덱스값을 팀이름으로 치환가능한지 찾아볼것)
df_GK_height <- dbGetQuery(conn,"select
(select tb.team_name
  from team tb
  where tb.team_id like t.team_id) teamName,
round(avg(p.height),2) avgtall 
from player p
join team t
on p.team_id like t.team_id
group by t.team_id
")
df_GK_height[,1] #팀명
df_GK_height[,2]  #평균키
?plot()
plot(x=df_GK_height[,2],type = "h",xlab="팀명",ylab="평균키",ylim=range(160:190),main="팀별골키퍼평균키",col="blue", axes = FALSE)
#axes = FALSE axis로 축들 추가시킬때 기존꺼 없어짐
#ann =FALSE  타이틀,X축이름,Y축이름 제거
axis(1, at=1:15, lab=df_GK_height[,1]) #x축
axis(2, at=5*0:200 ) #Y축
