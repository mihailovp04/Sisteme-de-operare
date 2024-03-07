@echo off
rem 13. Напишите командный файл, который получает имя каталога и список файлов в качестве параметров.
rem Объедините все файлы из списка, которые содержатся в указанном каталоге.
rem Имена файлов в списке, которых нет в каталоге, должны отображаться на экране.

rem Проверяем, переданы ли аргументы
if "%~1"=="" (
    echo "Использование: %0 Путь_к_директории Файл1 Файл2 Файл3 ..."
    exit /b
)

set "directory=%~1"

rem Проверяем, является ли первый параметр директорией
pushd "%directory%" 2>nul
if errorlevel 1 (
    echo "%directory%" не является директорией или не существует.
    exit /b
) else (
    popd
    echo "%directory%" является директорией.
)

rem Создаем пустой файл для результата
set "result=result.txt"
if exist "%result%" (
    echo Файл %result% уже существует, удаляем его.
    del "%result%"
)

rem Обрабатываем переданные параметры (файлы)
shift
:process_files
if "%~1"=="" (
    echo Все файлы обработаны.
    exit /b
)

set "file=%~1"
if exist "%directory%\%file%" (
    echo Объединяем файл "%file%" из директории "%directory%" в %result%
    type "%directory%\%file%" >> %result%
) else (
    echo Файл "%file%" НЕ найден в директории "%directory%".
)
shift
goto :process_files
