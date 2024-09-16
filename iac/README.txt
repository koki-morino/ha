Server 1
10.0.1.0/24
10.0.1.3

Server 2
10.0.11.0/24
10.0.11.3

Witness
10.0.21.0/24
10.0.21.3

Update DRBD config to allow dual-primary and then run:
drbdadm adjust datastore

On both nodes.
drbdadm primary

Make OCFS2 on DRBD.
Run the following command on one node.
mkfs -t ocfs2 -N 2 -L ocfs2_drbd1 /dev/drbd1

Mount OCFS2 for MongoDB.
mount -t ocfs2 /dev/drbd1 /data
