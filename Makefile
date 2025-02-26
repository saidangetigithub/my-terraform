dev:
	rm -rf .terraform
	terraform init -backend-config=dev-env/state.tfvars
	terraform apply -auto-approve -var-file=dev-env/inputs.tfvars

prod:
	rm -rf .terraform
	terraform init -backend-config=prod-env/state.tfvars
	terraform apply -auto-approve -var-file=prod-env/inputs.tfvars

dev-destroy:
	rm -rf .terraform
	terraform init -backend-config=dev-env/state.tfvars
	terraform destroy -auto-approve -var-file=dev-env/inputs.tfvars

prod-destroy:
	rm -rf .terraform
	terraform init -backend-config=prod-env/state.tfvars
	terraform destroy -auto-approve -var-file=prod-env/inputs.tfvars



