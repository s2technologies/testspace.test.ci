TIME_START=$(date +%s%3N)
testspace result*.xml [ALL]result*.xml [$JOB]result*.xml
TIME_END=$(date +%s%3N)
TIME_DIFF=$(( $TIME_END - $TIME_START ))

testspace results.xml [ALL]results.xml [$JOB]results.xml file://$PWD/check-size.xml
CONTENT_SIZE=$(stat -c  '%s' check-size.xml)

NUM_FILES=$(ls -l result*.xml | grep -v ^d | wc -l )

# Log file
echo "TIMING STATS:" > timing.log
echo "  Number of files: $NUM_FILES" >> timing.log
echo "  Size of content(files X 3): $CONTENT_SIZE" >> timing.log
echo "  $JOB Upload time in milliseconds: $TIME_DIFF" >> timing.log

# CSV file
echo "$JOB Upload time, $TIME_DIFF" > timing.csv
echo "$JOB Content size, $CONTENT_SIZE" >> timing.csv

testspace [$JOB]"timing.log{timing.csv:Tracking Time for $JOB}"