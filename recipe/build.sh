# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2018, 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************
#!/bin/bash
set -ex

bazel build //tensorflow_estimator/tools/pip_package:build_pip_package
# build a whl file
mkdir -p $SRC_DIR/tensorflow_estimator_pkg
bazel-bin/tensorflow_estimator/tools/pip_package/build_pip_package $SRC_DIR/tensorflow_estimator_pkg

# install using pip from the whl file
pip install --no-deps $SRC_DIR/tensorflow_estimator_pkg/*.whl

bazel clean --expunge
bazel shutdown
