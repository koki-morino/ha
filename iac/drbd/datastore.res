resource datastore {
    net {
        protocol C;
        # Enable dual-primary mode only after initial synchronization has completed.
        # allow-two-primaries yes;
        after-sb-0pri discard-zero-changes;
        after-sb-1pri discard-secondary;
        after-sb-2pri disconnect;
    }

    # /dev/drbd1
    device minor 1;
    disk "/dev/disk/by-id/google-dup";
    meta-disk internal;

    on "mweb-instance-1" {
        node-id 0;
    }
    on "mweb-instance-2" {
        node-id 1;
    }

    connection {
        host "mweb-instance-1" address 10.0.1.3:7789;
        host "mweb-instance-2" address 10.0.11.3:7789;
    }
}
