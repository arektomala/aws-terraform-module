# aws-terraform

Terraform modules for AWS projects. 
Be careful using this project in other AWS projects. 
Each project should use this project by proper tag. 
Using improper tags may result in serious environmental issues.

Version/Tag:

v0.9.8 (2021-10-15)
- added iam_group
- added iam_group_policy_attachment
- added iam_group_policy_membership

v0.9.7 (2021-09-15)
- added cloudwatch metric alarm module

v0.9.6 (2021-08-18)
- added platform application module

v0.9.5 (2021-07-26)
- added media conversion module
- added cloudserach module

v0.9.4 (2021-06-07)
- change ASG tags from contat to each.value
- added cloudwatch module

v0.9.3 (2021-06-02)
- added additional certificate (lb_lis_cert module) to ALB

v0.9.2 (2021-05-21)
- changed type "schedule" from object to list of object for multiple scheduling

v0.9.1 (2021-05-18)
- changed lifecycle create_before_destroy for SG to false

v0.9 (2021-05-12)
- added VPNs

v0.8 (2021-04-30)
- added LifecycleManager

v0.7 (2021-03-30)
- fixed RDS parameters group variable "parameter" from object() to list(object())

v0.6 (2021-03-29)
- added RDS parameters group

v0.5 (2021-03-22)
Description:
- rebuild ACM module, module output

v0.4 (2021-03-19)
Terraform version 13.5
Description:
- added IAM modules

v0.3 (2021-03-17)
Terraform version 13.5
Description:
- added EBS Volume
- added EBS Volume attachment

v0.2 (2021-03-11)
Terraform version 13.5
Description:
- added lambda module
- added lambda_permission module

v0.1 (2021-03-09)
Terraform version 13.5
Description:
- Initial modules. Copied from SJ3 project. Missing lambda
