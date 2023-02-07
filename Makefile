build-airflow-image:
	docker build ./deployments/airflow -t alexandria-oss/airflow

build-cadence-image:
	docker build ./deployments/cadence -t alexandria-oss/cadence

build-kafka-image:
	docker build ./deployments/kafka -t alexandria-oss/kafka-kraft

build-all: build-airflow-image build-cadence-image build-kafka-image

k8s-set-ns:
	kubectl config set-context --current --namespace=alexandria

k8s-set-ns-default:
	kubectl config set-context --current --namespace=default

gen-go-coverage:
	go test ./... -coverprofile coverage.out . && go tool cover -html=coverage.out

