CREATE TABLE Person (
	PersonID SERIAL PRIMARY KEY
	,HubspotPersonID VARCHAR(100) NOT NULL
	,IsOrganization BOOLEAN DEFAULT 'f'
	,MemberOf INT
	,FOREIGN KEY (MemberOf) REFERENCES Person(PersonID)
	)

CREATE TABLE Event (
	EventID SERIAL PRIMARY KEY
	,Name VARCHAR(100)
	,Location VARCHAR(100)
	-- add more Event columns as needed 
	)

CREATE TABLE EventAttendance (
	EventAttendanceID SERIAL PRIMARY KEY
	,PersonID INT NOT NULL
	,EventID INT NOT NULL
	,PricePaid VARCHAR(100)
	-- add more Event Attendance columns as needed
	,FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
	,FOREIGN KEY (EventID) REFERENCES Event(EventID)
	)

CREATE TABLE EventEvaluation (
	EvaluationID SERIAL PRIMARY KEY
	,EventID INT NOT NULL
	,EmailAddress VARCHAR(100)
	,FOREIGN KEY (EventID) REFERENCES Event(EventID)
	)

CREATE TABLE EvaluationResponse (
	EvalResponseID SERIAL PRIMARY KEY
	,EvaluationID INT NOT NULL
	,Question VARCHAR(100) NOT NULL
	,Response VARCHAR(100)
	,FOREIGN KEY (EvaluationID) REFERENCES EventEvaluation(EvaluationID)
	)

CREATE TABLE Donation (
	DonationID SERIAL PRIMARY KEY
	,PersonID INT NOT NULL
	,EventID INT
	,Amount INT
	,InKind BOOLEAN DEFAULT 'f'
	,DonationDate DATE
	,Purpose VARCHAR(100)
	,FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
	,FOREIGN KEY (EventID) REFERENCES Event(EventID)
	)
	
CREATE TABLE MembershipActivity (
	MemberId SERIAL PRIMARY KEY
	,PersonID INT NOT NULL
	,MbrCycle VARCHAR(50) NOT NULL
	,MbrLevel VARCHAR(50) NOT NULL
	,FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
	)
