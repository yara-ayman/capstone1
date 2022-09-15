########## The Makefile includes instructions on environment setup and linting ##########
# Create and activate a virtual environment
# # Install dependencies in requirements.txt
# # Dockerfile should pass hadolint
# # app.py should pass pylint

setup:
	# Create python virtualenv & source it
	python3 -m venv venv
	. venv/bin/activate

install:
	# Make sure to upgrade the latest version of pip & install dependencies
	pip3 install --upgrade pip && pip3 install -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && chmod +x ./hadolint

lint:
	# This is linter for Dockerfiles
	./hadolint Dockerfile
	# This is linter for Application
	pylint --disable=R,C,W1203 app.py

test:
	# This is for testing the New app
	python3 -m pytest -vv tests/*.py

all: install lint test	
