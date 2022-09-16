########## The Makefile includes instructions on environment setup and linting ##########


setup:
	#  python virtualenv & activate it
	python3 -m venv venv
	. venv/bin/activate

install:
	#  install dependencies
	pip3 install --upgrade pip && pip3 install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x ./hadolint

lint:
	# linter for Dockerfiles
	./hadolint Dockerfile
	#  linter for App
	pylint --disable=R,C,W1203 app.py

test:
	#  testing the New app
	python3 -m pytest -vv tests/*.py

all: install lint test	
