import XCTest

class ATests: XCTestCase {

    func testTextInputIntoTextFields() throws {
        let app = XCUIApplication()
        app.launch()

        app.textFields["NicknameTextField"].tap()
        app.textFields["NicknameTextField"].typeText("Hairforce One")
    }

}

