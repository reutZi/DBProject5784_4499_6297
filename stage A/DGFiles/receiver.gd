
[General]
Version=1

[Preferences]
Username=
Password=2583
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=TZIPILEV
Name=RECEIVER
Count=10..20

[Record]
Name=HOSPITAL_ID
Type=NUMBER
Size=10
Data=[11111]
Master=

[Record]
Name=HOSPITAL_NAME
Type=VARCHAR2
Size=10
Data=List('Soroka', 'Hadassah', 'Ichilov', 'Sheba', 'Assuta', 'Laniado', 'Meir', 'Rabin', 'Wolfson', 'Hadassah Ein Kerem', 'Shaare Zedek', 'Herzog', 'Hillel Yaffe', 'Rambam', 'Ziv', 'Barzilai', 'Kaplan', 'Assaf Ha’rofeh', 'Yoseftal'	 )
Master=

[Record]
Name=CITY
Type=VARCHAR2
Size=10
Data=City
Master=

[Record]
Name=DELIVERY_DATE
Type=DATE
Size=
Data=Random(1.1.2000, 1.5.2024)
Master=

[Record]
Name=HOSPITAL_PHONE
Type=NUMBER
Size=10
Data='0'+[11111111]
Master=

