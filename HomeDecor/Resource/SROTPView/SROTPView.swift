//
//  SROTPView.swift
//  SROTPView
//
//  Created by admin on 11/20/19.
//  Copyright © 2019 admin. All rights reserved.
//
import Foundation
import UIKit

public enum SROTPType {
    case Rounded
    case Bordered
    case UnderLined
}


public class SROTPView: UIView,UITextFieldDelegate {
    
    
    var otpStackView = UIStackView()
    //Customise the OTPField here
    public var otpTextFieldsCount = 6{
        didSet{
            self.addOTPFields()
        }
    }
    var activeTextField:OTPTextField?
    public var otpType:SROTPType = .UnderLined
    public var keyboardType:UIKeyboardType = .numberPad

    var textFieldsCollection: [OTPTextField] = []
    public var showsWarningColor = false
    public var hasEnteredAllOTP = false
    public var space: CGFloat = 20
    public var size: CGFloat = 40
    public var otpTextFieldFontColor = UIColor.white
    public var otpTextFieldErrorColor = UIColor.red
    
    public var activeHeight = 2
    public var inactiveHeight = 2
    public var secureEntry = false
    //Colors
    public var otpTextFieldDefaultBorderColor = UIColor.white
    public var textBackgroundColor = UIColor.clear
    public var otpTextFieldActiveBorderColor = UIColor.white
    public var otpEnteredString :((String)->())?
    let topView = UIView()
    public var randomEditEnabled = false

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    public func setUpOtpView(){
        self.addSubview(otpStackView)
        otpStackView.heightAnchor.constraint(equalToConstant: size).isActive = true
        otpStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        otpStackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        otpStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.setupStackView()
        self.addOTPFields()
        topView.backgroundColor = UIColor.clear
        topView.isUserInteractionEnabled = !randomEditEnabled
        self.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        topView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(getResponder))
        tapGesture.numberOfTapsRequired = 1
        topView.addGestureRecognizer(tapGesture)
    }
    
    public func initializeUI(){
        self.refreshView()
        
    }
    
    //MARK:Get Touch event when touch on view
    @objc func getResponder(){
        self.assignResponder()
    }
    
    public func set(warning:Bool){
        self.otpStackView.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .curveLinear, animations: {
            self.transform = CGAffineTransform.identity
            self.setWarningColor(isWarningColor: true)
        }) { _ in
            self.otpStackView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    //Customisation and setting stackView
    func setupStackView() {
        otpStackView.backgroundColor = .clear
        otpStackView.isUserInteractionEnabled = true
        otpStackView.translatesAutoresizingMaskIntoConstraints = false
        otpStackView.contentMode = .center
        otpStackView.distribution = .equalSpacing
        otpStackView.spacing = space
        if (CGFloat(otpTextFieldsCount - 1)*space + CGFloat(otpTextFieldsCount)*size) > otpStackView.bounds.size.width{
            otpStackView.spacing = 0//(otpStackView.bounds.size.width - CGFloat(otpTextFieldsCount)*size) / (CGFloat(otpTextFieldsCount - 1))
        }
        
    }
    
    //Adding each OTPfield to stack view
    func addOTPFields() {
        self.textFieldsCollection = []
        for each in otpStackView.subviews{
            each.removeFromSuperview()
        }
        for index in 0..<otpTextFieldsCount{
            let field = OTPTextField()
            field.tag = index
            setupTextField(field)
            textFieldsCollection.append(field)
            //Adding a marker to previous field
            index != 0 ? (field.previousTextField = textFieldsCollection[index-1]) : (field.previousTextField = nil)
            //Adding a marker to next field for the field at index-1
            index != 0 ? (textFieldsCollection[index-1].nextTextField = field) : ()
        }
        
        activeTextField = textFieldsCollection[0]
    }
    
    func assignResponder(){
        DispatchQueue.main.async {
            self.activeTextField?.becomeFirstResponder()
        }
    }
    
    //Customisation and setting OTPTextFields
    func setupTextField(_ textField: OTPTextField){
        switch otpType {
        case .Rounded:
            textField.layer.cornerRadius = 20
            textField.clipsToBounds = true
        default:
            break
        }
        textField.delegate = self
        textField.textContentType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        otpStackView.addArrangedSubview(textField)
        textField.centerYAnchor.constraint(equalTo: otpStackView.centerYAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: otpStackView.heightAnchor).isActive = true
        let width = (self.frame.size.width-100)/4
        textField.widthAnchor.constraint(equalToConstant: width).isActive = true
        if secureEntry{
            textField.isSecureTextEntry = true
        }else{
            textField.isSecureTextEntry = false
        }
        textField.backgroundColor = textBackgroundColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font = UIFont.init(name: "OpenSans-Bold", size: 20)
        textField.textColor = otpTextFieldFontColor
        textField.keyboardType = keyboardType
        textField.otpType = self.otpType
        textField.addborder(color: otpTextFieldDefaultBorderColor,height: CGFloat(inactiveHeight))
    }
    
    func refreshView(){
        for fields in textFieldsCollection{
            fields.text = ""
            hasEnteredAllOTP = false
            (otpEnteredString?(""))
        }
        DispatchQueue.main.async {
            self.textFieldsCollection[0].becomeFirstResponder()
        }
        activeTextField = textFieldsCollection[0]
    }
    
    //checks if all the OTPfields are filled
    func checkForValidity(){
        for fields in textFieldsCollection{
            if (fields.text == ""){
                hasEnteredAllOTP = false
                (otpEnteredString?(self.getOTP()))
                return
            }
        }
        hasEnteredAllOTP = true
        (otpEnteredString?(self.getOTP()))
    }
    
    //gives the OTP text
    func getOTP() -> String {
        var OTP = ""
        for textField in textFieldsCollection{
            OTP += textField.text ?? ""
        }
        return OTP
    }
    
    //set isWarningColor true for using it as a warning color
    func setWarningColor(isWarningColor: Bool = false){
        if isWarningColor{
            for textField in textFieldsCollection{
                textField.changeToErrorBorder(color: otpTextFieldErrorColor, height: CGFloat(self.inactiveHeight))
            }
        }else{
            for textField in textFieldsCollection{
                textField.changeToInActiveBorder(color: otpTextFieldDefaultBorderColor,height:CGFloat(activeHeight))
            }
        }
        showsWarningColor = isWarningColor
    }
    
    
    //TextField related operations
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        if showsWarningColor {
            setWarningColor(isWarningColor: false)
            showsWarningColor = false
        }
        if let field = textField as? OTPTextField{
            activeTextField = field
            field.changeToActiveBorder(color: otpTextFieldActiveBorderColor,height: CGFloat(activeHeight))
        }
    }
    
    public   func textFieldDidEndEditing(_ textField: UITextField) {
        if let field = textField as? OTPTextField{
            field.changeToInActiveBorder(color: otpTextFieldDefaultBorderColor,height:CGFloat(inactiveHeight))
        }
    }
    
  public  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //switches between OTPTextfields
    public  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        guard string.count <= self.textFieldsCollection.count else{return false}
        let replacedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        guard let textField = textField as? OTPTextField else { return true }
        if self.keyboardType == .numberPad{
            if !replacedText.isEmpty &&  replacedText.rangeOfCharacter(from: .decimalDigits) == nil {
                return false
            }
        }
        
        if (range.length == 0){
            if  replacedText == ""{
                activeTextField = textFieldsCollection[0]
                activeTextField?.becomeFirstResponder()
                return false
            }
            if textField.nextTextField == nil {
                activeTextField = textField
                DispatchQueue.main.async {
                    textField.resignFirstResponder()
                }
            }else{
                if randomEditEnabled {
                    if textField.nextTextField?.text != ""{
                        if !(string.count == self.textFieldsCollection.count){
                          textField.text? = string
                          checkForValidity()
                          return false
                        }
                    }else{
                        if !(string.count == self.textFieldsCollection.count){
                         textField.nextTextField?.becomeFirstResponder()
                         activeTextField = textField.nextTextField
                        }
                    }
                }else{
                    textField.nextTextField?.becomeFirstResponder()
                    activeTextField = textField.nextTextField
                }
            }
            if string.count == self.textFieldsCollection.count{
                self.textFieldsCollection.last?.becomeFirstResponder()
                self.endEditing(true)
                for index in (0...string.count - 1){
                    let charIndex = string.index(string.startIndex, offsetBy: index)
                    print(charIndex)
                    self.textFieldsCollection[index].text = "\(string[charIndex])"
                }
            }else{
                textField.text? = string
                checkForValidity()
            }
            return false
            
        }else if (range.length == 1) {
            textField.previousTextField?.becomeFirstResponder()
            if textField.previousTextField != nil{
                activeTextField = textField.previousTextField
            }
            
            checkForValidity()
            return false
        }
        return false
    }
    
}

