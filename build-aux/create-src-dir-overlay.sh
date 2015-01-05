# Creates directory structure overlay on top of original source directories so
# that the overlay matches Java package hierarchy.
#!/usr/bin/env bash

mkdir maven
cd maven
if [ ! -d src-main ]; then
  mkdir src-main
  (ln -s ../../build-aux/gen_build_data.sh src-main/)
  mkdir src-main/net
  mkdir src-main/tsd
  (cd src-main/net && ln -s ../../../src opentsdb)
  (cd src-main/tsd && ln -s ../../../src/tsd/QueryUi.gwt.xml QueryUi.gwt.xml)
  (cd src-main/tsd && ln -s ../../../src/tsd/client client)
fi
if [ ! -d src-test ]; then
  mkdir src-test
  mkdir src-test/net
  (cd src-test/net && ln -s ../../../test opentsdb)
fi

