local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- /opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls
local bundles = {
    vim.fn.glob(
        "C:/jdtls/additional/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar", 1),
  "C:\\jdtls\\additional\\vscode-java-test\\server\\com.microsoft.java.test.runner-jar-with-dependencies.jar",
  "C:\\jdtls\\additional\\vscode-java-test\\server\\jacocoagent.jar"
}

-- "/opt/vscode-java-test/server/*.jar"
-- vim.list_extend(bundles, vim.split(vim.fn.glob("C:/jdtls/additional/vscode-java-test/server/*.jar", 1), "\n"))

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = 'C:/Users/AndreasK/jdtls_config/' .. project_name

-- "/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls"
local config = {
    cmd = {
        'C:/Program Files/Java/jdk-17/bin/java.exe', -- or '/path/to/java17_or_newer/bin/java'
        -- depends on if `java` is in your $PATH env variable and if it points to the right version.

       -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
       -- '-Dosgi.bundles.defaultStartLevel=4',
       -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
       -- '-Dlog.protocol=true',
       -- '-Dlog.level=ALL',
       -- '-Xmx1g',
       -- '--add-modules=ALL-SYSTEM',
       -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
       -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

        -- 💀
        '-jar', 'C:/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
        -- Must point to the                                                     Change this to
        -- eclipse.jdt.ls installation                                           the actual version


        -- 💀
        '-configuration', 'C:/jdtls/config_win',
        -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
        -- Must point to the                      Change to one of `linux`, `win` or `mac`
        -- eclipse.jdt.ls installation            Depending on your system.


        -- 💀
        -- See `data directory configuration` section in the README
        '-data', workspace_dir
    },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-17",
                        path = "C:/Program Files/Java/jdk-17",
                    },
                },
            }
        }
    },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    init_options = {
        -- bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities
    },
}

require('jdtls').start_or_attach(config)

vim.keymap.set("n", '<leader>dm', function()
    require('jdtls.dap').setup_dap_main_class_configs()
end)

