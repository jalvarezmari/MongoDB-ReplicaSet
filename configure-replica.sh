#!/bin/bash

# wait until the databases are up and running
sleep 3

# configure the replica set
mongo --host mongo1:27017 --eval "rs.initiate({
		_id : 'my-mongo-set', 
		protocolVersion: 1, 
		members: [  { _id : 0, host : 'mongo1:27017'},
					{ _id : 1, host : 'mongo2:27017'},
					{ _id : 2, host : 'mongo3:27017'}
				 ], 
		settings: {electionTimeoutMillis: 1000}
	})"

# import the restaurants collection
mongoimport --host my-mongo-set/mongo1:27017,mongo2:27017,mongo3:27017 -d zips_small -c restaurantes < /opt/zips_small.json