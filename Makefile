#!/usr/bin/make -f

APP_ROOT=./app
APP_URL=http://127.0.0.1
DB_URL=mysql://drupal:drupal@127.0.0.1/local
DRUSH=./bin/drush -r $(APP_ROOT) -l $(APP_URL)

.DEFAULT_GOAL := list

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1n}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

init:
	composer install --prefer-dist --no-progress --no-suggest --no-interaction --optimize-autoloader

devify:
	chmod -R +w $(APP_ROOT)/sites/default
	mkdir -p $(APP_ROOT)/sites/default/files/private
	cp settings.local.php $(APP_ROOT)/sites/default/settings.php

install:
	$(DRUSH) site-install --db-url=$(DB_URL)

mkdirs:
	mkdir -p $(APP_ROOT)/sites/default/files/tmp $(APP_ROOT)/sites/default/files/private

updb:
	$(DRUSH) updb -y

entity-updates:
	$(DRUSH) entity-updates -y

cr:
	$(DRUSH) cr

phpcbf:
	./bin/phpcbf

phpcs:
	./bin/phpcs

test:
	./bin/phpunit

login:
	$(DRUSH) uli

.PHONY: list init devify updb entity-updates cr phpcbf phpcs test login
