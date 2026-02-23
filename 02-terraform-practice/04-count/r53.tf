resource "aws_route53_record" "www" {
    count = length(var.instances)
  zone_id = "Z0640359289EXKJ3M72KE"
  name    = "${var.instances[count.index]}.${var.domain_name}"  #mongodb.daws88-s.online
  type    = "A"
  ttl     = 300
  records = [aws_instance.roboshop[count.index].private_ip]
  allow_overwrite = true
}

