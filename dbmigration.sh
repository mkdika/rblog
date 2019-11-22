#!/bin/bash
echo '==============='
echo ' DB  Migration '
echo '  Post Script  '
echo '==============='
echo 'Processing..'
sleep 30
bin/rails db:migrate
bin/rails db:reseed