echo $1
COPY=$(aws s3 cp s3://aws-batch-parameter/$1 /tmp/shotgun.txt)
LINE=$(sed -n 1p /tmp/shotgun.txt)
echo $LINE
VAR=( $LINE )
PROJECT_TYPE=${VAR[0]}
TYPE=${VAR[1]}
DELIVERY_ID=${VAR[2]}
MANIFEST_PATH=${VAR[3]}
echo $TYPE
echo $PROJECT_TYPE
echo $DELIVERY_ID
echo $MANIFEST_PATH
echo $(python ./pixit_update_status-master/pixitupdate.py $PROJECT_TYPE $TYPE $DELIVERY_ID $MANIFEST_PATH)
