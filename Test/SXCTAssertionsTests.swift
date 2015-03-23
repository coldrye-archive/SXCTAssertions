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
//  SXCTAssertionsTests.swift
//  SXCTAssertionsTests
//
//  Created by Carsten Klein on 15-03-22.
//

import Foundation
import XCTest
import SXCTAssertions

class SXCTAssertionsTests: XCTestCase {

    class TestException : NSException {
    }

    func testAssertThrows() {
        SXCTAssertThrows({
            NSException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }())
    }

    func testAssertThrowsSpecific() {
        SXCTAssertThrowsSpecific({
            TestException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), TestException.self)
        SXCTAssertThrowsSpecific({
            TestException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), NSException.self)
    }

    func testAssertThrowsSpecificNamed() {
        SXCTAssertThrowsSpecificNamed({
            TestException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), TestException.self, NSInvalidArgumentException)
        SXCTAssertThrowsSpecificNamed({
            TestException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), NSException.self, NSInvalidArgumentException)
    }

    func testAssertNoThrow() {
        SXCTAssertNoThrow({ () -> Void in
        }())
    }

    func testAssertNoThrowSpecific() {
        SXCTAssertNoThrowSpecific({}(), TestException.self)
        SXCTAssertNoThrowSpecific({
            NSException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), TestException.self)
    }

    func testAssertNoThrowSpecificNamed() {
        SXCTAssertNoThrowSpecificNamed({}(), TestException.self,
            NSInvalidArgumentException)
        SXCTAssertNoThrowSpecificNamed({
            NSException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }(), TestException.self, NSInvalidArgumentException)
        SXCTAssertNoThrowSpecificNamed({
            TestException(name: "foobar", reason: nil, userInfo: nil).raise()
        }(), TestException.self, NSInvalidArgumentException)
    }

    // since we are currently unable to expect tests to fail, we have to
    // test expected failures indirectly and hope that our swift assertions
    // will handle these cases as expected
    func test_sxctThrows() {
        XCTAssertFalse(_sxctThrows({ () -> Void in }))
    }

    func test_sxctThrowsSpecific() {
        XCTAssertFalse(_sxctThrowsSpecific({ () -> Void in },
            TestException.self))
        XCTAssertFalse(_sxctThrowsSpecific({ () -> Void in
            NSException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }, TestException.self))
    }

    func test_sxctThrowsSpecificNamed() {
        XCTAssertFalse(_sxctThrowsSpecificNamed({ () -> Void in },
            TestException.self, NSInvalidArgumentException))
        XCTAssertFalse(_sxctThrowsSpecificNamed({ () -> Void in
            NSException(name: NSInvalidArgumentException, reason: nil,
                userInfo: nil).raise()
        }, TestException.self, NSInvalidArgumentException))
    }
}
