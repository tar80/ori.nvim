---@diagnostic disable: undefined-field
local assert = require('luassert')
local stub = require('luassert.stub')

describe('command', function()
  local command, hl_mock, file_mock, config_mock, colors_mock

  before_each(function()
    package.loaded['ori.command'] = nil
    package.loaded['ori.highlight'] = nil
    package.loaded['ori.file'] = nil
    package.loaded['ori.config'] = nil
    package.loaded['ori.colors'] = nil

    hl_mock = {
      to_rgb = stub.new().returns({ 0, 0, 0 }),
      combine = stub.new().returns(function(t, _)
        return t[1], t[2], t[3]
      end),
      estimate_bg_mode = stub.new().returns('dark'),
    }
    file_mock = { write = stub.new().returns(true, 'Success') }
    config_mock = { opts = { theme = { dark = 'dark', light = 'light' } } }
    colors_mock = { get_modname = stub.new().returns('ori.colors.dark') }

    package.loaded['ori.highlight'] = hl_mock
    package.loaded['ori.file'] = file_mock
    package.loaded['ori.config'] = config_mock
    package.loaded['ori.colors'] = colors_mock

    command = require('ori.command')
  end)

  describe('.harmonize_palette()', function()
    it('should transform palette colors based on background and options', function()
      local palette = {
        bg = '#1e1e1e',
        fg = '#ffffff',
        match_test = '#ff0000',
      }
      local bg_hex = '#000000'
      local opts = { mode = 'dark', h = 0.1, s = 0, l = 0 }

      local result = command.harmonize_palette(palette, bg_hex, opts)

      assert.is_table(result)
      assert.are.equal('local palette = {', result[2])

      local found_bg = false
      for _, line in ipairs(result) do
        if line:find('bg = "#000000"') then
          found_bg = true
        end
      end
      assert.is_true(found_bg)
    end)
  end)

  describe('.setup() and commands', function()
    local create_cmd_stub

    before_each(function()
      create_cmd_stub = stub(vim.api, 'nvim_create_user_command')
    end)

    after_each(function()
      create_cmd_stub:revert()
    end)

    it('should register all three user commands', function()
      command.setup('ori.nvim', { 'dark', 'light' })

      assert.stub(create_cmd_stub).was_called(3)
    end)

    it('OriCreatePalette should handle user input cancellation', function()
      local input_stub = stub(vim.ui, 'input', function(_, cb)
        cb('')
      end)
      local notify_stub = stub(vim, 'notify')

      command.setup('ori.nvim', { 'dark', 'light' })

      local create_cb = nil
      for _, call in ipairs(create_cmd_stub.calls) do
        if call.vals[1] == 'OriCreatePalette' then
          create_cb = call.vals[2]
          break
        end
      end

      if create_cb then
        create_cb()
      end

      assert.stub(notify_stub).was_called()
      local last_call = notify_stub.calls[#notify_stub.calls]
      assert.are.equal('ori.nvim', last_call.vals[3].title)

      input_stub:revert()
      notify_stub:revert()
    end)
  end)
end)
