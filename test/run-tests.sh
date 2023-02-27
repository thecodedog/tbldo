mkdir -p outputs

echo "running csv test"
python3 ../tbldo/__main__.py csv "echo {arg3} {arg1} {arg2}" test.csv > outputs/csv-test.out
echo "running sql test (command line sql)"
python3 ../tbldo/__main__.py sql "echo {arg3} {arg1} {arg2}" sqlite:///test.db "SELECT * FROM test;" > outputs/db-cl-test.out
echo "running sql test (file sql)"
python3 ../tbldo/__main__.py sql "echo {arg3} {arg1} {arg2}" sqlite:///test.db test.sql > outputs/db-file-test.out

diff outputs/ expected/
