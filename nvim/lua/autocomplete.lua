-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- clang, compile-commands complicated? https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
-- cmake, 'pip install cmake-language-server' https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cmake
-- jsonnet_ls, 'go install github.com/grafana/jsonnet-language-server@latest' https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonnet_ls
-- terraformls, 'go compile locally' https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#terraformls
-- pylsp, 'pip install python-lsp-server' https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = { 'clangd', 'cmake', 'gopls', 'pylsp', 'terraformls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

require 'lspconfig'.jsonnet_ls.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
    capabilities = capabilities,
}

require 'lspconfig'.lua_ls.setup {
    on_init = function(client)
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = { version = 'LuaJIT' },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME}
            },
        })
    end,
    settings = {
        Lua = {}
    },
    capabilities = capabilities,
}

-- luasnip setup
local luasnip = require 'luasnip'

vim.lsp.buf.format {
    filter = function(client) return client.name ~= "jsonnet_ls" end
    }

-- Auto Format
vim.api.nvim_create_autocmd('BufWritePre', {
	buffer = vim.fn.bufnr(),
	callback = function()
		vim.lsp.buf.format({ timeout_ms = 3000 })
	end,
})

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
        ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
        -- C-b (back) C-f (forward) for snippet placeholder navigation.
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
    },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<Leader>d', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<Leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<Leader>re', vim.lsp.buf.references, opts)
  end,
})

local function sign_define(args)
  vim.fn.sign_define(args.name, {
    texthl = args.name,
    text = args.text,
    numhl = ''
  })
end

sign_define({name = 'DiagnosticSignError', text = ''})
sign_define({name = 'DiagnosticSignWarn', text = ''})
sign_define({name = 'DiagnosticSignHint', text = ''})
sign_define({name = 'DiagnosticSignInfo', text = ''})
