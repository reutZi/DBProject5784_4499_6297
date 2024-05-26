
[General]
Version=1

[Preferences]
Username=
Password=2454
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TZIPILEV
Name=DONATION_PLACE
Count=10..20

[Record]
Name=PLACE_ID
Type=NUMBER
Size=10
Data=[111111111]
Master=

[Record]
Name=PLACE_PHONE
Type=NUMBER
Size=10
Data='0'+[11111111]
Master=

[Record]
Name=MANAGER
Type=VARCHAR2
Size=20
Data=FirstName + LastName
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=25
Data=Address1
Master=

