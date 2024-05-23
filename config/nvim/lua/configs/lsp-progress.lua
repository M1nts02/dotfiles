local M = {}

M.opts = {
  spinner = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" },
  spin_update_time = 500,
  format = function(client_messages)
    if #client_messages > 0 then
      return table.concat(client_messages, " ")
    end
    return ""
  end,
}

return M
