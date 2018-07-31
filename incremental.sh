testspace ?start

for (( i=1; i<=20; i++))
do
  TIME_START=$(date +%s%3N)

  testspace result*.xml [ALL]result*.xml [JOB-$i]results.xml ?add

  TIME_END=$(date +%s%3N)
  TIME_DIFF=$(( $TIME_END - $TIME_START ))

  testspace results.xml [ALL]results.xml [JOB-$i]results.xml file://$PWD/check-size.xml
  CONTENT_SIZE=$(stat -c  '%s' check-size.xml)

  NUM_FILES=$(ls -l result*.xml | grep -v ^d | wc -l )

  echo "TIMING STATS:" > timing.log
  echo "  Number of files: $NUM_FILES" >> timing.log
  echo "  Size of content(files X 3): $CONTENT_SIZE" >> timing.log
  echo "  JOB-$i Upload time in milliseconds: $TIME_DIFF" >> timing.log

  # CSV file
  echo "JOB-$i Upload time, $TIME_DIFF" > timing.csv
  echo "JOB-$i Content size, $CONTENT_SIZE" >> timing.csv

  testspace [JOB-$i]"timing.log{timing.csv:Tracking Time for JOB-$i}" ?add
done

testspace ?finish
