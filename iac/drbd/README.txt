Update DRBD config to allow dual-primary after first synchronizaion has
completed and run:
drbdadm adjust datastore

Now, both nodes are able to be primary.
drbdadm primary datastore

Make OCFS2 on either node.
mkfs -t ocfs2 -N 2 -L ocfs2_drbd /dev/drbd1

Assign resources to Pacemaker
pcs resource create p_drbd_ocfs2 ocf:linbit:drbd drbd_resource="ocfs2"
pcs resource master ms_drbd_ocfs2 p_drbd_ocfs2 master-max=2 clone-max=2 notify=true
...

Mount OCFS2 for MongoDB.
mount -t ocfs2 /dev/drbd1 /data
