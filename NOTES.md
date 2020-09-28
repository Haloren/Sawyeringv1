Make with JS & Rails 
Mobile & Desktop version so it can be updated from anywhere and be displayed on the family digital calendar

To Do List:

	-initial house login will need login as well as a member login (will need a nested login form)
		@~37:00 https://www.youtube.com/watch?v=D3FckMeGubE&feature=emb_logo
	-When I change the database add an emoji column to user/member 
		(could I have a way to take in an URL that goes to a picture to change a picture?)
	-House Login and then nest Parents(admin)/Kids login def current_household
	-Parents and Kids will need to login to make my models work def current_member
	-Auth will move to member instead of household
	
	-before_action :authenticate
		put in associated controllers: skip_before_action :authenticate only[:show, :index] to stop 
		infinite loops
	

	-Create links for members that shows their chores 
	-Assign Chores to Members on member/1 and use an if admin to display update/delete
	
	--Set up OmniAuth



Make a Sawyering Logo for where the Home button is going to be 
  -logo will be a paintbrush with paint on the end with a brush stroke of paint or paint splatter
  -Sawyering Text will be paint stroke/splatter and in small text the words home will be under the handle
  -option2 white fence with shadows: 
	a fence with the word Sawyering being painted on it by a brush or 
	by a bunch of kids and a kid off to the side sitting on a barrel eating an apple

Chores uncoverable picture as a reward when a total score is completed from completing chores.
	(random pic is generated from a folder)
	-Use css pictures to over lay and blur out the picture

Uncoverable Pictures should correspond to weekly picture the emotes are moving along
	ex: ocean theme, snow theme, holiday/season theme, space theme (Amy can provide some of these pictures)
