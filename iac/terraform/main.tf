module "dnd-ingestion" {
    source = "git@github.com:descomplicando-terraform/terraform-aws-env_module.git"
    name = "dnd-ingest"
    environment = "Prod"
    region_source = "us-east-2"
    bucket_name = "dnd-data-dan"
    user_data = file("${path.module}/../user_data.sh")
    instance_type = "t2.micro"

}