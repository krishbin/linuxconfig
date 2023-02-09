return {
    {
        "nvim-neorg/neorg",
        ft = "norg",
        config = function()
          require("neorg").setup {
              load = {
                  ["core.defaults"] = {},
                  ["core.norg.dirman"] = {
                      config = {
                          workspaces = {
                              home = "~/notes/home",
                              minor = "~/notes/minor",
                          }
                      }
                  }
              }
          }
        end,
    },
}