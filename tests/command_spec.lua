---@diagnostic disable: undefined-field
local assert = require('luassert')
local stub = require('luassert.stub')
local spy = require('luassert.spy')

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
        match_test = '#0000ff',
      }
      local bg_hex = '#000000'
      local opts = {
        mode = 'dark',
        h = 0.5,
        s = 0,
        l = 0,
      }

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

  describe('.setup()', function()
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

    describe('ori.command', function()
      before_each(function()
        for mod, _ in pairs(package.loaded) do
          if mod:match('^ori%.') then
            package.loaded[mod] = nil
          end
        end

        hl_mock = {
          to_rgb = stub.new().returns({ 255, 255, 255 }),
          combine = stub.new().returns(function(t, _)
            return t[1], t[2], t[3]
          end),
          estimate_bg_mode = stub.new().returns('dark'),
        }
        file_mock = {
          write = stub.new().returns(true, 'File created successfully'),
        }
        config_mock = {
          opts = {
            theme = { dark = 'dark', light = 'light' },
            background = 'dark',
          },
        }

        package.loaded['ori.colors.dark'] = { bg = '#000000', fg = '#ffffff' }

        colors_mock = {
          get_modname = stub.new().returns('ori.colors.dark'),
        }

        package.loaded['ori.highlight'] = hl_mock
        package.loaded['ori.file'] = file_mock
        package.loaded['ori.config'] = config_mock
        package.loaded['ori.colors'] = colors_mock

        command = require('ori.command')
      end)

      describe('interactive_wizard (via OriCreatePalette)', function()
        it('should complete the full wizard flow and save the file', function()
          local input_stub = stub(vim.ui, 'input')
          local confirm_stub = stub(vim.fn, 'confirm').returns(2)
          local notify_stub = stub(vim, 'notify')

          local ori_mock = { load = spy.new() }
          package.loaded['ori'] = ori_mock

          local create_cb = nil
          create_cmd_stub = stub(vim.api, 'nvim_create_user_command', function(name, cb, _)
            if name == 'OriCreatePalette' then
              create_cb = cb
            end
          end)

          command.setup('ori.nvim', { 'dark', 'light' })
          assert.is_not_nil(create_cb, 'OriCreatePalette callback was not captured')
          local name = 'my_theme'

          local inputs = {
            name,
            '#1a1b26',
            '5',
            '0',
            '0',
          }
          local input_idx = 0
          input_stub.invokes(function(_, cb)
            input_idx = input_idx + 1
            cb(inputs[input_idx])
          end)

          create_cb({ args = '' })

          assert.stub(file_mock.write).was_called(1)

          local write_call = file_mock.write.calls[1]
          assert.is_true(write_call.vals[1]:find(name .. '.lua$') ~= nil)

          assert.spy(ori_mock.load).was_called_with(name)

          assert
            .stub(notify_stub)
            .was_called_with('Palette created: ' .. name, vim.log.levels.INFO, { title = 'ori.nvim' })

          input_stub:revert()
          confirm_stub:revert()
          notify_stub:revert()
          create_cmd_stub:revert()
        end)
      end)
    end)
  end)
end)
