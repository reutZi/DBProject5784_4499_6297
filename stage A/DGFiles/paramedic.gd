
[General]
Version=1

[Preferences]
Username=
Password=2148
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=REUT1
Name=PARAMEDIC
Count=10..20

[Record]
Name=LICENSE_NUMBER
Type=NUMBER
Size=10
Data=[111111111]
Master=

[Record]
Name=SENIORITY
Type=NUMBER
Size=2
Data=Random(1, 70)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from PERSON)
Master=

