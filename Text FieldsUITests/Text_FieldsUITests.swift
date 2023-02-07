//
//  Text_FieldsUITests.swift
//  Text FieldsUITests
//
//  Created by Dmytro Horodyskyi on 30.01.2023.
//

import XCTest

final class Text_FieldsUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func testInputNoDigitsTextFieldSuccessfuly() {
        
        app.launch()
        app.textFields["NoDigitsTextField"].tap()
        app.textFields["NoDigitsTextField"].typeText("NoDigitsTextField123 is working")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(app.textFields["NoDigitsTextField"].value as! String, "NoDigitsTextField is working")
    }
    
    func testInputInputLimitTextFieldSuccessfuly() {
        
        app.launch()
        app.textFields["InputLimitTextField"].tap()
        app.textFields["InputLimitTextField"].typeText("InputLimitTextField is working")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(app.staticTexts.element(matching: .any, identifier: "InputLimitTextFieldCounter").label,
                       "-20")
    }
    
    func testInputMaskTextFieldSuccessfuly() {
        
        app.launch()
        app.textFields["OnlyCharactersTextField"].tap()
        app.textFields["OnlyCharactersTextField"].typeText("characters-123456789")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(app.textFields["OnlyCharactersTextField"].value as! String, "chara-12345")
    }
    
    func testInputLinkTextFieldSuccessfuly() {
        
        UIPasteboard.general.string = "https://www.google.com/?client=safari"
        app.launch()
        app.textFields["LinkTextField"].tap()
        app.textFields["LinkTextField"].tap()
        app.collectionViews.staticTexts["Paste"].tap()
        sleep(3)
        
        XCTAssertTrue(app.webViews.element.exists)
    }
    
    func testInputValidationRulesTextFieldSuccessfuly() {
        
        app.launch()
        app.secureTextFields["ValidationRulesTextField"].tap()
        app.secureTextFields["ValidationRulesTextField"].typeText("ValidationRulesTextField is working")
        
        XCTAssertEqual(app.secureTextFields["ValidationRulesTextField"].value as! String, "•••••••••••••••••••••••••••••••••••")
    }
}
