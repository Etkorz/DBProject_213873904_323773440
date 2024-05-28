
[General]
Version=1

[Preferences]
Username=
Password=2140
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=ETIK
Name=KINDERGARTEN
Count=150

[Record]
Name=KINDERGARTENID
Type=NUMBER
Size=3
Data=[111]
Master=

[Record]
Name=K_NAME
Type=VARCHAR2
Size=30
Data=FirstName+' kindergarten' 
Master=

[Record]
Name=CAPACITY
Type=NUMBER
Size=
Data=list(15,20,25,30)
Master=

[Record]
Name=K_LANGUAGE
Type=VARCHAR2
Size=20
Data=List('hebrew', 'english','russian')
Master=

[Record]
Name=B_NUM
Type=NUMBER
Size=3
Data=List(select b_num from buildings)
Master=

[Record]
Name=K_TYPE_ID
Type=NUMBER
Size=3
Data=List(select k_type_id from k_type)
Master=

