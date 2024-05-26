
[General]
Version=1

[Preferences]
Username=
Password=2876
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TZIPILEV
Name=DONATION
Count=10..20

[Record]
Name=DONATION_ID
Type=NUMBER
Size=10
Data=[111111111]
Master=

[Record]
Name=PASS_TESTS
Type=CHAR
Size=1
Data=List('Y', 'N')
Master=

[Record]
Name=DONATION_DATE
Type=DATE
Size=
Data=Random(1.1.2000, 1.5.2024)
Master=

[Record]
Name=VALID
Type=CHAR
Size=1
Data=List('Y', 'N')
Master=

[Record]
Name=LICENSE_NUMBER
Type=NUMBER
Size=10
Data=List(select license_number from PARAMEDIC)
Master=

[Record]
Name=PERSON_ID_PARAMEDIC
Type=NUMBER
Size=10
Data=List(select person_id from PARAMEDIC)
Master=

[Record]
Name=PERSON_ID_DONOR
Type=NUMBER
Size=10
Data=List(select person_id from DONOR)
Master=

[Record]
Name=PLACE_ID
Type=NUMBER
Size=10
Data=List(select place_id from DONATION_PLACE)
Master=

[Record]
Name=HOSPITAL_ID
Type=NUMBER
Size=10
Data=List(select hospital_id from RECEIVER)
Master=

