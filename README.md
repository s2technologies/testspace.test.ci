[![Testspace](https://www.testspace.com/img/Testspace.png)](https://www.testspace.com)

***

### Testspace CI testings

The objectives are to validate:
  * CI specific testing for Standalone Projects
  * CI specific testing fro Connected Projects
  * CI support for `Matrix` (multiple jobs)
  * General concurrency / load testing

***

### Master

The corresponding Testspace Project branch(space) `code churn` will represent the `Testspace` repo changes. 


This branch will be used to generate the pre-canned content used by the other branches.

Starting with pre-canned `results.xml`:

<pre>
sudo pip install pytest
py.test generate-results.py --junitxml=results.xml -v --tb=no
</pre>

The Testspace branch(space) content will be pushed via a [manual trigger](https://github.com/s2technologies/testspace/wiki/Setup-for-Integration-Testing#manually-triggering-tests-c9-or-local-environment) to the `other` branches to execute their specific CI tests.

### Standalone

This branch is used by ALL CIs to push content. Requires CI Environment Variables (via UI) set to `S2_TOKEN=...`.

### Other

All of the other branches, named based on what CI runs, are used to test Matrix/Concurrency specific to the CI. 

