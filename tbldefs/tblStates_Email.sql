CREATE TABLE [tblStates_Email] (
  [StateEmailIDs] AUTOINCREMENT CONSTRAINT [PrimaryKey] PRIMARY KEY UNIQUE NOT NULL,
  [State] LONG CONSTRAINT [State] UNIQUE,
  [ToEmailAddress] VARCHAR (255),
  [CCEmailAddress] VARCHAR (255),
  [EmailFrom] VARCHAR (255),
  [Subject] VARCHAR (255),
  [NameForEmail] VARCHAR (255)
)
