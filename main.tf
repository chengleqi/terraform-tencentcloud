terraform {
  required_providers {
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
      version = "1.71.0"
    }
  }
}

# Configure the TencentCloud Provider
provider "tencentcloud" {
  secret_id  = "your-secret_id"
  secret_key = "your-secret_key"
  region     = "ap-hongkong"
}


resource "tencentcloud_instance" "hk-server" {
  instance_name     = "hk-server"
  count = 1
  project_id        = 0
  availability_zone = "ap-hongkong-2"

  image_id = "img-l8og963d"
  instance_type = "SA2.MEDIUM4"
  instance_charge_type = "SPOTPAID"
  spot_instance_type = "ONE-TIME"
  spot_max_price = "1000"
  stopped_mode = "STOP_CHARGING"

  system_disk_type = "CLOUD_PREMIUM"
  system_disk_size  = 50
  
  vpc_id            = "vpc-bd3dq2wu"
  subnet_id = "subnet-ia4y504r"
  security_groups = [ "sg-byjly0v3" ]
  internet_charge_type = "TRAFFIC_POSTPAID_BY_HOUR"
  internet_max_bandwidth_out = 5
  allocate_public_ip = true

  key_name = "skey-frss4f15"
}

output "instance_ip_addr" {
  value = tencentcloud_instance.hk-server.0.public_ip
  description = "The public IP address of the hk-server"
}