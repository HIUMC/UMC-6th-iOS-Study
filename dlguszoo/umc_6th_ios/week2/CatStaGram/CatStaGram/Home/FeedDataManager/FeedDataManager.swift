//
//  FeedDataManager.swift
//  CatStaGram
//
//  Created by 이현주 on 5/27/24.
//

import Alamofire

class FeedDataManager {
    //데이터를 주고 받는 함수
    func feedDataManager(_ parameters : FeedAPIInput, _ viewController : HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
         //of: 어떠한 형태로 받아올 것이다, completionHandler: 요청 후 응답을 받았을 때 어떤 행동을 할 것이다
    }
}
