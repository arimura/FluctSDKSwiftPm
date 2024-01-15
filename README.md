# FluctSDKSwiftPm

Swift Pacakage ManagerでFluctSDKとAdMobをインストールするサンプル

## Swift Package ManagerのFluctSDKインストール
- FluctSDKを[ダウンロード](https://github.com/voyagegroup/FluctSDK-iOS/releases)する。ダウンロードしたファイルに含まれる`FluctSDK.xcframework`でbinaryTargetを作成する。 [FluctSDKディレクトリー](https://github.com/arimura/FluctSDKSwiftPm/tree/main/FluctSDK)を参照。
- アプリのXcodeプロジェクトからbinaryTargetを参照する。
- ダウンロードしたファイルに含まれる`FluctSDKResources.bundle`をアプリのXcodeプロジェクトに追加する。AdMobからFluctSDKをメディエーションする場合は、ダウンロードしたファイルに含まれる`GoogleMobileAdsMediationFluct`下のファイル群をアプリのXcodeプロジェクトに追加してコンパイル対象とする。
- [FluctSDKのpodspec](https://github.com/voyagegroup/FluctSDK-iOS/blob/master/FluctSDK.podspec)を参考にしてコンパイルフラグを設定する
