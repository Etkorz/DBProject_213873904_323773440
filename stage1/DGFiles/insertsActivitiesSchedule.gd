
[General]
Version=1

[Preferences]
Username=
Password=2398
Database=
DateFormat=dd-mm-yyyy
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=ETIK
Name=ACTIVITYSCHEDULE
Count=400

[Record]
Name=ACT_HOUR
Type=VARCHAR2
Size=5
Data=Random(8, 15) +':'+ List(00,15,30,45)
Master=

[Record]
Name=ACTIVITY_DATE
Type=DATE
Size=
Data=Random(1/1/2024, 28/9/2024)
Master=

[Record]
Name=ACTIVITYID
Type=NUMBER
Size=3
Data=List(select ACTIVITYID from ACTIVITY)
Master=

[Record]
Name=KINDERGARTENID
Type=NUMBER
Size=3
Data=List(select KINDERGARTENID from KINDERGARTEN)
Master=

