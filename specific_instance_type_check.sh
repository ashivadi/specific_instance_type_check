#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: ./check-instance-type.sh <instance_type>"
  exit 1
fi

# Instance type to check
instance_type="$1"

echo "Getting list of Availability Zones"
all_regions=$(aws ec2 describe-regions --output text --query 'Regions[*].[RegionName]' | sort)

while read -r region; do
  az_per_region=$(aws ec2 describe-availability-zones --region $region --query 'AvailabilityZones[*].[ZoneName]' --output text | sort)

  while read -r az; do
    echo "Checking Availability Zone $az in $region for instance type $instance_type"

    # Check if instance type exists in the AZ
    if aws ec2 describe-instance-type-offerings --location-type availability-zone --filters "Name=location,Values=$az" "Name=instance-type,Values=$instance_type" --region $region --output text --query 'InstanceTypeOfferings' | grep -q "$instance_type"; then
      echo "$region;$az;$instance_type" >> $instance_type.csv
      echo "Instance type $instance_type found in $az"
    else
      echo "Instance type $instance_type not found in $az"
    fi

  done <<< "$az_per_region"
done <<< "$all_regions"

