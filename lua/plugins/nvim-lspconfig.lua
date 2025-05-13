return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lsp_config = require "lspconfig"
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local blink_cmp = require "blink.cmp"

    local capabilities = blink_cmp.get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

    local on_attach = function(_, bufnr)
      local opts = {
        noremap = true,
        silent = true,
        buffer = bufnr,
      }

      local map = vim.keymap.set

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>e", vim.diagnostic.open_float, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
    end

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls", "ts_ls",
        "emmet_language_server", "eslint",
        "pyright"
      },
      handlers = {
        function(server_name)
          local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
          }

          if server_name == "lua_ls" then
            local util = require("lspconfig.util")
            opts.settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = {
                    vim.fn.expand "$VIMRUNTIME/lua",
                    vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
                    "${3rd}/luv/library",
                  },
                  maxPreload = 100000,
                  preloadFileSize = 10000,
                },
              },
            }
          end

          lsp_config[server_name].setup(opts)
        end,
      }
    })

    -- mason_lspconfig.setup_handlers({
    --   function(server_name)
    --     local opts = {
    --       on_attach = on_attach,
    --       capabilities = capabilities,
    --     }

    --     if server_name == "lua_ls" then
    --       local util = require("lspconfig.util")
    --       opts.settings = {
    --         Lua = {
    --           diagnostics = {
    --             globals = { "vim" },
    --           },
    --           workspace = {
    --             library = {
    --               vim.fn.expand "$VIMRUNTIME/lua",
    --               vim.fn.expand "$VIMRUNTIME/lua/vim/lsp",
    --               "${3rd}/luv/library",
    --             },
    --             maxPreload = 100000,
    --             preloadFileSize = 10000,
    --           },
    --         },
    --       }
    --     end

    --     lsp_config[server_name].setup(opts)
    --   end,
    -- })
  end
}
