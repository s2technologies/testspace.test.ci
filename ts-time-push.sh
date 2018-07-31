TIME_START=$(date +%s%3N)
testspace result*.xml [ALL]result*.xml [$JOB]result*.xml
TIME_END=$(date +%s%3N)
TIME_DIFF=$(( $TIME_END - $TIME_START ))

# Log file
echo "TIMING STATS:" > timing.log
echo "  $JOB Upload time in milliseconds: $TIME_DIFF" >> timing.log

# CSV file
echo "$JOB Upload time, $TIME_DIFF" > timing.csv

testspace [$JOB]"timing.log{timing.csv:Tracking Time for $JOB}"
