//
//  ViewController.swift
//  firstApp
//
//  Created by Ke4a on 04.01.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private var scrollView: UIScrollView!
    @IBOutlet private var logoVKOutlet: UIImageView!
    @IBOutlet private var textfieldLogin: UITextField!
    @IBOutlet private var textfieldPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        //  Прописал для удобной проверки
        textfieldLogin.text = "admin"
        textfieldPass.text = "admin"
    }
    
    //  Сделал кнопку разлогина
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        textfieldLogin.text = ""
        textfieldPass.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // функция показа алерта
    private func showAlert(tittle: String, message: String){
        let alertController = UIAlertController(title: tittle, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .cancel) { [weak self] _ in
            guard let self = self else {return}
            self.textfieldLogin.text = ""
            self.textfieldPass.text = ""
        }
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }

    
    @objc private func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
}

extension ViewController{
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loginSegue"{
            guard textfieldLogin.text == "admin" && textfieldPass.text == "admin" else{
                showAlert(tittle: "Ошибка", message: "Неверный логин или пароль")
                return false
            }
            return true
        }
        return false
    }
}
