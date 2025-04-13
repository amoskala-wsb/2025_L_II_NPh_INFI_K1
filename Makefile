.PHONY: deps lint test run

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. pytest -v

run:
	python main.py

docker_build:
	docker build -t hello-world-printer .

USERNAME=amoskwsb  

TAG=$(USERNAME)/hello-world-printer  
   

docker_push: docker_build  

@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \  

docker tag hello-world-printer $(TAG); \  

docker push $(TAG); \  

docker logout;  
