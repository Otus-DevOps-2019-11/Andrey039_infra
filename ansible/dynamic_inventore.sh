#!/bin/bash
path_to_terraform='../terraform/stage'
cd $path_to_terraform
app_ip=`terraform output app_external_ip`
db_ip=`terraform output db_external_ip`

cat<<EOF
{
    "app": {
        "hosts": ["$app_ip"],
    },
    "db": {
        "hosts": ["$db_ip"],
    },
    "_meta": {
            "hostvars": {}
        }
}
EOF


