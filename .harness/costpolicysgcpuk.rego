package terraform_plan_cost
deny[msg] {
    input.PercentageChangeTotalMonthlyCost > 200
    msg := "The estimated cost for this plan is 25% larger than the previous plan."
}

