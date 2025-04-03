return {
	"tpope/vim-commentary",
	config = function ()
		vim.keymap.set("v", "<leader>/", "gc", { remap = true })
		vim.keymap.set("n", "<leader>/", "gcc", { remap = true })
	end
}
