resource "aws_s3_bucket" "kubebucket" {
  bucket = "${var.bucketname}"
  acl    = "private"

  tags {
    Name        = "Kubebucket"
    Environment = "Dev"
  }
}

resource "aws_kms_key" "kubekms" {
  description             = "KMS key 1"
  deletion_window_in_days = 7
  policy                  = "${data.template_file.kmspolicy.rendered}"
}

resource "aws_s3_bucket_object" "capem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.capem}"
  source     = "${path.cwd}/Files/${var.capem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "cakey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.cakey}"
  source     = "${path.cwd}/Files/${var.cakey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "etcdpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdpem}"
  source     = "${path.cwd}/Files/${var.etcdpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "etcdkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.etcdkey}"
  source     = "${path.cwd}/Files/${var.etcdkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "masterpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.masterpem}"
  source     = "${path.cwd}/Files/${var.masterpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "masterkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.masterkey}"
  source     = "${path.cwd}/Files/${var.masterkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "kubenodepem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.kubenodepem}"
  source     = "${path.cwd}/Files/${var.kubenodepem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "kubenodekey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.kubenodekey}"
  source     = "${path.cwd}/Files/${var.kubenodekey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "adminpem" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.adminpem}"
  source     = "${path.cwd}/Files/${var.adminpem}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}

resource "aws_s3_bucket_object" "adminkey" {
  depends_on = ["aws_s3_bucket.kubebucket", "aws_kms_key.kubekms"]
  bucket     = "${aws_s3_bucket.kubebucket.bucket}"
  key        = "${var.adminkey}"
  source     = "${path.cwd}/Files/${var.adminkey}"
  kms_key_id = "${aws_kms_key.kubekms.arn}"
}
