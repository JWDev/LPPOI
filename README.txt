README.txt
==========

Project: 	LPPointOfInterest
Date:		October 9, 2011
Author:		Joshua Worby


1. Project Organization
-----------------------

The project is organized into the following subdirectories:

docs - Documentation directory containing application flow document.
LPPointOfInterest - Project code base directory containing all project resources and code.


2. External Libraries Used
--------------------------

2.1 JSON Framework
Code used for JSON parsing can be found at http://code.google.com/p/json-framework/ and is covered under the BSD License.


3. Images Used
--------------

3.1 Splash Screen
Taken from Lonely Planet - London application, which I modified to add the prefix "JW".  If this needs to be removed for
copyright reasons, please let me know.


3.2 Main Menu
Images taken from general Google search for "London".  Took 4 decent landscape images and resized them to 320x240.


4. Implementation Details
-------------------------

Refer to docs/LPPointOfInterest_AppFlow.png for the initial application flow ideas.  


4.1 Basic Functionality Features

a) Tableview controller
    - json file loading
    - json parsing into a dictionary
    - building data source into a format fit for tableview
    - dynamically created tableview index
    - selecting row goes to detail view
b) Details view
    - dynamic layout based on content

Tableview index contains more than the A-Z spec'ed, accounting for possible POI names starting with a number.
This decision was made to avoid the loss of POIs, as well as, simplifying the dynamic creation of the index.


4.2 Extra Features Completed

a) Detail view has map option
b) Map option brings up mapview with pin locating POI
c) Main menu screen
    - points of interest button -- takes you to tableview
    - credits button -- takes you to basic credits/about screen
    - image view that animates image swaps every 3 seconds
d) Splash screen with modified Lonely Planet London image 
e) Stylized app to have same colours as Lonely Planet London app


4.3 Extra Features (TODO)

a) Filtering
    - button with popup to select the appropriate poi type              (1 day)
    - filtered tableview results based on type                          (1 day)
    - add an icon for each type to each tableview item                  (2 hours)
    - add an icon for each type to each POI detail view                 (4 hours)
b) Add phone number to details view to allow for touch calling          (4 hours)
c) Add "more info" details type view similar to Lonely Planet London    (2 days)


4.4 Extra Features Left Out

a) Mapview containing all POIs: The data set is too large that performance would have become a major issue.



