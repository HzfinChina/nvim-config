-- automatically run PackerCompile whenever plugins.lua is changed
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
-- Only required if you have packer configured as `opt`
return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- material theme
    use 'marko-cerovac/material.nvim'
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    --"iamcco/markdown-preview.nvim",
use {'iamcco/markdown-preview.nvim', run = [[sh -c 'cd app && yarn install']]}
    -- paste image from clipboard
    use 'ekickx/clipboard-image.nvim'
    -- switch to English when come back to normal mode from insert mode
    use { '520Matches/fcitx5.vim'}
    --float terminal
    use "numToStr/FTerm.nvim"
    --lsp
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    -- auto completation
    use {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'hrsh7th/cmp-cmdline', 'hrsh7th/nvim-cmp'}
    use{'SirVer/ultisnips','quangnguyen30192/cmp-nvim-ultisnips'}
    -- statusline 
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- bufferline on the top
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
    -- autopairs
    use {"windwp/nvim-autopairs"}
    -- Comment conveniently 
    use {'numToStr/Comment.nvim'}
    -- scroll bar
    use 'dstein64/nvim-scrollview'
    -- fuzzy search 
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim'
    }
    -- display possible keybinds 
    use "folke/which-key.nvim"
    -- write lilypond in neovim 
    use { 'martineausimon/nvim-lilypond-suite',
        requires =  'MunifTanjim/nui.nvim'
    }
    -- preview markdown and latex
    use "frabjous/knap"
end
)
