//
//  ViewController.swift
//  FluctSDKSwiftPm
//
//  Created by Kotaro Arimura on 2024/01/09.
//

import UIKit
import FluctSDK

class ViewController: UIViewController , FSSRewardedVideoDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let setting = FSSRewardedVideoSetting.default
        setting.isDebugMode = true
        FSSRewardedVideo.shared.setting = setting
        FSSRewardedVideo.shared.delegate = self
        FSSRewardedVideo.shared.load(withGroupId: "1000172151", unitId: "1000275015")
    }

    func rewardedVideoDidLoad(forGroupID groupId: String, unitId: String) {
        FSSRewardedVideo.shared.presentAd(forGroupId: "1000172151", unitId: "1000275015", from: self)
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

