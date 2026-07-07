

resource "aws_s3_bucket" "demo" {
  bucket = "jayeshzimbal01"

  tags = {
    Name = "jenkins-demo"
  }
}
