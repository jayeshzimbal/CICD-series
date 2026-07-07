

resource "aws_s3_bucket" "demo" {
  bucket = "jayeshzimbal2708"

  tags = {
    Name = "jenkins-demo"
  }
}
