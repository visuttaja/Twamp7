chcp 65001
echo off
echo ********************************
echo Tiedosto: %~dp0%~n0%~x0
echo älämölö
echo ********************************

call x1_my_init_data_dir.bat
rem must set root
call X2_MY_SQL_FIRST_START.bat
echo first start done

call X3_Y_MY_SQL_FIRST_STOP.bat
echo first stop done


echo MYSQL INITIALIZATION DONE







