require('Comment').setup{
  mappings = {
      ---operator-pending mapping
      ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
      basic = true,
      ---extra mapping
      ---Includes `gco`, `gcO`, `gcA`
      extra = true,
      ---extended mapping
      ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
      extended = true,
  },
  pre_hook = function(ctx)
      local u = require('Comment.utils')
      if ctx.ctype == u.ctype.line or ctx.cmotion == u.cmotion.line then
          -- Only comment when we are doing linewise comment or up-down motion
          return require('ts_context_commentstring.internal').calculate_commentstring()
      end
  end
}

