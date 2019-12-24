README:

Desde el directorio:

1. Ejecutar: docker-compose up
2. Esperar la inicializacion completa.
3. Ejecutar: docker run --network josealvarezmari-replicaset_my-mongo-cluster -p 8000:8000 apozohue10/rest-server-2019
4. Comprobar mediante localhost:8000 que se ha cargado correctamente.
5. Comprobar que el ReplicaSet funciona correctamente mediante:
	docker exec -it <Container_ID_Secundario> bash
	mongo
	rs.slaveOk()
	show dbs
	use zips_small
	show collections
	db.restaurantes.findOne()

