resource "tls_private_key" "etcdproxy" {
  algorithm = "RSA"
}

resource "tls_cert_request" "etcdproxy" {
  key_algorithm   = "RSA"
  private_key_pem = "${tls_private_key.kubeadmin.private_key_pem}"

  dns_names = [
    "kubernetes",
    "kubernetes.default",
    "kubernetes.default.svc",
    "kubernetes.default.svc.cluster.local",
    "*.*.compute.internal,*.ec2.internal",
    "localhost",
  ]

  ip_addresses = [
    "0.0.0.0",
    "127.0.0.1",
  ]

  subject {
    common_name  = "*"
    organization = "etcdproxy"
  }
}

resource "tls_locally_signed_cert" "etcdproxy" {
  cert_request_pem      = "${tls_cert_request.kubeadmin.cert_request_pem}"
  ca_key_algorithm      = "RSA"
  ca_private_key_pem    = "${tls_private_key.ca.private_key_pem}"
  ca_cert_pem           = "${tls_self_signed_cert.ca.cert_pem}"
  validity_period_hours = "${var.validity_period_hours}"
  early_renewal_hours   = "${var.early_renewal_hours}"

  allowed_uses = [
    "key_encipherment",
    "server_auth",
    "client_auth",
  ]
}

resource "null_resource" "etcdproxykey" {
  depends_on = ["tls_private_key.etcdproxy"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.kubeadmin.private_key_pem}' > ${path.cwd}/Certs/${var.etcdproxykey} && chmod 600 ${path.cwd}/Certs/${var.etcdproxykey}"
  }
}

resource "null_resource" "etcdproxypem" {
  depends_on = ["tls_locally_signed_cert.etcdproxy"]

  provisioner "local-exec" {
    command = "echo '${tls_locally_signed_cert.kubeadmin.cert_pem}' > ${path.cwd}/Certs/${var.etcdproxypem} && chmod 600 ${path.cwd}/Certs/${var.etcdproxypem}"
  }
}
