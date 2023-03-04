mkdir -p outputs

echo "running csv test"
python3 ../tbldo/__main__.py csv "echo {arg3} {arg1} {arg2}" test.csv > outputs/csv-test.out

echo "running csv ampersand delimiter test"
python3 ../tbldo/__main__.py csv "echo {arg3} {arg1} {arg2}" test-delimiter-ampersand.csv --delimiter '&' > outputs/csv-delmieter-ampersand-test.out

echo "running csv ampersand lineterminator test"
python3 ../tbldo/__main__.py csv "echo {arg3} {arg1} {arg2}" test-newline-ampersand.csv --lineterminator '&' > outputs/csv-newline-ampersand-test.out

echo "running sql test (command line sql)"
python3 ../tbldo/__main__.py sql "echo {arg3} {arg1} {arg2}" sqlite:///test.db "SELECT * FROM test;" > outputs/db-cl-test.out

echo "running sql test (file sql)"
python3 ../tbldo/__main__.py sql "echo {arg3} {arg1} {arg2}" sqlite:///test.db test.sql > outputs/db-file-test.out


diff outputs/csv-test.out expected/expected.out
diff outputs/csv-delmieter-ampersand-test.out expected/expected.out
diff outputs/csv-newline-ampersand-test.out expected/expected.out
diff outputs/db-cl-test.out expected/expected.out
diff outputs/db-file-test.out expected/expected.out
