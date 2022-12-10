local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

-- ?
protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  capabilities = capabilities
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settigns = {
    Lua = {
      diagnostics = {
        -- server is aware of nvim runtime files
        globals = { 'vim' }
      },

      workspace = {
        -- make server aware of nvim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}

nvim_lsp.html.setup {}

nvim_lsp.gopls.setup {
  on_attach = on_attach,
  filetypes = { "go", "gomod" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true
    }
  }
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    checkOnSave = {
      command = "clippy",
    }
  }
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '● '
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    --bufmap('n', ';h', '<cmd>lua vim.lsp.buf.hover()<CR>')
    --bufmap('n', ';gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    --bufmap('n', ';i', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  end
})
