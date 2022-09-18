-- LuaSnip Config
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	ext_base_prio = 300,
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

ls.add_snippets('all', {
  s('rfc', {
    t({'import React from \'react\'', ''}),
    t({'', ''}),
    t({'const ', }),
    i(1, 'ReactComponent'),
    t({' = () => {', ''}),
    t({'  const title = \'Hola mundo!\'', ''}),
    t({'  return <div>{title}</div>', ''}),
    t({'}', ''}),
    t({'', ''}),
    t({'export default '}),
    i(2, 'ReactComponent'),
  }),
  s('rnc', {
    t({'import React from \'react\'', ''}),
    t({'import { View, Text } from \'react-native\'', ''}),
    t({'', ''}),
    t({'const ', }),
    i(1, 'ReactComponent'),
    t({' = () => {', ''}),
    t({'  const title = \'Hola mundo!\'', ''}),
    t({'  return (', ''}),
    t({'    <View>', ''}),
    t({'      <Text>{title}</Text>', ''}),
    t({'    </View>', ''}),
    t({'  )', ''}),
    t({'}', ''}),
    t({'', ''}),
    t({'export default '}),
    i(2, 'ReactComponent'),
  }),
  s('log', {
    t({'console.log('}),
    i(1, 'Key'),
    t({')'}),
  }),
})