Uncoverable Picture should be a learning moment and could use the same picture with different things to find to provide a way to use less images by just repositioning the button under different things
Uncoverable Picture Ideas (top of picture has instruction on what you're looking for):
	Sky full of stars and find the planet or constellation
	Where's Waldo, but with my own made up character
	Ocean scene (beach or underwater) and find the animal or shell or something
	Animal landscape and find the animal

Points total could add up to unlock new emojis or user pictures
	
Use a scope method to make a search function for the List of All chores

reset chore points for admin either:
	- make a form that allows admin to change the point values
	- make a button that sets points to 0 (point_counter = member.current_pts - member.current_pts) 


Complete and incomplete scope methods
---------------------------------------------------------------------------------------------------
*updated from original 

Household	'/household/household.id'
  table: name / email / password_digest
	has_many :members

Members		'/household/household.id/members/members.id'
  table: name / points:integer / admin:boolean /password_digest*
	belongs_to :household	

	has_many :chores
	has_many :member_chores
	has_many :chores, through :member_chores

Chores		'/chores'			
  table: name:string / points:integer / description:string / member_id:integer
	belongs_to :member
	
has_many :member_chores
	has_many :members, through :member_chores

Member Chores
  table: member_id:integer / chore_id:integer / comment
	belongs_to :members
	belongs_to :chores
	
	has_many :comments (remove comments in v2, it's unnecessary)



Do this after I get the other stuff working, maybe add as v2
Photo point tally will be handled as a method that checks the database to compare member's point totals
set up with a Postgre database

Color scheme button lets you change the background gradient color gif
	-user with most photo_pts can change (must surpass 
	-changes after a certain % of chores is complete 
		(total/sum # of chores and divide by # of colors) 

Images
For the Picture Page: Add in the read me that the App must be used at a certain screen size, show an error screen if the screen size is the wrong size for the Picture Page (maybe by using a pixel limit)
-image contains directions that provide submit button placement on the page (submit button is in the location of the find a character underlayed on the photo)

WIFI Password: Image reveal could be a wifi passcode for older kids
		-would need a pending approval so the parent can vefify a chore is done and make complete


Gemfile
 Omniauth-Google (gem 'omniauth-google-oauth2')
 Bcrypt (gem 'bcrypt')
 ByeBug (gem 'byebug') / DotEnv (gem 'dotenv-rails')
	group :development, :test do 
    		gem 'sqlite3'    
		gem 'byebug'
		gem 'dotenv-rails'
	end

v2
Devise (gem 'devise')

Postgres (gem 'pg')
	group :production do 
  		gem 'pg'        
	end

Bootstrap (gem 'bootstrap')
	gem 'bootstrap'
	gem 'jquery-rails"
	gem 'json'
______________________________________________________________________________________________________

The from BLAMMO IDEA!
With households now embracing tech, e.g. computer refridgerators, soon the family whiteboard/calendar will be as common as a digital front door or window, what those's are not common place yet? Anyways now that you have a touch screen whiteboard/calendar in the middle of the house why not spruce up your family chores and display them for all to see and even allow them to be updated from everyones phone whenever a chore is completed, because lets be honest if you clean your room why would you want to leave it? 

Now there are chore lists with check boxes or lines drawn through when a task is completed, but why settle for something so simple. How would you like to do your chores and get to treat it as game in the process?(Maybe this app should be called Tom Sawyering?) 

Well you guessed it, now you can!
You can complete a chore and add up your points to uncover a picture, once you complete your chores the picture will be revealed, WOW! 
oh you're not impressed, well did you find Waldo or the invisible cow on that picture and click on him?
What you didn't! well get to it so that picture is marked completed. 
You found him, awesome check it out on the main page your emoji is moving along {moving along the maze/racetrack/ski slope or taking off in a rocket and flying around the earth/floating away in a balloon into the sunset/building a robot and now it's dancing or or dinosaur something}, 
oh wait and there's more!

It looks like you have also now completed more lists than everyone else and what's this a new box appeared! with a drop down to change colors for the background? 
Yeah that's right you get control to change the background color for everyone, you're the king of the castle.... well chore board and there's nothing they can do about.... well except do more chores.
Awesome now everyone knows you're better than them.... I mean you are accomplishing tasks and winning the day (seize the crap), now how long can you hold that title?


BELOW THIS LINE IS AN APP "WISH" LIST
________________________________________________________________________________________________________
 
App NAMES: LEARN TO ADULT / SHHHH-IT-LIST / Tom Sawyering
https://findtheinvisiblecow.com/
where's waldo - use where's the gnome 	(hide a gnome in an actual picture to use)
					(could have multiple items to find in same picture so I can reuse the same 					picture with just moving the submit button around)

Chores/Goals List and completion of chores will do something like:

Reveals a: Matching turn over card game / Matching messy room, match the toys to clean the room
 
Photos
 -uncover a photo (this could be for adults like in the move Major League or as a honey do list)
	-picture is randomized from a folder
	-picture is a where's waldo/find the invisible cow (interactive picture)
		(disable mouse selector/ make mouse fixed as arrow for older kids)
		(find and click Waldo/Cow/Whatever to win and receive the button to change color scheme)
		(take an actual photo with something hidden in it: like a stack of stuffed animals or 		have Amy take these pictures)
 
 -image is reveiled by being wiped, brushed, or scratched away
	(use a repeating system for wiping/scratching away sections to show image)
	ex: 	step1- partly clears top right (blury or with paint marks)
		step2- partly clears accross to bottom left (blury or with paint marks)
		step3- partly clears bottom right (blury or with paint marks)
		step4- partly clears across top left (blury or with paint marks)
		repeat
		completion of all tasks shows a clear picture (w/firework effect in corners) 


Family Competitition (find the submit button in the photo the most to access change background ability) 
 -dropdown race as a something: rocket ship, hot air balloon, car, robot, dinosaur, unicorn
 -emoji sits in/on thing it is racing with
 -track or race background can change with emojis running on the same path
 -user tile/card: Username / photo_pts Counter / User Emoji
 
Color Theme
 -compares all users photo_pts & user with most points can change background color theme (3 choices) 
	user with the most points is displayed with the layout background change dropdown
		(if you don't have the most points this option does not appear)
	choice ex: Purple, Orange, Green or Pink, Yellow, Blue or Holiday/Seasonal images/gifs

Chores
 -Chore lists can be created / updated / deleted (have basic chores preloaded)
 -Chores should have point values 
 -Chores should have: name / chore_id / points 
 
 -Negative points chore so parents can take away points when kids misbehave
 

-User Chore List Page has a status next to chore list Not Complete/Pending Approval/Completed 
-When completed points are added to total, when a set amount is reached then reveal pic button appears
	(if chore_pts > set_pts then pic_button_link) 

NO ADMIN OPTION, just limit the password to family members that follow the rules, otherwise they have to get a parent to enter their completed chores

Points will need to reset (for chore_pts & photo_pts):
-on their own by a timestamp? or have a button that will reset the points 


______________________________________________________________________________________________________
Sawyering 1.1
App can work similar to an appointment/scheduling calendar: https://github.com/DakotaLMartinez/rails-appointments
https://www.youtube.com/watch?time_continue=13&v=-nxurNWE1mI&feature=emb_logo @13:00

https://github.com/Haloren/Sawyeringv1.1
routes:
users/new
chores/new

- Add an Emoji column to Members so it can be displayed on home page with name

Tasks:
-Set up Create Account, Login, and Logout
-Setup Database
-Setup OmniAuth - Google (Create a Google/Facebook Account for testing purposes)
-Create New/create Forms [Household], [Users], [Chores]
-Create Edit/create Forms [Household], [Users], [Chores]


Household (Show, New/Create, Edit/Update , Destroy)
  table: name / email / password_digest
	has_many :users
	has_many :chores

Chores (Index, New/Create) / Chore (Show, Edit/Update, Destroy)				
  table: name:string / points:integer / description:string / members_id:integer
	belongs_to :users
	belongs_to :household

	has_many :weekdays
	has_many :users, through :weekdays

Users (Show, New/Create, Edit/Update , Destroy)
  table: name / points:integer / emoji:text / admin:boolean
	(note: if UTF8 emoji doesn't work just use the users first initial for v1, v2 Devise can use avatars)
	has_many :chores

	has_many :weekdays
	has_many :chores, through :weekdays

Weekdays (Chore is Assigned to: Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,& Weekly Chores) 
  table: member_id:integer / chores_id:integer / duedate:date
	belongs_to :user
	belongs_to :chore

Example of form for Weekdays:
<%= form_for @ do |f| %>
<%= f.select :weekdays,options_for_select(["Sun","Mon", "Tues", "Wed", "Thrus", "Fri", "Sat", "Weekly"]), include_blank: true %>
<% end %>


_______________________________________________________________________________________________________________
How to make a: Where's waldo / Invisiable Cow game walkthrough
  - https://www.youtube.com/watch?v=hLvlHCnv_k8

Make Color Change Cards: https://www.youtube.com/watch?v=AwRb8LX-szg


_______________________________________________________________________________________________________________
_______________________________________________________________________________________________________________
Turn any TV into a touch screen: https://www.touchjet.com/wave-lily/
Touch Screen Projector: http://www.hachismart.com/en/hachiinfinite

Sawyering Expanded to an everything board:

Screen saver Family picture carousel &/or collage
	-pictures could be displayed as a border with other apps displayed around the pictures or vice versa

Post it Notes Board
	-CRUD post it notes
	-Master Pad with Radio Buttons for post it color to get new post it from
	-Radio buttons allow you to change the post it note COLOR
	-Speak to text
	-Pen Writing option so you could draw/hand write a note
	-Title for Columns (Add or Remove Columns)
	-Drag and drop post it notes
	-Animate delete a note: 
		Post it crumbles up when clicking the 'x' or recycle logo on post it
		Then on confirmation note goes back to the master pad or flys off screen

WhiteBoard
	-Speak to text
	-Hand written option

Calendar/Events Calendar
	-Add/Delete Events to/from Calendar 
	-Prepopulate Seasons
	-Have radio buttons that follow different holidays by country/religion/etc)
	-Countdown Page (when clicking on a date that has an event saved in the calendar)

Weather & Clock
	-Default as a screen saver
	-Background image is based on the City/State being displayed
	-Clock options: Digital, Traditional, etc
	-Day of Week and Date Displayed
	-Switches from day to night based on sunrise/sunset
		-Display sunrise & sunset times
	-Displays City weather is currently displayed for
	-Displays Weather by location or by entering zip code/city 
	-Weather Displayed: Current Temp/ todays high & low/ 3 day forcast / wind speed
	-Has an icon that shows type of weather
	-Has an extreme weather notification
	-Additional Locations (up to 3): this is a seperate box that only shows current City, State and Temp

