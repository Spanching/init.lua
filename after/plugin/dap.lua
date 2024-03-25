local dap = require('dap')
dap.configurations.java = {
	{
		javaExec = "/usr/bin/java",
		mainClass = "com.spanching.tests.App",

		name = "Launch YourClassName",
		request = "launch",
		type = "java"
	},
}

