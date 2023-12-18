#!/usr/bin/env bash

TEST_SET='TEST 1'

RESULT=$(cd .. && ./app.rb 0001000200050009 | grep -i invalid)

if [ -n "$RESULT" ];
then
  echo "[+] $TEST_SET. PASSED"
else 
  echo "[-] $TEST_SET. ERROR: Incorrect results" 
fi 

TEST_SET='TEST 2'

RESULT=$(cd .. && ./app.rb 5425233430109903 | grep -i invalid)

if [ -n "$RESULT" ];
then
  echo "[-] $TEST_SET. ERROR: Incorrect results" 
else 
  echo "[+] $TEST_SET. PASSED"
fi 



