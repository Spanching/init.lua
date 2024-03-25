local config = {
	cmd = { '/opt/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	init_options = {
		bundles = {
			vim.fn.glob("/opt/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.52.0.jar", 1)
		};
	}
}
require('jdtls').start_or_attach(config)
