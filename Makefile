.DEFAULT_GOAL := help

.PHONY: init
init:
	terraform init
	tflint --init

.PHONY: lint
lint:
	terraform validate
	terraform fmt -check -diff -recursive
	tflint --recursive
	trivy config .

.PHONY: plan
plan:
	terraform plan

.PHONY: apply
apply:
	terraform apply

.PHONY: help
help:
