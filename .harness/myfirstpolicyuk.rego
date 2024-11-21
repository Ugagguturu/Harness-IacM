package terraform_plan

allowed_instance_types  = ["e2-small", "e2-medium"]

deny[sprintf("%s: instance type %s is not allowed", [r.address, r.values.instance_type])] {
	r = input.planned_values.root_module.resources[_]
	r.type == "gcp_instance"
}

contains(arr, elem) {
	arr[_] = elem
}

