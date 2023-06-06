# Overview
Wrapper to check which regions a particular EC2 instance type is offerred. Note, this script does not actually provide the current available capacity, just provides information about the region an instance type is officially available in. Inspired from [this gist](https://gist.github.com/trestletech/f93d32e04c601b0584c0ce1a421e9948).


# Prerequisites
1. Make sure to have the latest AWS CLI installed. See [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
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
