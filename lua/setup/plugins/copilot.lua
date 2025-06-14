local prompts = {
	-- Code related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	FixError = "Please explain the error in the following text and provide a solution.",
	BetterNamings = "Please provide better names for the following variables and functions.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}

return {
	{ "github/copilot.vim", event = "VeryLazy" },

	{
		"CopilotC-Nvim/CopilotChat.nvim",
		event = "VeryLazy",
		opts = {
			show_help = "yes",
			prompts,
			model = 'claude-3.5-sonnet', -- GPT model to use, see ':CopilotChatModels' for available models
		},
		keys = {
			{ ";ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code",  mode = { "v" } },
			{ ";ct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
			{
				";cc",
				":CopilotChatToggle<CR>",
				mode = { "n", "x" },
				desc = "CopilotChat",
			},
			{
				";cf",
				"<cmd>CopilotChatFixError<cr>", -- Get a fix for the diagnostic message under the cursor.
				desc = "CopilotChat - Fix Diagnostic",
			},
		}
	},
}
