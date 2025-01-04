local U = {}

function U.is_in_list(value, list)
  for _, v in ipairs(list) do
    if v == value then
      return true
    end
  end
  return false
end

return U
