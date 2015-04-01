//
//   Copyright 2015 vibeswift, Carsten Klein
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//

//
//  SXCTAssertions.swift
//  SXCTAssertions
//
//  Created by Carsten Klein on 15-03-22.
//

import Foundation
import XCTest


public func SXCTAssertThrows(
    @autoclosure(escaping) expression: () -> Void, var message: String? = "",
    file: String = __FILE__, line: UInt = __LINE__) {

    if message == nil {
        message = "expected exception."
    }
    if !_sxctThrows(expression) {
        XCTFail(message!, file: file, line: line)
    }
}

public func SXCTAssertThrowsSpecific(
    @autoclosure(escaping) expression: () -> Void, exception: NSException.Type,
    var message: String? = "", file: String = __FILE__, line: UInt = __LINE__) {

    if message == nil {
        message = "expected exception of type \(exception)."
    }
    if !_sxctThrowsSpecific(expression, exception) {
        XCTFail(message!, file: file, line: line)
    }
}

public func SXCTAssertThrowsSpecificNamed(
    @autoclosure(escaping) expression: () -> Void, exception: NSException.Type,
    name: String, var message: String? = "", file: String = __FILE__,
    line: UInt = __LINE__) {

    if message == nil {
        message = "expected exception of type \(exception) with name \(name)."
    }
    if !_sxctThrowsSpecificNamed(expression, exception, name) {
        XCTFail(message!, file: file, line: line)
    }
}

public func SXCTAssertNoThrow(
    @autoclosure(escaping) expression: () -> Void, var message: String? = "",
    file: String = __FILE__, line: UInt = __LINE__) {

    if message == nil {
        message = "unexpected exception."
    }
    if _sxctThrows(expression) {
        XCTFail(message!, file: file, line: line)
    }
}

public func SXCTAssertNoThrowSpecific(
    @autoclosure(escaping) expression: () -> Void, exception: NSException.Type,
    var message: String? = "", file: String = __FILE__, line: UInt = __LINE__) {

    if message == nil {
        message = "unexpected exception of type \(exception)."
    }
    if _sxctThrowsSpecific(expression, exception) {
        XCTFail(message!, file: file, line: line)
    }
}

public func SXCTAssertNoThrowSpecificNamed(
    @autoclosure(escaping) expression: () -> Void, exception: NSException.Type,
    name: String, var message: String? = "", file: String = __FILE__,
    line: UInt = __LINE__) {

    if message == nil {
        message = "unexpected exception of type \(exception) with name \(name)."
    }
    if _sxctThrowsSpecificNamed(expression, exception, name) {
        XCTFail(message!, file: file, line: line)
    }
}
