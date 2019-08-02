import UIKit

struct LightTheme: Theme {
    let tint: UIColor = .blue
    let secondaryTint: UIColor = .orange
    let backgroundColor: UIColor = .white
    let separatorColor: UIColor = .lightGray
    let selectionColor: UIColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1)
    let labelColor: UIColor = .black
    let secondaryLabelColor: UIColor = .darkGray
    let subtleLabelColor: UIColor = .lightGray
    let barStyle: UIBarStyle = .default
    
    // For BoseButton:
    let borderWidth: CGFloat = 0.0
    let borderColor: UIColor = .white
    
    let indicatorStyle: UIScrollView.IndicatorStyle = .black
}

extension LightTheme {
    
    func extend() {
        
        UIImageView.appearance(whenContainedInInstancesOf: [UITableViewCell.self]).with {
            $0.borderColor = separatorColor
            $0.borderWidth = 1
        }
        
        UIImageView.appearance(whenContainedInInstancesOf: [UIButton.self, UITableViewCell.self]).with {
            $0.borderWidth = 0
        }
    }
}
