ssh -i $3   $2 "mkdir ~/deploymentContainer_$1"
scp -i $3   ../"deploymentContainer_"$1".zip" $2:~/"deploymentContainer_$1"