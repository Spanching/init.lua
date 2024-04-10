local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local bundles = {
    vim.fn.glob(
        "/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar", 1)
}

vim.list_extend(bundles, vim.split(vim.fn.glob("/opt/vscode-java-test/server/*.jar", 1), "\n"))

local config = {
    cmd = { vim.fn.expand("/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls") },
    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    init_options = {
        bundles = bundles,
        extendedClientCapabilities = extendedClientCapabilities
    }
}

require('jdtls').start_or_attach(config)

vim.keymap.set("n", '<leader>dm', function()
    require('jdtls.dap').setup_dap_main_class_configs()
end)
