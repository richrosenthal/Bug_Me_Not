has_many & belongs_to relationships

has_many through

Users can login into the site. Create projects, see other projects.
Log errors to the projects and assign the errors to other users to complete.
Users can submit status updates to the errors.  
Users can close the errors or mark them complete.

Projects have many errors.
Users create many errors and have errors assigned to them.
Every error has status updates.

Project attributes
   Title
   Description
   Possibly required compeletion date?

User
  Name
  Password
  Picture?

Errors
   User created by
   Title
   Description
   Complete yes or no

Status updates
  User created by
  Message or description
  Time?



Users model
  has_many status updates

Projects model
  has_many errors
  has_many users through errors?


Errors model
  belongs to Projects
  has many_status updates

Status updates model
  has_many through
  belongs_to tickets
