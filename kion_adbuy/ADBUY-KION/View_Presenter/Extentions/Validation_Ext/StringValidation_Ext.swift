import UIKit



extension String {
    
    enum Regex :String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        case phone = "(0)+([0-9]{10})"
        case names = "^[a-zA-Z]*$"
    
    }
    
    func isValid (_ ValidateType :ValidationType) -> Bool {
        
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch ValidateType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .phone:
            regex = Regex.phone.rawValue
        case .name:
            regex = Regex.names.rawValue
        case .confirmPassword:
            regex = ""
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
