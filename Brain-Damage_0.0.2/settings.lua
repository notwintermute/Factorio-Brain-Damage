data:extend({
	{
		type = "bool-setting",
		name = "Brain-Damage-forget-on-interval", -- forget every x minutes
		setting_type = "startup",
		default_value = true,
		order = "aa"
	},

	{
		type = "double-setting",
		name = "Brain-Damage-interval", -- in minutes
		setting_type = "startup",
		default_value = 30,
		minimum_value = 0.1,
		order = "ab"
	},


	{
		type = "bool-setting",
		name = "Brain-Damage-forget-on-damage", -- forget whenever you get damaged
		setting_type = "startup",
		default_value = false,
		order = "ba"
	},

	{
		type = "double-setting",
		name = "Brain-Damage-forget-on-damage-chance", -- percentage
		setting_type = "startup",
		default_value = 0.5,
		minimum_value = 0,
		maximum_value = 100,
		order = "bb"
	},

	{
		type = "bool-setting",
		name = "Brain-Damage-forget-prereqs", -- forget all prequisite technologies as well
		setting_type = "startup",
		default_value = false,
		order = "c"
	},


})