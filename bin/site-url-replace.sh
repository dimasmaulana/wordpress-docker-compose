#!/usr/bin/env bash
if [ $# -eq 0 ]; then
	me=$(basename "$0")
	echo "No arguments supplied"
	echo ""
	echo "Usage:"
	echo "$me <new site url>"
	echo ""
	exit
fi
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
cd $SCRIPT_DIR
cd ..
docker compose run --rm wpcli wp maintenance-mode activate
SITE_URL=$(docker compose run --rm wpcli wp option get siteurl)
SITE_URL="$(echo -e "${SITE_URL}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
echo $SITE_URL
echo ${#SITE_URL}
echo $1
docker compose run --rm wpcli wp search-replace $SITE_URL $1
docker compose run --rm wpcli wp maintenance-mode deactivate
