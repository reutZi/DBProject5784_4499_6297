
[General]
Version=1

[Preferences]
Username=
Password=2603
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TZIPILEV
Name=DONOR
Count=10..20

[Record]
Name=GENDER
Type=CHAR
Size=1
Data=List('F', 'M')
Master=

[Record]
Name=BIRTH_DATE
Type=DATE
Size=
Data=Random(1.1.1960, 1.5.2006)
Master=

[Record]
Name=PERSON_ID
Type=NUMBER
Size=10
Data=List(select person_id from PERSON)
Master=

[Record]
Name=SIGN
Type=CHAR
Size=1
Data=List(select sign from BLOOD)
Master=

[Record]
Name=TYPE
Type=CHAR
Size=2
Data=List(select type from BLOOD)
Master=

