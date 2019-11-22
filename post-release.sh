#!/bin/bash
echo '======================'
echo '  Heroku Post Script  '
echo '======================'
sleep 30
bin/rails db:migrate
bin/rails db:reseed
echo '~---=={{ DONE! }}==---~'