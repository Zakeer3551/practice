/* resource "aws_route53_record" "www" {
  for_each = aws_instance.roboshop
  zone_id         = "Z0640359289EXKJ3M72KE"
  name            = "${each.key}.${var.domain_name}" #mongodb.daws88-s.online
  type            = "A"
  ttl             = 300 # this is example for for_each particularly for toset type (list type)
  records         = [aws_instance.roboshop[each.key].private_ip] # this other also works [each.value.private_ip] 
  allow_overwrite = true
} */


resource "aws_route53_record" "www" {
  for_each        = aws_instance.roboshop
  zone_id         = "Z0640359289EXKJ3M72KE"
  name            = "${each.key}.${var.domain_name}" #mongodb.daws88-s.online
  type            = "A"
  ttl             = 300                     # this is example for for_each particularly for tomap type (map type)
  records         = [each.value.private_ip] # this other also works  [aws_instance.roboshop[each.key].public_ip]
  allow_overwrite = true
}
