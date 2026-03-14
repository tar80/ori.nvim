---@diagnostic disable: param-type-mismatch, undefined-field
local assert = require('luassert')
local stub = require('luassert.stub')
local match = require('luassert.match')

describe('Ori', function()
  local ori, config_mock, integrations_mock, colors_mock, command_mock

  before_each(function()
    for k, _ in pairs(package.loaded) do
      if k:match('^ori') then
        package.loaded[k] = nil
      end
    end

    local test_colors = { bg = '#000000', fg = '#ffffff' }

    config_mock = {
      setup = stub.new().returns({
        theme = { dark = 'dark', light = 'light' },
        transparent = {},
        custom_highlights = { dark = {}, light = {} },
      }),
      opts = {
        theme = { dark = 'dark', light = 'light' },
        transparent = {},
        custom_highlights = { dark = {}, light = {} },
      },
    }
    integrations_mock = { get_highlights = stub.new().returns({}) }
    colors_mock = { load = stub.new().returns('palette_data', test_colors) }
    command_mock = { setup = stub.new() }

    package.loaded['ori.config'] = config_mock
    package.loaded['ori.integrations'] = integrations_mock
    package.loaded['ori.colors'] = colors_mock
    package.loaded['ori.command'] = command_mock

    ori = require('ori')
  end)

  describe('.setup()', function()
    it('should initialize the command module when enable_usercmd is true', function()
      config_mock.setup.returns({ enable_usercmd = true })
      ori.setup({ enable_usercmd = true })
      assert.stub(command_mock.setup).was_called_with('ori.nvim', { 'dark', 'light' })
    end)
  end)

  describe('.load()', function()
    local s_set_hl
    before_each(function()
      s_set_hl = stub(vim.api, 'nvim_set_hl')
    end)
    after_each(function()
      s_set_hl:revert()
    end)

    it('should register highlight groups correctly', function()
      integrations_mock.get_highlights.returns({
        Normal = { fg = '#ffffff', bg = '#000000' },
        Comment = { fg = '#888888', style = 'italic' },
      })

      ori.load('dark')

      assert.stub(s_set_hl).was_called_with(0, 'Normal', { fg = '#ffffff', bg = '#000000' })
      assert.stub(s_set_hl).was_called_with(0, 'Comment', { fg = '#888888', italic = true })
    end)

    it('should handle transparent settings correctly', function()
      config_mock.opts.transparent = { 'Normal' }
      integrations_mock.get_highlights.returns({
        Normal = { fg = '#ffffff', bg = '#000000' },
      })

      ori.load('dark')

      assert.stub(s_set_hl).was_called_with(0, 'Normal', match.is_table())
    end)

    it('should handle functional custom_highlights', function()
      local test_colors = { bg = '#000000', fg = '#ffffff' }
      config_mock.opts.custom_highlights = function()
        return { dark = { CustomGroup = { fg = '#ff0000' } } }
      end

      ori.load('dark')

      assert
        .stub(integrations_mock.get_highlights)
        .was_called_with(match.is_table(), match.same(test_colors), match.same({ CustomGroup = { fg = '#ff0000' } }))
    end)

    it('should set global variables and options upon loading', function()
      ori.load('dark')
      assert.are.equal('ori', vim.g.colors_name)
      assert.is_true(vim.go.termguicolors)
      assert.are.equal('palette_data', vim.g.ori_palette)
    end)
  end)
end)
