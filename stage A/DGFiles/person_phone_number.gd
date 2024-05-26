
[General]
Version=1

[Preferences]
Username=
Password=2987
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TZIPILEV
Name=PERSON_PHONE_NUMBER
Count=10..20

[Record]
Name=PHONE_NUMBER
Type=NUMBER
Size=10
Data='05'+[11111111]
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from PERSON)
Master=

