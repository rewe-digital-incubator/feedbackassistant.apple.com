import XCTest

class BTests: XCTestCase {

    func testTextInputIntoSearch() throws {
        let app = XCUIApplication()
        app.launch()

        app.tabBars.buttons["Defect"].tap()

        app.textFields["UsernameTextField"].tap()
        app.textFields["UsernameTextField"].typeText("craig@example.com")

        app.secureTextFields["PasswordTextField"].tap()
        app.secureTextFields["PasswordTextField"].typeText("H4irF0rce1")
    }

}
