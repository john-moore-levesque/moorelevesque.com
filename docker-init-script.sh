#!/bin/bash
OPT=$1
start_containers () {
	docker-compose -f docker-compose.$1.yml build
	docker-compose -f docker-compose.$1.yml up -d
	docker-compose -f docker-compose.$1.yml exec web python manage.py collectstatic --noinput
	docker-compose -f docker-compose.$1.yml exec web python manage.py makemigrations --noinput
	docker-compose -f docker-compose.$1.yml exec web python manage.py migrate --noinput
}

stop_containers () {
	docker-compose -f docker-compose.$1.yml down -v
}

case $OPT in
	start-dev)
		start_containers dev
		;;
	start-stage)
		start_containers stage
		;;
	start-prod)
		start_containers prod
		;;
	stop-dev)
		stop_containers dev
		;;
	stop-stage)
		stop_containers stage
		;;
	stop-prod)
		stop_containers prod
		;;
	*)
		echo "Invalid choice: $OPT"
		echo "Usage: docker-init-script.sh start-dev|start-stage|start-prod|stop-dev|stop-stage|stop-prod"
		;;
esac
