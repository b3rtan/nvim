return {
  'yacineMTB/dingllm.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local llm = require 'dingllm'

    local system_prompt =
      'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks'
    local helpful_prompt =
      'You are a helpful assistant. Do not give me code. What I have sent are my notes so far. You will begin on a new line when theres exactly 15 words, so i can read the response entirely without having to zoom out.'

    local function anthropic_help()
      llm.invoke_llm_and_stream_into_editor({
        url = 'https://api.anthropic.com/v1/messages',
        model = 'claude-3-5-sonnet-20240620',
        api_key_name = 'ANTHROPIC_API_KEY',
        system_prompt = helpful_prompt,
        replace = false,
      }, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
    end

    local function anthropic_replace()
      llm.invoke_llm_and_stream_into_editor({
        url = 'https://api.anthropic.com/v1/messages',
        model = 'claude-3-5-sonnet-20240620',
        api_key_name = 'ANTHROPIC_API_KEY',
        system_prompt = system_prompt,
        replace = true,
      }, llm.make_anthropic_spec_curl_args, llm.handle_anthropic_spec_data)
    end

    vim.keymap.set({ 'n', 'v' }, '<leader>h', anthropic_help, { desc = 'llm anthropic_help' })
    vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_replace, { desc = 'llm anthropic' })
  end,
}
