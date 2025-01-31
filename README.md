Create `main.go`

Add `package main and func main()` inside.

`go mod init... && go mod tidy`

`docker pull postgres:17.2-alpine`

`docker run --name simple-bank-postgres -p 5432:5432 -e POSTGRES_PASSWORD=secret -d postgres:17.2-alpine`

`docker exec -it simple-bank-postgres psql -U postgres`

`go-simple-bank % migrate create -ext sql -dir db/migration -seq init_schema`

docker exec -it simple_bank_postgres /bin/sh

createdb --username=postgres --owner=postgres simple_bank
psql simple_bank

## Create database migrations on command add it here

migrate -path db/migration -database "postgres://postgres:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

## WHy do we need a db transaction?

1. To provide a reliable and consistent unit of work, even in the case of system failure.

2. To provide isolation between programs that access the db concurrently.

ACID

A. Atomicity  
C. Consistency
I. Isolation
D. Durability

BEGIN; ... COMMIT;
BEGIN; ... ROLLBACK;
