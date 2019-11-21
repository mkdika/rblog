#!/bin/bash
echo '==============='
echo ' DB  Migration '
echo '  Post Script  '
echo '==============='
echo 'Processing..'
sleep 30
rails db:migrate
rails db:reseed