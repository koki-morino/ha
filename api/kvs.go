package main

import (
	"fmt"
	"os"
	"time"

	bolt "go.etcd.io/bbolt"
)

type Kvs struct {
	dir    string
	bucket string
}

func NewKvs() (*Kvs, error) {
	kvs := &Kvs{
		dir:    "/data/",
		bucket: "default",
	}

	if err := os.MkdirAll(kvs.dir, os.ModePerm); err != nil {
		return nil, err
	}

	db, err := bolt.Open(kvs.path(), 0600, &bolt.Options{Timeout: 1 * time.Second})
	if err != nil {
		return nil, err
	}
	defer db.Close()

	err = db.Update(func(tx *bolt.Tx) error {
		_, err := tx.CreateBucketIfNotExists([]byte(kvs.bucket))
		if err != nil {
			return fmt.Errorf("create bucket: %s", err)
		}

		return nil
	})

	if err != nil {
		return nil, err
	}

	return kvs, nil
}

func (kvs *Kvs) Write() error {
	db, err := bolt.Open(kvs.path(), 0600, &bolt.Options{Timeout: 1 * time.Second})
	if err != nil {
		return err
	}
	defer db.Close()

	var value string
	if err := db.Update(func(tx *bolt.Tx) error {
		b := tx.Bucket([]byte(kvs.bucket))

		if err := b.Put([]byte("new"), []byte("Hello!")); err != nil {
			return err
		}

		bytes := b.Get([]byte("new"))
		value = string(bytes)

		return nil
	}); err != nil {
		return err
	}

	logger.Info(value)

	return nil
}

func (kvs *Kvs) path() string {
	return kvs.dir + "db"
}
