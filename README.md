
Hello,

Please find the explanation of implemented  task:

As per the assignment, the application is developed using storyboards, and its written in swift.

1.When the app gets launched, a login screen is shown, with login(a label & text field), password(a label & textfeld) and submit button.
2.This screen supports orientation, if potrait all the elements are vertically aligned else they are horizontally aligned.
3.Validation is added on the click of submit button to enter username and password details. Simple validation is added to just add more than one character in the respective field.
4.An alert is thrown if the user clicks on submit button with out entering username and password.
5.Once the details are entered, and the submit button is clicked. User is navigated to a home screen where we can see a search bar in the top of the screen followed by a table view.
6.On this screen, orientation is locked. Only potrait mode is supported.
7.User is expected to enter a programming language name in the search bar and click enter key.
8.  When the user enters any programming language and hits enter, GitHub API is called.
9. The results which are fetched from API are saved to coredata. Then using the same search criteria results are fetched from coredata and listed in the table view below the search bar.
10. If API does not give a valid response, then a message �no data available� will be displayed in the place of table rows.
11. User is allowed to select a row from the tableview, once any row is selected, then app navigates to another view controller which shows the details of repository with editable text fields.
12. User is allowed to edit and save the data, by pressing save button on the navigation bar
13. The saved info can be seen on the tableview with its row selected  and highlighted.
14. The changes made to the data will be saved to coredata.


Design patterns used:
1.Delegation
2.Observer
3.Singleton
