-- settings for Exotic Industries

data:extend({
    {
        name = "ei_tech-scaling:maxCost",
        type = "string-setting",
        setting_type = "startup",
        default_value = "Default",
        allowed_values = {"Default", "Very Cheap", "Cheap", "Expensive", "Very Expensive"},
        order  = "a1",
    },
    {
        name = "ei_tech-scaling:startPrice",
        type = "int-setting",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 100000,
        order  = "a2",
    },
    {
        name = "ei_tech-scaling:curveForm",
        type = "string-setting",
        setting_type = "startup",
        default_value = "linear",
        allowed_values = {"linear", "quadratic", "exponential"},
        order  = "a3",
    },
    {
        name = "ei_age-enabler:neededPercentage",
        type = "int-setting",
        setting_type = "startup",
        default_value = "70",
        minimum_value = 1,
        maximum_value = 100,
        order  = "a4",
    },
    {
        name = "ei_pipe-to-ground:lenght",
        type = "int-setting",
        setting_type = "startup",
        default_value = "16",
        minimum_value = 10,
        maximum_value = 40,
        order  = "a5",
    },
    {
        name = "ei_nuclear-reactor:energy-output",
        type = "string-setting",
        setting_type = "startup",
        default_value = "100MW",
        allowed_values = {"40MW", "50MW", "100MW", "125MW", "150MW"},
        order  = "a6",
    },
    {
        name = "ei_nuclear-reactor:remove-bonus",
        type = "bool-setting",
        setting_type = "startup",
        default_value = true,
        order  = "a7",
    }
})