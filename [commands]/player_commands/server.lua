RegisterCommand('delobjs', function ()
  local objects = GetAllObjects()
  for k, v in pairs(objects) do 
    DeleteEntity(v)
  end
end)



