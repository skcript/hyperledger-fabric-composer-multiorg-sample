docker kill $(docker ps -q) && docker rm $(docker ps -aq)
# remove the local state

rm -fr ~/.composer
rm -rf ~/.composer-connection-profiles/hlfv1
rm -f ~/.composer-credentials/*

