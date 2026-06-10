local M = {}

M.kaomoji = {
  "(`・ω・´)",
  "₍•˽•₎",
  "₍•͈˽•͈₎",
  "(．． )",
  "(>▽<)",
  "(๑•̀ㅂ•́)و✧",
  "(。_。)",
  '("▔□▔)',
  "( -д-)",
  "(⊙﹏⊙)",
  "(。﹏。*)",
  "(๑-﹏-๑)",
}

function M.random()
  return M.kaomoji[math.random(#M.kaomoji)]
end

return M
