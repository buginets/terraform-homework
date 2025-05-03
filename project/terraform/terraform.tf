terraform {
  backend "s3" {
    bucket = "kaizen-adilet-b"
    key    = "terraform.tfstate"
    region = "ca-central-1"
  }
}
