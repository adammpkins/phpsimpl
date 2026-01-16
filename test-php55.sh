#!/bin/bash
# Test runner for PHP 5.5 environment (current production baseline)

set -e

echo "=================================================="
echo "Running tests on PHP 5.5 (Current Production)"
echo "=================================================="

# Ensure MariaDB and PHP 5.5 containers are running
docker-compose --profile php55 up -d mariadb php55

echo "Waiting for MariaDB to be ready..."
sleep 5

# Initialize database if needed
docker exec -i phpsimpl_mariadb mysql -utest_user -ptest_pass phpsimpl_test < test-app/database.sql 2>/dev/null || true

echo ""
echo "Running PEST tests in PHP 5.5 container..."
echo ""

# Run tests in PHP 5.5 container
docker-compose exec php55 ./vendor/bin/pest "$@"

echo ""
echo "=================================================="
echo "PHP 5.5 Tests Complete"
echo "=================================================="
