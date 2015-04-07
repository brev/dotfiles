export AWS_CREDENTIAL_FILE=$HOME/.aws/aws_cred

export AWS_ACCESS_KEY=`grep -i AWSAccessKeyID $AWS_CREDENTIAL_FILE | tail -1 | awk -F= '{print $2}'`
export AWS_SECRET_KEY=`grep -i AWSSecretKey $AWS_CREDENTIAL_FILE | tail -1 | awk -F= '{print $2}'`
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY
export EC2_HOME=/usr/local/lib/ec2-api-tools
export PATH=$PATH:$EC2_HOME/bin

function aws_key () { echo "$AWS_ACCESS_KEY_ID" | pbcopy; }
function aws_secret () { echo "$AWS_SECRET_ACCESS_KEY" | pbcopy; }
