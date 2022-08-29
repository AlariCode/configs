require('bufferline').setup {
    options = {
        diagnostics = false,
        modified_icon = '~',
        offsets = {
            {
                filetype = "NvimTree", 
                text = "File Explorer",
                text_align = "center",
                highlight = "NvimTreeNormal"
            }
        },
        show_buffer_icons = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = false,
        -- hide separators
        separator_style = {'',''},
    },
    highlights = {
        fill = {
            fg = {
                attribute = 'fg',
                highlight = 'NvimTreeNormal'
            },
            bg = {
                attribute = 'bg',
                highlight = 'NvimTreeNormal'
            }
        },
        -- style of unselected buffers
        background = {
            bg = {
                attribute = 'bg',
                highlight = 'NvimTreeNormal'
            }
        },
        -- selected buffer, but not focused. Ex: nvim-tree has focus
        -- a little wonky when two+ buffers are selected (splits)
        buffer_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'BufferLineBufferSelected'
            }
        },
    }
}
