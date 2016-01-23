mastermind:
	@$(shell pwd)/mastermind.py --quiet \
                              --response-body $(shell pwd)/test/records/fake.json \
                              --url https://api.github.com/users/octocat/orgs
.PHONY: mastermind

mastermind-help:
	@$(shell pwd)/mastermind.py --help | $(LESS)
.PHONY: mastermind-help


mastermind-script:
	@$(shell pwd)/mastermind.py --quiet \
                              --script "$(shell pwd)/scripts/simple.py \
                                        https://api.github.com/users/octocat/orgs \
                                        $(shell pwd)/test/records/fake.json"
.PHONY: mastermind-script

mastermind-driver:
	@$(shell pwd)/mastermind.py --quiet \
                              --with-driver \
                              --source-dir $(shell pwd)/test/records
.PHONY: mastermind-driver

mastermind-reverse-access:
	@$(shell pwd)/mastermind.py --quiet \
                              --with-driver \
                              --with-reverse-access \
                              --source-dir $(shell pwd)/test/records
.PHONY: mastermind-access


mastermind-error:
	@$(shell pwd)/mastermind.py --quiet \
                              --response-body $(shell pwd)/test/records/fake.json \
                              --script "$(shell pwd)/scripts/simple.py \
                                        https://api.github.com/users/octocat/orgs \
                                        $(shell pwd)/test/records/fake.json"
.PHONY: mastermind-error
