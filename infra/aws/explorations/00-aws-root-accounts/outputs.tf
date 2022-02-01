

# Display the entire created org resource

output "org_unit_caleb" {
  value = aws_organizations_organizational_unit.caleb
}



# Display the entire created org management account

output "org_unit_caleb_account" {
  value = aws_organizations_account.caleb
}
