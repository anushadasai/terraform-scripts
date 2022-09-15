autoscaling_average_cpu = 20
eks_managed_node_groups = {
  "my-app-eks-x86" = {
    ami_type     = "ami-052efd3df9dad4825"
    min_size     = 1
    max_size     = 4
    desired_size = 1
    instance_types = [
      "t3.medium"
    ]
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = true
    }]
  }
  "my-app-eks-arm" = {
    ami_type     = "ami-052efd3df9dad4825"
    min_size     = 1
    max_size     = 4
    desired_size = 1
    instance_types = [
      "t3.medium"
    ]
    capacity_type = "SPOT"
    network_interfaces = [{
      delete_on_termination       = true
      associate_public_ip_address = true
    }]
  }
}

cluster_name            = "my-eks-cluster"
iac_environment_tag     = "prod"
name_prefix             = "my-app"
main_network_block      = "10.0.0.0/16"
subnet_prefix_extension = 4
zone_offset             = 8

spot_termination_handler_chart_name      = "aws-node-termination-handler"
spot_termination_handler_chart_repo      = "https://aws.github.io/eks-charts"
spot_termination_handler_chart_version   = "0.18.1"
spot_termination_handler_chart_namespace = "kube-system"

external_dns_iam_role      = "external-dns"
external_dns_chart_name    = "external-dns"
external_dns_chart_repo    = "https://kubernetes-sigs.github.io/external-dns/"
external_dns_chart_version = "1.9.0"

external_dns_values = {
  "image.repository"   = "k8s.gcr.io/external-dns/external-dns",
  "image.tag"          = "v0.11.0",
  "logLevel"           = "info",
  "logFormat"          = "json",
  "triggerLoopOnEvent" = "true",
  "interval"           = "5m",
  "policy"             = "sync",
  "sources"            = "{ingress}"
}

admin_users     = ["anusha", "prasad"]
developer_users = ["harshini", "peter"]

dns_base_domain               = "mydomain.com"
ingress_gateway_name          = "aws-load-balancer-controller"
ingress_gateway_iam_role      = "load-balancer-controller"
ingress_gateway_chart_name    = "aws-load-balancer-controller"
ingress_gateway_chart_repo    = "https://aws.github.io/eks-charts"
ingress_gateway_chart_version = "1.4.1"

namespaces = ["sample-apps"]
