//
//  Extension.swift
//  rocket
//
//  Created by Акмарал Тажиева on 19.10.2022.
//

import UIKit

extension UIImageView {
    func loadImage(with url: String, placeHolder: UIImage? = nil) {
        self.image = nil

        let iconUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""

        if let url = URL(string: iconUrl) {

            URLSession.shared.dataTask(with: url) { data, response, error in

                if error != nil {

                    DispatchQueue.main.async {
                        self.image = placeHolder
                    }
                    return
                }

                DispatchQueue.main.async {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            self.image = image
                        }
                    }
                }
            }.resume()
        }
    }
}


extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ssZ")-> Date?{
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru-RU")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
}


extension Date {

    var toRusString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: self)
    }

    func dateFromApiStr(_ eventDate: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateFormatter.date(from: eventDate)
        return date
    }
    
    
    func dateFromApiString(_ eventDate: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateFormatter.date(from: eventDate)
        return date
    }
    
}
