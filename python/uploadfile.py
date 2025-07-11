import boto3
import logging

bucket_name = 'demo.s3.bucketmain'
file_path = 'test_file.txt'             # Local file to upload
s3_key = 'uploads/test_file.txt'       # Path in S3 S3



# Create an S3 client
s3 = boto3.client('s3')

try:
    s3.upload_file(file_path, bucket_name, s3_key)
    print(f"File uploaded successfullyy to s3://{bucket_name}/{s3_key}")
    logging.warning("Remain calm!")
except Exception as e:
    print(f"Upload failed: {e}")



    
