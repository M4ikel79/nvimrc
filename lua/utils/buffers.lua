local M = {}

function M.goto_buffer(n)
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
  if bufs[n] then
    vim.api.nvim_set_current_buf(bufs[n])
  end
end

function M.goto_last_buffer()
  local bufs = vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
  if #bufs > 0 then
    vim.api.nvim_set_current_buf(bufs[#bufs])
  end
end

return M
