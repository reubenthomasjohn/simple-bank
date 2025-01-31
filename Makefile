postgres:
	docker run --name simple_bank_postgres -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=secret -d postgres:17.2-alpine

postgres-down:
	docker stop simple_bank_postgres && docker container rm simple_bank_postgres

createdb:
	docker exec -it simple_bank_postgres createdb --username=postgres --owner=postgres simple_bank

migrateup: 
	migrate -path db/migration -database "postgres://postgres:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgres://postgres:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

dropdb:
	docker exec -it simple_bank_postgres dropdb --username=postgres simple_bank

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: createdb postgres dropdb postgres-down migrateup migratedown sqlc test server