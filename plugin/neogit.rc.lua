local status, neogit = pcall(require, "neogit")
if (not status) then return end

neogit.setup {
  commit_popup = {
    kind = "tab"
  },
  popup = {
    kind = "tab"
  },
}
