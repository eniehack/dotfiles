##
# Org-mode Duplicity Sync
#
# @file
# @version 0.1

build:
	mkdir -p build
	m4 config.sh.m4 > build/config
	cp fetch.sh build/fetch
	cp push.sh build/push

clean:
	rm -rf build

install:
	cp build/config ${PREFIX}duporg-config
	cp build/push ${PREFIX}duporg-push
	cp build/fetch ${PREFIX}duporg-fetch
	#chmod u+x build/config
	chmod 755 ${PREFIX}duporg-push
	chmod 755 ${PREFIX}duporg-fetch

# end
