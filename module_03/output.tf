# PUBLIC SECURITY GROUP
output "sg_pub_id" {
  value = aws_security_group.sg_pub.id
}

# PRIVATE SECURITY GROUP
output "sg_priv_id" {
  value = aws_security_group.sg_priv.id
}