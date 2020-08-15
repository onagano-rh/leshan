# Usage:
#   1. Run servers:
#        make logs
#   2. Register client at the Bootstrap Server (see blow).
#   3. Run client in another terminal:
#        make run-client
#   4. Input some commands on the client (see blow) and
#      monitor it at LWM2M Server: http://localhost:${HTTP_01}
#
# How to register this client:
#   Access the Bootstrap Server, http://localhost:${HTTP_02}/
#   and click "Add new client bootstrap configuration".
#     Client endpoint: leshan-client-demo
#     LWM2M Server:
#       LWM2M Server URL: coap://leshan-server-demo:5683
#       Security mode:    No Security
#     LWM2M Bootstrap Server:
#       LWM2M Server URL: (n/a)
#       Security mode:    No Security
#
# How to use this client:
#   LeshanClientDemo - Commands available :
#   
#     - create <objectId> : to enable a new object.
#     - delete <objectId> : to disable a new object.
#     - update : to trigger a registration update.
#     - w : to move to North.
#     - a : to move to East.
#     - s : to move to South.
#     - d : to move to West.


include config.env
export


BUILD_TARGET_01 = leshan-server-demo/target/leshan-server-demo-${TARGET_VERSION}-jar-with-dependencies.jar
BUILD_TARGET_02 = leshan-bsserver-demo/target/leshan-bsserver-demo-${TARGET_VERSION}-jar-with-dependencies.jar
BUILD_TARGET_03 = leshan-client-demo/target/leshan-client-demo-${TARGET_VERSION}-jar-with-dependencies.jar


test:
	mvn test -pl leshan-server-demo,leshan-bsserver-demo,leshan-client-demo

build: ${BUILD_TARGET_01} ${BUILD_TARGET_02} ${BUILD_TARGET_03}
	docker-compose build

${BUILD_TARGET_01}:
	mvn package -pl leshan-server-demo -DskipTests

${BUILD_TARGET_02}:
	mvn package -pl leshan-bsserver-demo -DskipTests

${BUILD_TARGET_03}:
	mvn package -pl leshan-client-demo -DskipTests

up: build
	docker-compose up -d --no-deps \
	leshan-server-demo leshan-bsserver-demo

logs:
	docker-compose logs -f ${ARGS}

ps:
	docker-compose ps

down:
	docker-compose down

clean: down
	mvn clean


run-client:
	docker-compose up -d --no-deps leshan-client-demo
	docker attach ${PROJECT_NAME}_leshan-client-demo_1


exec-server:
	docker-compose exec leshan-server-demo bash

exec-bsserver:
	docker-compose exec leshan-bsserver-demo bash

exec-client:
	docker-compose exec leshan-client-demo bash
