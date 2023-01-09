function ColorMyPencils(color)
	color = color or "carbonfox"
	vim.cmd.colorscheme(color)


	-- For transparent background
	--vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"})
end

ColorMyPencils()
