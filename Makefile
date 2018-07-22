TARGET_PHANTOMJS=phantomjs-2.1.1-linux-x86_64
TARGET_PHANTOMJS_EXT=.tar.bz2

download-dependencies:
	@if [ ! -d bin ]; then \
		mkdir bin; \
	fi
	wget https://bitbucket.org/ariya/phantomjs/downloads/${TARGET_PHANTOMJS}${TARGET_PHANTOMJS_EXT} -O bin/${TARGET_PHANTOMJS}${TARGET_PHANTOMJS_EXT}
	tar jxvf bin/${TARGET_PHANTOMJS}${TARGET_PHANTOMJS_EXT} -C bin/
	mv bin/${TARGET_PHANTOMJS}/bin/phantomjs bin/
	rm bin/${TARGET_PHANTOMJS}${TARGET_PHANTOMJS_EXT}
	rm -rf bin/${TARGET_PHANTOMJS}

init: download-dependencies
	pipenv install

docker-build:
	pipenv lock -r > requirements.txt
	docker-compose build

docker-run:
	docker-compose run lambda lambda_function.lambda_handler
