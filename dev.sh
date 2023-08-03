#!/bin/bash
python manage.py migrate
python manage.py loaddata fixtures/census/wazimap_django_models.json
python manage.py compilescss
python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:5000
