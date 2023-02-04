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
        app.textFields["NoDigitsTextField"].typeText("NoDigitsTextField is working")
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
    
    func testInputOnlyCharactersTextFieldSuccessfuly() {
        
        app.launch()
        app.textFields["OnlyCharactersTextField"].tap()
        app.textFields["OnlyCharactersTextField"].typeText("chars-12345")
        app.buttons["Return"].tap()
        
        XCTAssertEqual(app.textFields["OnlyCharactersTextField"].value as! String, "chars-12345")
    }

    func testInputValidationRulesTextFieldSuccessfuly() {

        app.launch()
        app.secureTextFields["ValidationRulesTextField"].tap()
        app.secureTextFields["ValidationRulesTextField"].typeText("ValidationRulesTextField is working")

        XCTAssertEqual(app.secureTextFields["ValidationRulesTextField"].value as! String, "•••••••••••••••••••••••••••••••••••")
    }
}
