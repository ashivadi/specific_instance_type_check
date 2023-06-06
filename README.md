# Overview
Wrapper to check which regions a particular EC2 instance type is offerred. Note, this script does not actually provide the current available capacity, just provides information about region the instance type is officially available in.


# Prerequisites
1. Make sure to have tbe latest AWS CLI installed. See [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
2. Make sure you configured you AWS CLI with an IAM role / user that has enough permissions to execute the [DescribeInstanceTypeOfferings](https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonelasticcomputecloudec2.html#:~:text=DescribeInstanceTypeOfferings) API. This is the core API that is used in this wrapper.

# Setup
```
git clone https://github.com/ashivadi/specific_instance_type_check.git
cd specific_instance_type_check
chmod +x ./specific_instance_type_check.sh

```
# Usage

```
./specific_instance_type_check.sh <instance type>
```
# Example
```
./specific_instance_type_check.sh p4d.24xlarge
cat p4d.24xlarge
```
