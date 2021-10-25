json.data do
  json.diet_plan do
    json.title @plan.title
    json.description @plan.description
    json.end_date @plan.end_date
  end
end
