#!/bin/bash

SPARK_VERSION=spark-3.3.1
SPARK_TGZ=spark-3.3.1-bin-hadoop3.tgz
SPARK_HOME=/home/spark

wget https://dlcdn.apache.org/spark/$SPARK_VERSION/$SPARK_TGZ
tar zxvf $SPARK_TGZ
sudo mv ${SPARK_TGZ%".tgz"} $SPARK_HOME
sudo rm ./$SPARK_TGZ
sudo ln -s $SPARK_HOME/${SPARK_TGZ%".tgz"}/ $SPARK_HOME/spark

cat <<EOF | sudo tee -a ~/.bashrc
export SPARK_HOME=$SPARK_HOME
export PATH=\$SPARK_HOME/bin:\$PATH
export PYSPARK=/usr/bin/python3
export PYSPARK_DRIVER_PYTHON=jupyter
export PYSPARK_DRIVER_PYTHON_OPTS='notebook --ip=0.0.0.0'
EOF

source .bashrc