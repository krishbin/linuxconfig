return {
    {
        'nvim-tree/nvim-tree.lua',
        lazy = true,
        opts = {
            auto_reload_on_write = true,
            disable_netrw = true,
            hijack_cursor = false,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            open_on_tab = false,
            sort_by = "name",
            update_cwd = false,
            view = {
                width = 30,
                side = "left",
                preserve_window_proportions = false,
                number = false,
                relativenumber = false,
                signcolumn = "yes",
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    icons = {
                        corner = "└ ",
                        edge = "│ ",
                        none = "  ",
                    },
                },
                icons = {
                    webdev_colors = true,
                },
            },
            diagnostics = {
                enable = true,
                show_on_dirs = false,
                icons = {
                    hint = "",
                    info = "",
                    warning = "",
                    error = "",
                },
            },
            filters = {
                dotfiles = false,
                custom = {},
                exclude = {},
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false,
                },
                open_file = {
                    quit_on_open = false,
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" },
                        },
                    },
                },
            },
        },
        keys = {
            { 
                '<leader>[', 
                function() 
                    local api = vim.api
                    local nvimtree = require('nvim-tree.api').tree
                    local opts = {
                        api.nvim_get_current_tabpage(),
                        false
                    }
                    if nvimtree.is_tree_buf() then
                        nvimtree.close()
                    elseif nvimtree.is_visible(opts) then
                        nvimtree.focus()
                    else
                        nvimtree.open()
                    end
                end,
                desc = 'NvimTree: open or focus view'

            },
            { 
                '<leader>q[', 
                function() require('nvim-tree.api').tree.close() end,
                desc = 'NvimTree: close view'

            },
        },
        config = function(_,opts)
            require('nvim-tree').setup(opts)
            -- auto close
            local function is_modified_buffer_open(buffers)
                for _, v in pairs(buffers) do
                    if v.name:match("NvimTree_") == nil then
                        return true
                    end
                end
                return false
            end

            vim.api.nvim_create_autocmd("BufEnter", {
                nested = true,
                callback = function()
                    if
                        #vim.api.nvim_list_wins() == 1
                        and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil
                        and is_modified_buffer_open(vim.fn.getbufinfo({ bufmodified = 1 })) == false
                    then
                        vim.cmd("quit")
                    end
                end,
            })
        end
    }
}
