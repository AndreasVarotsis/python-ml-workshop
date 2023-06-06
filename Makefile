export

# Setting up your python environment - 3.10.6
PYTHON_VERSION=3.10.6

python-setup:
	LDFLAGS="-Wl,-rpath,$$(brew --prefix openssl)/lib" \
	CPPFLAGS="-I$$(brew --prefix openssl)/include" \
	CONFIGURE_OPTS="--with-openssl=$$(brew --prefix openssl)" \
	pyenv install --skip-existing $(PYTHON_VERSION)
	pyenv local $(PYTHON_VERSION)

# Virtual environments
# N.B. have to create your .env file first and add the GEMFURY_URL
reqs:
	pip install -r requirements.txt 
	@echo "========================"
	@echo "Virtual environment successfully created. To activate the venv:" 
	@echo "	\033[0;32msource .venv/bin/activate"


## Using venv
venv:
	pyenv exec python -m venv .venv
	. .venv/bin/activate && \
	make reqs