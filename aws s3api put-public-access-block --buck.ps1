aws s3api put-public-access-block --bucket irisgallagher.com --public-access-block-configuration '{
    "BlockPublicAcls": false,
    "IgnorePublicAcls": false,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
}'

aws s3api put-bucket-policy --bucket irisgallagher.com --policy '{
    "Version": "2012-10-17",
    "Id": "Policy123456789",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::irisgallagher.com/*"
        }
    ]
}'

aws s3 website s3://irisgallagher.com/ --index-document index.html

aws s3api put-public-access-block --bucket www.irisgallagher.com --public-access-block-configuration '{
    "BlockPublicAcls": false,
    "IgnorePublicAcls": false,
    "BlockPublicPolicy": false,
    "RestrictPublicBuckets": false
}'

aws s3api put-bucket-website --bucket www.irisgallagher.com --website-configuration '{
    "RedirectAllRequestsTo": {
        "HostName": "irisgallagher.com",
        "Protocol": "http"
    }
}'
