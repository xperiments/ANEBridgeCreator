<extension xmlns="http://ns.adobe.com/air/extension/3.6">
	<id>es.xperiments.ane.torch.Torch</id>
	<versionNumber>@majorVersion@.@minorVersion@.@buildNumber@</versionNumber>
		<platforms> 
			<platform name="iPhone-ARM">
				<applicationDeployment>
					<nativeLibrary>libTorch.a</nativeLibrary>
					<initializer>TorchExtensionInitializer</initializer>
					<finalizer>TorchExtensionFinalizer</finalizer>
				</applicationDeployment>
			</platform>
	</platforms>
</extension>
			