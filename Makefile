clean:
	rm -rf FluctSDK/FluctSDK.xcframework/*

build:
	cp -R ../../voyagegroup/FluctSDK-iOS-Dev/FluctSDK.embeddedframework/FluctSDK.xcframework FluctSDK
	cd FluctSDK && swift build
