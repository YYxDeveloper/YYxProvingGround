//
//  FakeDataManager.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/7.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation

class FakeDataManager {
    
    static func giveMeFakeFormDatas(){
        
    }
   static func htmlContent()  -> String{
        let titleColor = "#1675d1";
        let instructions_for_use = "" +
            "<p style=\"color:" + "\(titleColor)" + ";\">關於旅遊幣</p>\n" +
            "" + "旅遊幣是喜鴻假期會員專屬回饋，只要加入會員或推薦好友加入會員，即可獲得旅遊幣回饋。\n" +
            "<br>" + "1旅遊幣 = 1元，輕鬆折抵無上限。\n" +
            "<br>" + "\n" +
            "<p style=\"color:" + "\(titleColor)" + ";\">如何賺取旅遊幣</p>\n" +
            "" + "1.加入喜鴻假期APP會員，立即送旅遊幣500。\n" +
            "<br>" + "2.邀請朋友加入喜鴻假期APP，一起賺取旅遊幣。\n" +
            "<br>" + "3.不定期推出限時好康，輕鬆賺取旅遊幣。\n" +
            "<br>" + "\n" +
            "<br>" + "\n" +
            "<p style=\"color:" + "\(titleColor)" + ";\">旅遊幣使用說明</p>\n" +
            "" + "1.旅遊幣僅限於喜鴻假期APP線上訂購有效。\n" +
            "<br>" + "2.線上訂購時，於線上刷卡頁面選擇欲抵扣旅遊幣，便能折抵訂單金額。\n" +
            "<br>" + "3.旅遊幣僅能抵扣團體旅遊商品，活動優惠，如：贈品活動、第二人優惠等，本公司保留旅遊幣是否能合併使用權力\n" +
            "<br>" + "4.旅遊幣無法轉讓或折現。\n" +
            "<br>" + "5.如訂單未成行或因不可抗力因素取消，已扣抵之旅遊幣將於取消後退還。\n" +
            "<br>" + "6.因會員個人因素取消訂單，則依相關規定扣除手續費後退款。應扣手續費不得以旅遊幣替代。\n" +
            "<br>" + "7.因不可歸責於本公司，或因不可抗力因素，致使旅遊幣資料流失時，本公司不負賠償或補償之責。\n" +
            "<br>" + "8.會員應妥善保管您的帳號及密碼，任何經由輸入正確帳號與密碼後，所使用之旅遊幣，本公司均不予以退還。\n" +
            "<br>" + "9.本公司保留得隨時修正、暫停、或終止本回饋辦法的權利，並於變動前公佈於喜多方網站相關頁面。";
        
        return instructions_for_use
    }
}
