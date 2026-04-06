DEFAULT_GOAL := test

lint: with-brew-rumdl
	rumdl fmt .

test: validate lint
	@echo "All checks passed."

validate:
	claude plugin validate .

with-brew-%:
	@brew list --formula | grep -q "$*" || brew install "$*"
