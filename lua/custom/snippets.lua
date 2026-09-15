local ls = require 'luasnip'

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local disequality = function(g_or_l, eq)
  local sign
  if g_or_l == 'g' then
    sign = '>'
  else
    sign = '<'
  end
  return s('m_' .. g_or_l .. 't' .. (eq and 'e' or ''), { t '$', i(1, 'lhs'), t(sign .. (eq and '=' or '')), i(2, 'rhs'), t '$' })
end

ls.add_snippets('typst', {
  s('becomes', t '#sym.arrow.t.b.double'),
  s('divider', t '#divider()'),
  disequality('g', false),
  disequality('g', true),
  disequality('l', false),
  disequality('l', true),
})
