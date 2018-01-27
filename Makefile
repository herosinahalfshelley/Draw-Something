.PHONY: clean env lint test install

all: env

env: clean
	virtualenv env && \
		. ./env/bin/activate && \
		pip install -r requirements.txt && \
		pip install -e .

test: lint test-unit

lint:
	pycodestyle -v ./bin/* ./test

test-unit:
	pytest -v ./test/unit

clean:
	rm -rf env
