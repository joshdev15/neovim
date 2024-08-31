-- Gruvbox Theme
-- Background -- [hard, medium, soft]
vim.g.gruvbox_material_background = 'hard'
-- Foreground -- [material, mix, original]
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_ui_contrast = 'low'
vim.g.gruvbox_material_visual = 'red background'
vim.g.gruvbox_material_current_word = 'italic'
vim.g.gruvbox_material_transparent_background = 2
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_dim_inactive_windows = 1
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_better_performance = 1

-- Vim JSX Pretty
vim.g.vim_jsx_pretty_colorful_config = 0

-- Vim-Go Plugin Config
vim.g.go_fmt_command = "goimports"
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
vim.g.go_highlight_build_constraints = 1
vim.g.go_def_mode = 'gopls'
vim.g.go_info_mode = 'gopls'
vim.g.go_doc_popup_window = 1
vim.g.go_def_reuse_buffer = 0

-- NERDTree Config
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeIgnore = {'node_modules', '.next', 'coverage'}
vim.g.NERDTreeWinSize = 35
vim.g.NERDTreeDirArrowExpandable = "→" -- disable on mac
vim.g.NERDTreeDirArrowCollapsible = "↓" -- disable on mac
 
-- NERDCommenter Config
vim.g.NERDSpaceDelims = 1  
vim.g.NERDTrimTrailingWhitespace = 1 
vim.g.NERDCompactSexyComs = 1

-- GitGutter Config
vim.g.gitgutter_sign_added = "∣" 
vim.g.gitgutter_sign_modified = "∣"
vim.g.gitgutter_sign_removed = "›"
vim.g.gitgutter_sign_removed_first_line = "𝟷"
vim.g.gitgutter_sign_removed_above_and_below = "↕"
vim.g.gitgutter_sign_modified_removed = "∣"

-- Dart Vim
vim.g.dart_format_on_save = true
