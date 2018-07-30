testspace ?start

for (( i=1; i<=20; i++))
do
  TIME_START=$(date +%s%3N)

  testspace [JOB-$i]results.xml ?add

  TIME_END=$(date +%s%3N)
  TIME_DIFF=$(( $TIME_END - $TIME_START ))

  echo "TIMING STATS:" > timing.log
  echo "  JOB-$i Upload time in milliseconds: $TIME_DIFF" >> timing.log

  echo "JOB-$i Upload time, $TIME_DIFF" > timing.csv

  testspace [JOB-$i]"timing.log{timing.csv:Tracking Time for JOB-$i}" ?add
done

testspace ?finish
