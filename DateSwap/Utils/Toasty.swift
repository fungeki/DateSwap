import UIKit

func showToast(message : String, controller: UIViewController) {
    
    let toastLabel = UILabel(frame: CGRect(x: controller.view.frame.size.width/2 - 75, y: controller.view.frame.size.height / 2, width: 175, height: 40))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center;
    toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 20;
    toastLabel.clipsToBounds  =  true
    controller.view.addSubview(toastLabel)
    UIView.animate(withDuration: 2.5, delay: 0.5, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}

func showToast(message : String, controller: UIViewController, delay: TimeInterval) {
    
    let toastLabel = UILabel(frame: CGRect(x: controller.view.frame.size.width/2 - 75, y: controller.view.frame.size.height / 2, width: 175, height: 40))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center;
    toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 20;
    toastLabel.clipsToBounds  =  true
    controller.view.addSubview(toastLabel)
    UIView.animate(withDuration: 2.5, delay: delay, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
}

func showToast(message : String, controller: UIViewController, delay: TimeInterval, image: UIImage) {
    
    let img = UIImageView(frame: CGRect(x: controller.view.frame.size.width/2 - 75, y: controller.view.frame.size.height / 2 - 20, width: 175, height: 40))
    img.image = image
    img.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    img.alpha = 1.0
    img.clipsToBounds = true
    img.contentMode = .scaleAspectFit
    img.roundCorners(corners: [.topRight, .topLeft], radius: 20)
    controller.view.addSubview(img)
    let toastLabel = UILabel(frame: CGRect(x: controller.view.frame.size.width/2 - 75, y: controller.view.frame.size.height / 2 + 20, width: 175, height: 40))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = .center;
    toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 20)
    toastLabel.clipsToBounds  =  true
    controller.view.addSubview(toastLabel)
    UIView.animate(withDuration: 2.5, delay: delay, options: .curveEaseOut, animations: {
        toastLabel.alpha = 0.0
        img.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
        img.removeFromSuperview()
    })
}


func showMatchToast(controller: UIViewController, delay: TimeInterval) {
    
    let img = UIImageView(frame: CGRect(x: controller.view.frame.size.width / 4, y: controller.view.frame.size.height / 4 + 40, width: controller.view.frame.width / 2, height: controller.view.frame.size.height / 2))
    img.image = #imageLiteral(resourceName: "ic_its_a_match")
    img.alpha = 1.0
    img.clipsToBounds = true
    img.contentMode = .scaleAspectFit
    img.layer.cornerRadius = controller.view.frame.size.height / 4
    controller.view.addSubview(img)
    
//    let star1 = UIImageView(frame: CGRect(x: controller.view.frame.size.width / 4, y: controller.view.frame.size.height / 2 - img.frame.size.height / 4 + 40, width: 25, height: 25))
//    star1.image = #imageLiteral(resourceName: "ic_match_star")
//    star1.alpha = 1.0
//    star1.transform = CGAffineTransform(rotationAngle: 45.0)
//    star1.clipsToBounds = true
//    star1.contentMode = .scaleAspectFit
//    controller.view.addSubview(star1)
//
//    let star2 = UIImageView(frame: CGRect(x: controller.view.frame.size.width / 4 + 25, y: controller.view.frame.size.height / 2 - img.frame.size.height / 4 + 25, width: 50, height: 50))
//    star2.image = #imageLiteral(resourceName: "ic_match_star")
//    star2.alpha = 1.0
//    star2.transform = CGAffineTransform(rotationAngle: 45.0)
//    star2.clipsToBounds = true
//    star2.contentMode = .scaleAspectFit
//    controller.view.addSubview(star1)
    
    UIView.animate(withDuration: 2.5, delay: delay, options: .curveEaseOut, animations: {
        img.alpha = 0.0
    }, completion: {(isCompleted) in
        img.removeFromSuperview()
    })
}

func showOfferToast(controller: UIViewController, delay: TimeInterval) {
    
    let img = UIImageView(frame: CGRect(x: controller.view.frame.size.width / 4, y: controller.view.frame.size.height / 4 + 40, width: controller.view.frame.width / 2, height: controller.view.frame.size.height / 2))
    img.image = #imageLiteral(resourceName: "ic_offer_delivered")
    img.alpha = 1.0
    img.clipsToBounds = true
    img.contentMode = .scaleAspectFit
    img.layer.cornerRadius = controller.view.frame.size.height / 4
    controller.view.addSubview(img)
    
    UIView.animate(withDuration: 2.5, delay: delay, options: .curveEaseOut, animations: {
        img.alpha = 0.0
    }, completion: {(isCompleted) in
        img.removeFromSuperview()
    })
}
