return {
    'nvim-tree/nvim-tree.lua',
    keys = {
        { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
    },
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
        local lib = require("nvim-tree.lib")
        local view = require("nvim-tree.view")


        local function collapse_all()
            require("nvim-tree.actions.tree-modifiers.collapse-all").fn()
        end

        local function edit_or_open()
            -- open as vsplit on current node
            local action = "edit"
            local node = lib.get_node_at_cursor()

            -- Just copy what's done normally with vsplit
            if node.link_to and not node.nodes then
                require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
                view.close() -- Close the tree if file was opened
            elseif node.nodes ~= nil then
                lib.expand_or_collapse(node)
            else
                require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
                view.close() -- Close the tree if file was opened
            end
        end

        local function vsplit_preview()
            -- open as vsplit on current node
            local action = "vsplit"
            local node = lib.get_node_at_cursor()

            -- Just copy what's done normally with vsplit
            if node.link_to and not node.nodes then
                require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
            elseif node.nodes ~= nil then
                lib.expand_or_collapse(node)
            else
                require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
            end

            -- Finally refocus on tree if it was lost
            view.focus()
        end

        local function change_root_to_global_cwd()
            local api = require("nvim-tree.api")
            local global_cwd = vim.fn.getcwd( -1, -1)
            api.tree.change_root(global_cwd)
        end
        require("nvim-tree").setup({
            actions = {
                open_file = {
                    quit_on_open = true,
                }
            },
            view = {
                mappings = {
                    custom_only = false,
                    list = {
                        { key = "l",     action = "edit",           action_cb = edit_or_open },
                        { key = "<C-C>", action = "global_cwd",     action_cb = change_root_to_global_cwd },
                        { key = "L",     action = "vsplit_preview", action_cb = vsplit_preview },
                        { key = "h",     action = "close_node" },
                        { key = "H",     action = "collapse_all",   action_cb = collapse_all }
                    }
                },
            },
            renderer = {
                indent_markers = {
                    enable = true,
                    inline_arrows = true,
                    icons = {
                        corner = "󰧟",
                        edge = "",
                        item = "",
                        bottom = "󰧟",
                        none = " ",
                    },
                },
                icons = {
                    webdev_colors = true,
                    git_placement = "before",
                    modified_placement = "after",
                    padding = " ",
                    symlink_arrow = " ➛ ",
                    show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                        modified = true,
                    },
                    glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "",
                        modified = "●",
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "",
                            unmerged = "",
                            renamed = "",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },

            },
        })
    end,
}
