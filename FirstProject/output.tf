output "ARN" {
  value = aws_instance.MyLab.arn
}
output "ID" {
  value = aws_instance.MyLab.id
}
output "DNS_PUBLIC" {
  value = aws_instance.MyLab.public_dns
}
output "IP_PUBLIC" {
  value = aws_instance.MyLab.public_ip
}