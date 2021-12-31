import UIKit
import Foundation
//struct ModelsRequest: Codable {
//    let success : Bool!
//    let data: Datas!
//}
//struct Datas: Codable {
//    let models: [ModelData]!
//}
struct ModelData:Codable {
    let year: Int
    let id: Int
    let horsepower: Int
    let make: String
    let model: String
    let price: Int
    let img_url: String!
}
