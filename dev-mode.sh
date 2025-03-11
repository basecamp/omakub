#!/bin/bash

touch ./.git/hooks/pre-commit

chmod +x ./.git/hooks/pre-commit

echo "#!/bin/bash" >./.git/hooks/pre-commit
echo "bash ./update_shellcheckrc.sh" >>./.git/hooks/pre-commit
