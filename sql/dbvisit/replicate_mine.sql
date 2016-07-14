--
-- Thorsten Bruhns (Thorsten.Bruhns@opitz-consulting.de)
--
-- Get MINE State for DBVisit Replicate
--
-- Parameter1: Schema for DBVisit Repository
--
-- Date 14.07.2016
-- Version 1

set lines 125 pages 100

column name format a9 
column dbid format 9999999999 
column ddc format 999 
column WALLCLOCK_DATE format a16
column MINE_DATE format a17
column WALLCLOCK_DATE format a17
column DIFF_SCN format 99999999999999 

SELECT 
       d.name
     , d.dbid
     , r.DDC_ID ddc
     , TO_CHAR(r.WALLCLOCK_DATE,'DD.MM.YY HH24:MI:SS') WALLCLOCK_DATE
     , TO_CHAR(r.MINE_DATE,'DD.MM.YY HH24:MI:SS') MINE_DATE
     , (r.WALLCLOCK_DATE - r.MINE_DATE) * 24 * 60 * 60 DIFF_DATE
     , r.SOURCE_SCN - r.MINE_SCN  DIFF_SCN
 FROM &1..DBRSCOMMON_HEARTBEAT r
 join v$database d on 1=1
;

