//
//  DetailViewModel.swift
//  ZhiHuNewsSwift
//
//  Created by ZJQ on 2017/3/10.
//  Copyright © 2017年 ZJQ. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

class DetailViewModel: NSObject {
    
    var dispose = DisposeBag()
    
    var statusView = UIView()
    var controllerView = UIView()
    var nextID = Int()
    var previousID = Int()
    var idArr = [Int]()
    var id = Int() {
        didSet {
            
            for (index, element) in idArr.enumerated() {
                if id == element {
                    if index == 0 {
                        //最新一条
                        previousID = 0
                        nextID = idArr[index + 1]
                    }
                    else if (index == idArr.count - 1) {
                        //最后一条
                        nextID = -1
                        previousID = idArr[index - 1]
                    }
                    else {
                        previousID = idArr[index - 1]
                        nextID = idArr[index + 1]
                    }
                    break;
                }
            }
        }
    }

    
    
    
    init(id: Int) {
        super.init()
       
        setUI()
        getNewsDetail(id: id)
    }
    
    private let provider = MoyaProvider<APIManager>()
    
    
    fileprivate func getNewsDetail(id: Int) {
        
        provider.rx.request(.getNewsDetail(id)).mapJSON().asObservable().mapObject(type: DetailModel.self).subscribe { (model) in
            print(model)
        }
//         provider
//            .request(.getNewsDetail(id))
//            .filterSuccessfulStatusCodes()
//            .mapJSON()
//            .mapObject(type: DetailModel.self).subscribe(onNext: { (model) in
//
//
//                if let image = model.image {
//
//                    self.detailWebView.img.kf.setImage(with: URL.init(string: image))
//                    self.detailWebView.titleLab.text = model.title
//                }else {
//
//                    self.detailWebView.img.isHidden = true
//                    self.detailWebView.previousLab.textColor = UIColor.colorFromHex(hex: 0x777777)
//                }
//                if let image_source = model.image_source {
//                    self.detailWebView.imgLab.text = "图片: " + image_source
//                }
//                if (model.title.characters.count) > 16 {
//                    self.detailWebView.titleLab.frame = CGRect.init(x: 15, y: 120, width: screenW - 30, height: 55)
//                }
//                OperationQueue.main.addOperation {
//                    self.detailWebView.loadHTMLString(self.loadHTMLFile(css: model.css, body: model.body), baseURL: nil)
//                }
//
//
//            }, onError: { (error) in
//
//            }, onCompleted: {
//
//            }, onDisposed: nil).addDisposableTo(dispose)
        
    }
    
    //MARK:- private
    /**加载html文件*/
    private func loadHTMLFile(css: [String], body: String) -> String {
        var html = "<html>"
        html += "<head>"
        css.forEach { html += "<link rel=\"stylesheet\" href=\($0)>" }
        html += "<style>img{max-width:320px !important;}</style>"
        html += "</head>"
        html += "<body>"
        html += body
        html += "</body>"
        html += "</html>"
        return html
    }

    fileprivate func setUI() {
        

    }

}



// MARK: - UIWebViewDelegate
extension DetailViewModel: UIWebViewDelegate {
    

}


// MARK: - UIScrollViewDelegate
extension DetailViewModel: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
 
    }
    
}


// MARK: - Description
extension DetailViewModel {
    
    func changeWebview(_ showID: Int) {

    }
    
}




//MARK: - Model
class DetailModel: Mappable {
    
    var body = String()
    var image_source: String?
    var title = String()
    var image: String?
    var share_url = String()
    var js = String()
    var recommenders = [[String: String]]()
    var ga_prefix = String()
    var section: DetailSectionModel?
    var type = Int()
    var id = Int()
    var css = [String]()
    
    
    

    
    func mapping(map: Map) {
        
        body <- map["body"]
        image_source <- map["image_source"]
        title <- map["title"]
        image <- map["image"]
        share_url <- map["share_url"]
        js <- map["js"]
        recommenders <- map["recommenders"]
        ga_prefix <- map["ga_prefix"]
        section <- map["section"]
        type <- map["type"]
        id <- map["id"]
        css <- map["css"]
    }
    required init?(map: Map) {
        
    }
}

class DetailSectionModel: Mappable {
    
    var thumbnail = String()
    var id = Int()
    var name = String()
    
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        
        thumbnail <- map["thumbnail"]
        id <- map["id"]
        name <- map["name"]
    }
}
