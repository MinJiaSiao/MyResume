//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name     = "May Siao"
    let title    = "iOS Developer"
    let location = "位置：台灣"
    let bio      = "了解並愛上 swift 中，希望更多人能了解 coding 的美好"
    let skills   = ["audit", "tax", "cost", "finance"]
    let experiences: [Experience] = [("Financial Accountant",
                                      "Fonggu",
                                      "2021 年 9 月",
                                      "現在"),
                                     ("Tax Accountant/Cost Accountant",
                                      "Sakura Arch",
                                      "2020 年 12 月",
                                      "2021 年 6 月"),
                                     ("Tax Accountant/Cost Accountant",
                                      "Ginko International Co.,Ltd",
                                      "2016 年 8 月",
                                      "2020 年 10 月"),
                                     ("Auditor/Accountant ",
                                      "Crowe (TW) CPAs",
                                      "2013 年 7 月",
                                      "2015 年 11 月")]
    let phoneUrl = "tel://0932735158"
    let socialMedia: [(name: String, url: String)] = [("LinkedIn","http://www.linkedin.com/in/minjia-siao-836396239"),
                                                      ("Line","https://line.me/ti/p/Pk-u3Dg_Qc"),
                                                      ("facebook","https://www.facebook.com/profile.php?id=1384604619")]
}

