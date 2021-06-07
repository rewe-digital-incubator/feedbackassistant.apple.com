# FB9127171: [UI Testing] Keyboard will not appear after UIResponder.resignFirstResponder()

## Summary

When running UI tests on the simulator with “Connect Hardware Keyboard” enabled, after dismissing the keyboard, any subsequent calls to XCUIElement.typeText(_:) will not open the keyboard, and text cannot be entered.

## Steps to Reproduce:

1. Open the attached sample project
2. Select UI Tests scheme
3. Ensure that “Connect Hardware Keyboard” is enabled

## Expected:

I expected that every `XCUIElement.typeText(_:)` enters text into the text field.

## Actual:

The password was not entered into the text field.
