Feature: Gmail Compose Functionality
  As a Gmail user
  I want to use the compose feature
  So that I can send an email with the subject "Incubyte" and body " QA test for Incubyte"

  # Positive Scenarios
  Scenario: Successfully send an email with the specified subject and body
    Given the user is logged into their Gmail account
    And the user has opened the Compose window
    When the user enters a valid email address in the "To" field
    And the user enters "Incubyte" in the "Subject" field
    And the user enters " QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then a "Message sent" confirmation should be displayed
    And the email should be visible in the "Sent" folder

  Scenario: Automatically save the email as a draft when closed
    Given the user is logged into their Gmail account
    And the user has opened the Compose window
    When the user enters "Incubyte" in the "Subject" field
    And the user enters " QA test for Incubyte" in the email body
    And the user closes the Compose window without clicking send
    Then the email should be automatically saved in the "Drafts" folder

  # Negative Scenarios
  Scenario: Attempt to send an email without a recipient
    Given the user is logged into their Gmail account
    And the user has opened the Compose window
    When the user leaves the "To" field blank
    And the user enters "Incubyte" in the "Subject" field
    And the user enters " QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then an error message should be displayed asking to specify a recipient
    And the email should not be sent

  Scenario: Attempt to send an email with an invalid recipient format
    Given the user is logged into their Gmail account
    And the user has opened the Compose window
    When the user enters an invalid email format in the "To" field
    And the user enters "Incubyte" in the "Subject" field
    And the user enters " QA test for Incubyte" in the email body
    And the user clicks the "Send" button
    Then an error message should be displayed stating the email is invalid
    And the email should not be sent
