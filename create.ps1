$REGION="us-east-1"
$ACCOUNT_ID=(aws sts get-caller-identity --query Account --output text)
$BUCKET="scf-terraform-lab-tfstate-$ACCOUNT_ID-$REGION"
$TABLE="scf-terraform-lab-tflock"

# 1) S3 bucket (us-east-1 não usa LocationConstraint)
aws s3api create-bucket --bucket $BUCKET --region $REGION

# 2) Block Public Access
aws s3api put-public-access-block --bucket $BUCKET --public-access-block-configuration `
  BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

# 3) Versioning
aws s3api put-bucket-versioning --bucket $BUCKET --versioning-configuration Status=Enabled

# 4) Default encryption (SSE-S3)
aws s3api put-bucket-encryption --bucket $BUCKET --server-side-encryption-configuration `
'{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

# 5) DynamoDB lock table (PK LockID string)
aws dynamodb create-table --region $REGION --table-name $TABLE `
  --attribute-definitions AttributeName=LockID,AttributeType=S `
  --key-schema AttributeName=LockID,KeyType=HASH `
  --billing-mode PAY_PER_REQUEST

aws dynamodb wait table-exists --region $REGION --table-name $TABLE

"BUCKET=$BUCKET"
"TABLE=$TABLE"
