

resource "aws_s3_bucket" "demo" {
  bucket = "jayeshzimbal"

  tags = {
    Name = "jenkins-demo"
  }
}
