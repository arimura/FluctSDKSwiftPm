//
//  ViewController.swift
//  FluctSDKSwiftPm
//
//  Created by Kotaro Arimura on 2024/01/09.
//

import UIKit
import FluctSDK

class ViewController: UIViewController , FSSRewardedVideoDelegate, FSSAdViewDelegate {
    private var adView: FSSAdView?

    override func viewDidLoad() {
        super.viewDidLoad()
        let setting = FSSRewardedVideoSetting.default
        setting.isDebugMode = true
        FSSRewardedVideo.shared.setting = setting
        FSSRewardedVideo.shared.delegate = self
        FSSRewardedVideo.shared.load(withGroupId: "1000172151", unitId: "1000275015")

        //create button and add click event
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        button.setTitle("Show Ad", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(self.onClickMyButton(sender:)), for: .touchUpInside)
        self.view.addSubview(button);
        
        // Viewの生成
         let adView = FSSAdView(groupId: "1000055927", unitId: "1000084701", adSize: FSSAdSize320x50)
         adView.delegate = self
         self.view.addSubview(adView)

         // 広告の読み込み
         // addSubviewした後にloadAd()を実行してください
         adView.loadAd()

         self.adView = adView
        
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()

          // 画面下、中央に表示するため座標計算
          let adViewHeight = self.adView?.frame.height ?? 0.0
          let maxY = self.view.bounds.maxY
          let adViewY = maxY - self.view.layoutMargins.bottom - adViewHeight

          let adViewWidth = self.adView?.frame.width ?? 0.0
          let midX = self.view.bounds.midX
          let adViewX = midX - adViewWidth * 0.5

          var frame = adView?.frame ?? .zero
          frame.origin = CGPoint(x: adViewX, y: adViewY)
          adView?.frame = frame
      }

      // MARK: - FSSAdViewDelegate

      func adViewDidStoreAd(_ adView: FSSAdView) {
          print("広告表示が完了しました")
      }

      func adView(_ adView: FSSAdView, didFailToStoreAdWithError error: Error) {
          print(error.localizedDescription)
          let fluctError = FSSAdViewError(rawValue: (error as NSError).code) ?? .unknown
          switch fluctError {
          case .unknown:
              print("Unkown Error")
          case .notConnectedToInternet:
              print("ネットワークエラー")
          case .serverError:
              print("サーバーエラー")
          case .noAds:
              print("表示する広告がありません")
          case .badRequest:
              print("GroupID / UnitID / 登録されているbundleのどれかが間違っています")
          }
      }

      func willLeaveApplicationForAdView(_ adView: FSSAdView) {
          print("広告へ遷移します")
      }
    
    
    @objc
    func onClickMyButton(sender: UIButton){
        if FSSRewardedVideo.shared.hasAdAvailable(forGroupId: "1000172151", unitId: "1000275015") {
            // 動画リワード広告の表示
            FSSRewardedVideo.shared.presentAd(forGroupId: "1000172151", unitId: "1000275015", from: self)
        }
    }
    
    func rewardedVideoDidLoad(forGroupID groupId: String, unitId: String) {
    }

    func rewardedVideoShouldReward(forGroupID groupId: String, unitId: String) {
    }

    func rewardedVideoDidFailToLoad(forGroupId groupId: String, unitId: String, error: Error) {
        print(error)
    }

    func rewardedVideoWillAppear(forGroupId groupId: String, unitId: String) {
    }

    func rewardedVideoDidAppear(forGroupId groupId: String, unitId: String) {
    }

    func rewardedVideoWillDisappear(forGroupId groupId: String, unitId: String) {
    }

    func rewardedVideoDidDisappear(forGroupId groupId: String, unitId: String) {
    }

    func rewardedVideoDidFailToPlay(forGroupId groupId: String, unitId: String, error: Error) {
    }
}

