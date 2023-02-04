//
//  Text_FieldsTests.swift
//  Text FieldsTests
//
//  Created by Dmytro Horodyskyi on 30.01.2023.
//

import XCTest
@testable import Text_Fields

final class Text_FieldsTests: XCTestCase {

    var textFielConfigutator: TextFieldConfigurator!

    override func setUp() {
        super.setUp()
        textFielConfigutator = TextFieldConfigurator()
    }

    override func tearDown() {
        textFielConfigutator = nil
        super.tearDown()
    }

    func testRemoveDigitsFromStringSuccessfuly() {
        let removedDigits = textFielConfigutator.removeDigits(from: "Digits123 for removing")
        
        XCTAssertEqual(removedDigits, "Digits for removing")
    }
    
    func testTransformStringToMaskSuccessfuly() {
        let transformStringToMask = textFielConfigutator.transform("maskIt1234567", to: "wwwww-ddddd")
        
        XCTAssertEqual(transformStringToMask, "maskI-12345")
    }
}
