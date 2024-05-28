
[General]
Version=1

[Preferences]
Username=
Password=2282
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=ETIK
Name=REGISTRATION
Count=800

[Record]
Name=REGISTRATIONID_
Type=NUMBER
Size=3
Data=Sequence(100, [Inc], [WithinParent])
Master=

[Record]
Name=REGISTRATIONDATE
Type=DATE
Size=
Data=Random(1/1/2019, 1/1/2024)
Master=

[Record]
Name=R_LANGUAGE
Type=VARCHAR2
Size=20
Data=List('hebrew','english','russian')
Master=

[Record]
Name=STATUS
Type=VARCHAR2
Size=20
Data=List('accepted','rejected','pending')
Master=

[Record]
Name=CHILDID
Type=NUMBER
Size=3
Data=Sequence(1, [Inc], [WithinParent])
Master=

[Record]
Name=K_TYPE_ID
Type=NUMBER
Size=3
Data=List(select K_TYPE_ID from K_TYPE)
Master=

