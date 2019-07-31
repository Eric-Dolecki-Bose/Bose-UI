import UIKit

struct DarkTheme: Theme {
    let tint: UIColor = .lightGray
    let secondaryTint: UIColor = .lightGray
    let backgroundColor: UIColor = .black
    let separatorColor: UIColor = .lightGray
    let selectionColor: UIColor = .init(red: 38/255, green: 38/255, blue: 40/255, alpha: 1)
    let labelColor: UIColor = .white
    let secondaryLabelColor: UIColor = .lightGray
    let subtleLabelColor: UIColor = .darkGray
    let barStyle: UIBarStyle = .black
    
    // For BoseButton:
    let borderWidth: CGFloat = 1.0
    let borderColor: UIColor = .darkGray
}
