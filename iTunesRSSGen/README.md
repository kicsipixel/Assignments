# iTunesRSSGen


## iOS Code Sample:

Create a sample iPhone app that displays the top 100 albums across all genres using Apple’s RSS generator found here: https://rss.itunes.apple.com/en-us .

### The app should: 
- Use SwiftUI
- Not use storyboards or nibs
- Not use any third party libraries
- DO NOT force unwrap your code or show signs of forced unwrapping your code
- Provide production level code with practical design patterns used

### Expected behavior:
On launch, the user should see a Table View - or similar view - showing one album per cell. Each cell should display the name of the album, the artist, and the album art (thumbnail image). Tapping on a cell should display a sheet where we see a larger image at the top of the screen and the same information that was shown on the cell, plus genre, release date, and copyright info below the image. A button should also be included on this second view that when tapped fast app switches to the album page in the iTunes store. The button should be centered horizontally and pinned 20 points from the bottom of the view and 20 points from the leading and trailing edges of the view. Unlike the first one, this “detail” sheet should NOT use a table view for layout. 

Provide your application via a link to a public Git repo (GitHub, Gitorious, etc). and send the project and send back to be reviewed by engineers and may be used for discussion topics in future interviews. Thank you for taking the time to do this.

### Manager’s Notes:
“In general, we look for solid Swift fundamentals, like no force unwrapped or implicitly unwrapped optionals (using exclamation points), proper threading use, good architecture around parsing the API response into model objects to populate the UI and using modern Swift patterns”

### Frequently Asked Questions and Answers:
1. What should be the results limit on the RSS Feed generator? 10, 100, or somewhere in between?
Up to you. 100 is fine.
 2. The button on the detail view controller should be "horizontally centered". Given that the button also must be 20 points from the bottom, do you mean that it should be vertically centered?
No. It should be horizontally centered between the left and right edges. 20 points from the bottom specifies its vertical positioning.
 3. Can the app stay in portrait mode or should it also rotate to landscape mode? This doesn't matter for the table view, but it may matter for the detail view.
 Up to you. Landscape is not required.
