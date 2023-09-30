.DEFAULT_GOAL := help
.PHONY: help build

help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

build: ## Build Streamlit
	docker build -t islomar/streamlit .

run: ## Run Streamlit
	docker run -p 8501:8501 islomar/streamlit

docker-login:
	docker login -u islomar