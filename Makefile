.PHONY: install clean format lint check

install:
	@echo "Installing deps via poetry..."
	poetry install
	@echo "Installing pre-commit hooks..."
	poetry run pre-commit install --hook-type commit-msg
	poetry run pre-commit install

clean:
	@echo "Cache cleaning..."
	poetry run pre-commit clean
	find . -type d -name '__pycache__' -exec rm -rf {} +
	find . -type f -name '*.pyc' -delete
	find . -type f -name '*.pyo' -delete

format:
	@echo "Formatting with isort and black..."
	poetry run isort .
	poetry run black .

lint:
	@echo "Linting with flake8..."
	poetry run flake8 src

check:
	@echo "Run all pre-commit hooks..."
	poetry run pre-commit run --all-files
