variable "pjname" {}
variable "location" {}
variable "vnet_cidr" {}
variable "subnet_cidrs" {}
variable "subnet_names" {}
variable "static_web_index_document" {}
variable "static_web_error_404_document" {}
variable "aks_kubernetes_version" {}
variable "aks_node_vm_size" {}
variable "aks_node_os_disk_size_gb" {}
variable "aks_node_max_count" {}
variable "aks_node_min_count" {}
variable "aks_node_count" {}
variable "aks_node_availability_zones" {}
variable "aks_max_pods" {}
variable "aks_log_analytics_workspace_retention_in_days" {}
variable "front_door_session_affinity_enabled" {}
variable "istio_ig_lb_ip" {}
variable "service_api_path_pattern" {}
variable "web_http_port_range" {}
