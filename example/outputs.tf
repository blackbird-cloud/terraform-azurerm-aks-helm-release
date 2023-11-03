output "helm_release" {
  value       = module.helm_release.helm_release
  description = "The installed Helm release."
}
