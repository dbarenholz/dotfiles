## Backup my home directory to my server
SERVER_IP=192.168.178.74
sudo rsync -auvz "$HOME" "dan@SERVER_IP:/data/from_bazzite"
