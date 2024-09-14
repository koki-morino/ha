variable "prefix" {
  default = "mweb"
}

variable "domain" {}

variable "project" {}

variable "region_1" {
  # Tokyo
  default = "asia-northeast1"
}

variable "region_2" {
  # Osaka
  default = "asia-northeast2"
}

variable "region_3" {
  # Seoul
  default = "asia-northeast3"
}

variable "zone_1" {
  default = "asia-northeast1-a"
}

variable "zone_2" {
  default = "asia-northeast2-a"
}

variable "zone_3" {
  default = "asia-northeast3-a"
}

variable "service_port" {
  default = "8080"
}

variable "service_port_name" {
  default = "http"
}
