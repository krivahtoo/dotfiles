-- mod-version:2 -- lite-xl 2.0
local syntax = require "core.syntax"

syntax.add {
  files = { "%.tex$", "%.cls$" },
  comment = "%%",
  patterns = {
    { pattern = {"%%", "\n"},     type = "comment"  },
    { pattern = "&",              type = "operator" },
    { pattern = "\\\\",           type = "operator" },
    { pattern = {"%$", "%$"},     type = "operator" },
    { pattern = {"\\%[", "\\]"},  type = "operator" },
    { pattern = {"{", "}"},       type = "keyword"  },
    { pattern = "\\%w*",          type = "keyword2" },
  },
  symbols = {}
}
