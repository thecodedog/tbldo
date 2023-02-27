CREATE TEMP TABLE temp_table AS
    SELECT * FROM test
;


SELECT arg1,arg2,arg3 FROM temp_table;