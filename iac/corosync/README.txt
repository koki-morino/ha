Change password.
bash -c "echo  hacluster:<password> | chpasswd"

Authenticate to nodes.
sudo pcs cluster auth --name drbd-ocfs2 mweb-server-1 mweb-server-2 -u hacluster -p <password>

Start cluster.
sudo pcs cluster start --all

Verify cluster status.
sudo pcs status
