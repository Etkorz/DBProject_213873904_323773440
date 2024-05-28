
[General]
Version=1

[Preferences]
Username=
Password=2883
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=ETIK
Name=BUILDINGS
Count=50

[Record]
Name=B_NUM
Type=NUMBER
Size=3
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=ADDRESS
Type=VARCHAR2
Size=30
Data=Address1
Master=

[Record]
Name=ACCESSIBLE
Type=VARCHAR2
Size=3
Data=list('yes','no')
Master=

