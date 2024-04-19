FasdUAS 1.101.10   ��   ��    k             l     ��  ��    * $ this script goes through two steps:     � 	 	 H   t h i s   s c r i p t   g o e s   t h r o u g h   t w o   s t e p s :   
  
 l     ��  ��    � � step 1. for a given range of Plex directory id's, finds all files in those folders, and sets the added_at date for each file to its file creation time ("btime")     �  B   s t e p   1 .   f o r   a   g i v e n   r a n g e   o f   P l e x   d i r e c t o r y   i d ' s ,   f i n d s   a l l   f i l e s   i n   t h o s e   f o l d e r s ,   a n d   s e t s   t h e   a d d e d _ a t   d a t e   f o r   e a c h   f i l e   t o   i t s   f i l e   c r e a t i o n   t i m e   ( " b t i m e " )      l     ��  ��    5 / note: this for songs, movies, tv episodes, etc     �   ^   n o t e :   t h i s   f o r   s o n g s ,   m o v i e s ,   t v   e p i s o d e s ,   e t c      l     ��  ��    f ` step 2. sets the added_at value of the albums of those songs to the added_at of its first track     �   �   s t e p   2 .   s e t s   t h e   a d d e d _ a t   v a l u e   o f   t h e   a l b u m s   o f   t h o s e   s o n g s   t o   t h e   a d d e d _ a t   o f   i t s   f i r s t   t r a c k      l     ��  ��    ' ! note: this only for music albums     �   B   n o t e :   t h i s   o n l y   f o r   m u s i c   a l b u m s      l     ��������  ��  ��       !   l     "���� " r      # $ # m      % % � & & � / U s e r s / u s e r n a m e / L i b r a r y / A p p l i c a t i o n   S u p p o r t / P l e x   M e d i a   S e r v e r / P l u g - i n   S u p p o r t / D a t a b a s e s / c o m . p l e x a p p . p l u g i n s . l i b r a r y . d b $ o      ����  0 defaultlibrary defaultLibrary��  ��   !  ' ( ' l    )���� ) r     * + * n     , - , 1    ��
�� 
strq - n     . / . 1    ��
�� 
ttxt / l    0���� 0 I   �� 1 2
�� .sysodlogaskr        TEXT 1 m     3 3 � 4 4 " D a t a b a s e   l o c a t i o n 2 �� 5��
�� 
dtxt 5 o    ����  0 defaultlibrary defaultLibrary��  ��  ��   + o      ���� $0 databaselocation databaseLocation��  ��   (  6 7 6 l    8���� 8 r     9 : 9 n     ; < ; 1    ��
�� 
strq < m     = = � > > | / A p p l i c a t i o n s / P l e x   M e d i a   S e r v e r . a p p / C o n t e n t s / M a c O S / P l e x   S Q L i t e : o      ����  0 sqlitelocation sqliteLocation��  ��   7  ? @ ? l     ��������  ��  ��   @  A B A l    C���� C r     D E D m     F F � G G 4 S E L E C T   i d   F R O M   d i r e c t o r i e s E o      ���� 0 sqlquery sqlQuery��  ��   B  H I H l   # J���� J r    # K L K n    ! M N M 1    !��
�� 
strq N l    O���� O b     P Q P o    ���� 0 sqlquery sqlQuery Q m     R R � S S  ;��  ��   L o      ���� 0 	sqlquery1 	sqlQuery1��  ��   I  T U T l  $ 1 V���� V r   $ 1 W X W b   $ - Y Z Y b   $ + [ \ [ b   $ ) ] ^ ] b   $ ' _ ` _ o   $ %����  0 sqlitelocation sqliteLocation ` m   % & a a � b b    ^ o   ' (���� $0 databaselocation databaseLocation \ m   ) * c c � d d    Z o   + ,���� 0 	sqlquery1 	sqlQuery1 X o      ���� 20 getdirectorylistcommand getDirectoryListCommand��  ��   U  e f e l  2 = g���� g r   2 = h i h I  2 9�� j��
�� .sysoexecTEXT���     TEXT j o   2 5���� 20 getdirectorylistcommand getDirectoryListCommand��   i o      ���� 0 	sqloutput 	sqlOutput��  ��   f  k l k l  > I m���� m r   > I n o n n   > E p q p 2  A E��
�� 
cpar q o   > A���� 0 	sqloutput 	sqlOutput o o      ���� 0 directorylist directoryList��  ��   l  r s r l  J Z t���� t r   J Z u v u c   J V w x w n   J R y z y 4  M R�� {
�� 
cobj { m   P Q������ z o   J M���� 0 directorylist directoryList x m   R U��
�� 
long v o      ����  0 directorycount directoryCount��  ��   s  | } | l  [ n ~���� ~ r   [ n  �  b   [ j � � � l  [ f ����� � c   [ f � � � b   [ b � � � m   [ ^ � � � � �  L i b r a r y   h a s   � o   ^ a����  0 directorycount directoryCount � m   b e��
�� 
ctxt��  ��   � m   f i � � � � � N   f o l d e r s ,   w h i c h   d o   y o u   w a n t   t o   p r o c e s s ? � o      ���� 0 
dialogtext 
dialogText��  ��   }  � � � l     ��������  ��  ��   �  � � � l  o � ����� � Z   o � � ��� � � =  o � � � � n   o � � � � 1   � ���
�� 
bhit � l  o � ����� � I  o ��� � �
�� .sysodlogaskr        TEXT � o   o r���� 0 
dialogtext 
dialogText � �� � �
�� 
btns � J   u } � �  � � � m   u x � � � � �  W h o l e   L i b r a r y �  ��� � m   x { � � � � �  S e l e c t i o n��   � �� ���
�� 
dflt � m   � ����� ��  ��  ��   � m   � � � � � � �  w h o l e   l i b r a r y � r   � � � � � m   � � � � � � � V S E L E C T   m e d i a _ i t e m _ i d ,   f i l e   F R O M   m e d i a _ p a r t s � o      ���� 0 sqlquery sqlQuery��   � k   � � � �  � � � r   � � � � � c   � � � � � n   � � � � � 1   � ���
�� 
ttxt � l  � � ����� � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � & F i r s t   D i r e c t o r y   I D : � �� ���
�� 
dtxt � m   � ����� ��  ��  ��   � m   � ���
�� 
long � o      ����  0 firstdirectory firstDirectory �  � � � r   � � � � � c   � � � � � n   � � � � � 1   � ���
�� 
ttxt � l  � � ����� � I  � ��� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � & F i r s t   D i r e c t o r y   I D : � �� ���
�� 
dtxt � m   � ����� ��  ��  ��   � m   � ���
�� 
long � o      ���� 0 lastdirectory lastDirectory �  ��� � r   � � � � � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � � S E L E C T   m e d i a _ i t e m _ i d ,   f i l e   F R O M   m e d i a _ p a r t s   W H E R E   d i r e c t o r y _ i d   B E T W E E N   � o   � �����  0 firstdirectory firstDirectory � m   � � � � � � � 
   a n d   � o   � ����� 0 lastdirectory lastDirectory � o      ���� 0 sqlquery sqlQuery��  ��  ��   �  � � � l     ��������  ��  ��   �  � � � l  � � ����� � r   � � � � � n   � � � � � 1   � ���
�� 
strq � l  � � ����� � b   � � � � � o   � ����� 0 sqlquery sqlQuery � m   � � � � � � �  ;��  ��   � o      ���� 0 	sqlquery1 	sqlQuery1��  ��   �  � � � l  � � ����� � r   � � � � � m   � � � � ldt     |%�� � o      ���� 0 unixstarttime unixStartTime��  ��   �  � � � l     ��������  ��  ��   �  � � � l     �� � ���   � 4 . getting list of all mediaItemId's + filepaths    � � � � \   g e t t i n g   l i s t   o f   a l l   m e d i a I t e m I d ' s   +   f i l e p a t h s �  � � � l  � � ���� � r   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ��~�~  0 sqlitelocation sqliteLocation � m   � � � � � � �    � o   � ��}�} $0 databaselocation databaseLocation � m   � �   �    � o   � ��|�| 0 	sqlquery1 	sqlQuery1 � o      �{�{ (0 getfilelistcommand getFileListCommand��  �   �  l  ��z�y r   � I  � ��x�w
�x .sysoexecTEXT���     TEXT o   � ��v�v (0 getfilelistcommand getFileListCommand�w   o      �u�u 0 	sqloutput 	sqlOutput�z  �y   	 l 
�t�s
 r   n   2 �r
�r 
cpar o  �q�q 0 	sqloutput 	sqlOutput o      �p�p 0 filelist fileList�t  �s  	  l     �o�o     list in the format:    � (   l i s t   i n   t h e   f o r m a t :  l     �n�n   / ) 12345|/Volumes/Drive/Folder/Filename.mp3    � R   1 2 3 4 5 | / V o l u m e s / D r i v e / F o l d e r / F i l e n a m e . m p 3  l     �m�l�k�m  �l  �k    l +�j�i Z +�h�g =  !  n  "#" m  �f
�f 
nmbr# n $%$ 2 �e
�e 
cobj% o  �d�d 0 filelist fileList! m  �c�c   I  '�b&�a
�b .sysodlogaskr        TEXT& m   #'' �(( & N o   f i l e s   t o   p r o c e s s�a  �h  �g  �j  �i   )*) l ,B+�`�_+ Z ,B,-�^�], = ,9./. n  ,7010 m  37�\
�\ 
nmbr1 n ,3232 2 /3�[
�[ 
cobj3 o  ,/�Z�Z 0 filelist fileList/ m  78�Y�Y  - L  <>�X�X  �^  �]  �`  �_  * 454 l C^6�W�V6 I C^�U7�T
�U .sysodlogaskr        TEXT7 b  CZ898 b  CV:;: m  CF<< �== " a b o u t   t o   p r o c e s s  ; l FU>�S�R> c  FU?@? n  FQABA m  MQ�Q
�Q 
nmbrB n FMCDC 2 IM�P
�P 
cobjD o  FI�O�O 0 filelist fileList@ m  QT�N
�N 
TEXT�S  �R  9 m  VYEE �FF    f i l e s�T  �W  �V  5 GHG l     �M�L�K�M  �L  �K  H IJI l _hK�J�IK r  _hLML c  _dNON m  _`�H�H  O m  `c�G
�G 
longM o      �F�F 0 counter  �J  �I  J PQP l irR�E�DR r  irSTS l inU�C�BU I in�A�@�?
�A .misccurdldt    ��� null�@  �?  �C  �B  T o      �>�> 0 	starttime 	startTime�E  �D  Q VWV l s~X�=�<X r  s~YZY m  sv[[ �\\  |Z n     ]^] 1  y}�;
�; 
txdl^ 1  vy�:
�: 
ascr�=  �<  W _`_ l     �9�8�7�9  �8  �7  ` aba l     �6cd�6  c - ' get btime for each file in media_parts   d �ee N   g e t   b t i m e   f o r   e a c h   f i l e   i n   m e d i a _ p a r t sb fgf l Ah�5�4h X  Ai�3ji k  �<kk lml r  ��non [  ��pqp o  ���2�2 0 counter  q m  ���1�1 o o      �0�0 0 counter  m rsr r  ��tut n  ��vwv 2 ���/
�/ 
citmw o  ���.�. 0 fileitem fileItemu o      �-�- 0 valuesarray valuesArrays xyx l ���,�+�*�,  �+  �*  y z{z r  ��|}| n  ��~~ 4 ���)�
�) 
cobj� m  ���(�(  o  ���'�' 0 valuesarray valuesArray} o      �&�& 0 mediaitemid mediaItemId{ ��� Z  �����%�$� =  ����� o  ���#�# 0 counter  � m  ���"�" � k  ���� ��� r  ����� o  ���!�! 0 mediaitemid mediaItemId� o      � �   0 minmediaitemid minMediaItemId� ��� r  ����� o  ���� 0 mediaitemid mediaItemId� o      ��  0 maxmediaitemid maxMediaItemId�  �%  �$  � ��� Z  ������� ? ����� o  ����  0 minmediaitemid minMediaItemId� o  ���� 0 mediaitemid mediaItemId� r  ����� o  ���� 0 mediaitemid mediaItemId� o      ��  0 minmediaitemid minMediaItemId�  �  � ��� Z  ������� A ����� o  ����  0 maxmediaitemid maxMediaItemId� o  ���� 0 mediaitemid mediaItemId� r  ����� o  ���� 0 mediaitemid mediaItemId� o      ��  0 maxmediaitemid maxMediaItemId�  �  � ��� l ������  �  �  � ��� r  �
��� n  ���� 4 ��
� 
cobj� m  �� � o  ��� 0 valuesarray valuesArray� o      �
�
 0 filepath filePath� ��� r  ��� I �	��
�	 .sysoexecTEXT���     TEXT� b  ��� m  �� ��� * s t a t   - f   % S B   - t   % D / % T  � n  ��� 1  �
� 
strq� o  �� 0 filepath filePath�  � o      �� 0 	birthtime 	birthTime� ��� l ����  � @ : 12/30/14/13:40:59 for 30 Dec 2014, i.e. MM/DD/YY/HH:MM/SS   � ��� t   1 2 / 3 0 / 1 4 / 1 3 : 4 0 : 5 9   f o r   3 0   D e c   2 0 1 4 ,   i . e .   M M / D D / Y Y / H H : M M / S S� ��� l ����  �  �  � ��� r  (��� m   �� ���  /� n     ��� 1  #'� 
�  
txdl� 1   #��
�� 
ascr� ��� r  )4��� n  )0��� 2 ,0��
�� 
citm� o  ),���� 0 	birthtime 	birthTime� o      ���� 0 	birthtime 	birthTime� ��� r  5A��� n  5=��� 4 8=���
�� 
cobj� m  ;<���� � o  58���� 0 	birthtime 	birthTime� o      ���� 0 _day  � ��� r  B[��� n  BW��� 7 IW����
�� 
ctxt� m  OQ������� m  RV������� l BI������ b  BI��� m  BE�� ���  0� o  EH���� 0 _day  ��  ��  � o      ���� 0 _day  � ��� r  \h��� n  \d��� 4 _d���
�� 
cobj� m  bc���� � o  \_���� 0 	birthtime 	birthTime� o      ���� 
0 _month  � ��� r  i���� n  i~��� 7 p~����
�� 
ctxt� m  vx������� m  y}������� l ip������ b  ip��� m  il�� ���  0� o  lo���� 
0 _month  ��  ��  � o      ���� 
0 _month  � ��� r  ����� [  ����� l �������� n  ����� 4 �����
�� 
cobj� m  ������ � o  ������ 0 	birthtime 	birthTime��  ��  � m  �������� o      ���� 	0 _year  � ��� Z ��������� ?  ����� o  ������ 	0 _year  � m  �������� r  ��   l ������ \  �� o  ������ 	0 _year   m  ������ d��  ��   o      ���� 	0 _year  ��  ��  �  r  �� l ��	����	 n  ��

 4 ����
�� 
cobj m  ������  o  ������ 0 	birthtime 	birthTime��  ��   o      ���� 	0 _time    r  �� c  �� J  ��  o  ������ 0 _day    o  ������ 
0 _month   �� o  ������ 	0 _year  ��   m  ����
�� 
TEXT o      ���� 0 	birthdate 	birthDate  r  �� c  �� b  ��  b  ��!"! o  ������ 0 	birthdate 	birthDate" m  ��## �$$    a t    o  ������ 	0 _time   m  ����
�� 
TEXT o      ���� 0 	birthtime 	birthTime %&% l ����'(��  '   30/12/2014 at 13:40:59   ( �)) .   3 0 / 1 2 / 2 0 1 4   a t   1 3 : 4 0 : 5 9& *+* Z  �,-����, > ��./. o  ������ 0 	birthtime 	birthTime/ m  ��00 �11  - k  �22 343 r  ��565 4  ����7
�� 
ldt 7 o  ������ 0 	birthtime 	birthTime6 o      ���� 0 	birthtime 	birthTime4 8��8 r  �9:9 c  �;<; n �=>= I  ���?���� 0 integerstring IntegerString? @��@ \  �ABA o  � ���� 0 	birthtime 	birthTimeB o   ���� 0 unixstarttime unixStartTime��  ��  >  f  ��< m  ��
�� 
TEXT: o      ���� 0 unixtime unixTime��  ��  ��  + CDC r   EFE m  GG �HH  |F n     IJI 1  ��
�� 
txdlJ 1  ��
�� 
ascrD KLK r  !/MNM c  !-OPO J  !)QQ RSR o  !$���� 0 mediaitemid mediaItemIdS T��T o  $'���� 0 unixtime unixTime��  P m  ),��
�� 
TEXTN o      ���� 0 fileitem fileItemL UVU l 00��WX��  W   12345|1551722656   X �YY "   1 2 3 4 5 | 1 5 5 1 7 2 2 6 5 6V Z[Z l 00��������  ��  ��  [ \��\ r  0<]^] o  01���� 0 fileitem fileItem^ n      _`_ 4  4;��a
�� 
cobja o  7:���� 0 counter  ` o  14���� 0 filelist fileList��  �3 0 fileitem fileItemj o  ������ 0 filelist fileList�5  �4  g bcb l     ��������  ��  ��  c ded l     ��fg��  f ( " write btime to each metadata_item   g �hh D   w r i t e   b t i m e   t o   e a c h   m e t a d a t a _ i t e me iji l BGk����k r  BGlml m  BC����  m o      ���� 0 itemcounter itemCounter��  ��  j non l H�p����p O  H�qrq k  N�ss tut I NS������
�� .miscactvnull��� ��� null��  ��  u vwv r  T]xyx I TY��z��
�� .coredoscnull��� ��� ctxtz l TU{����{ o  TU����  0 sqlitelocation sqliteLocation��  ��  ��  y o      ���� 0 
currenttab 
currentTabw |}| I ^c��~��
�� .sysodelanull��� ��� nmbr~ m  ^_���� ��  } � I ds����
�� .coredoscnull��� ��� ctxt� l di������ b  di��� m  dg�� ���  . o p e n  � o  gh���� $0 databaselocation databaseLocation��  ��  � �����
�� 
kfil� o  lo���� 0 
currenttab 
currentTab��  � ��� I ty�����
�� .sysodelanull��� ��� nmbr� m  tu���� ��  � ���� X  z������ k  ���� ��� r  ����� [  ����� o  ������ 0 itemcounter itemCounter� m  ������ � o      ���� 0 itemcounter itemCounter� ��� r  ����� n  ����� 2 ����
�� 
citm� o  ���� 0 	mediaitem 	mediaItem� o      �~�~ 0 valuesarray valuesArray� ��� r  ����� n  ����� 4 ���}�
�} 
cobj� m  ���|�| � o  ���{�{ 0 valuesarray valuesArray� o      �z�z 0 mediaitemid mediaItemId� ��� r  ����� n  ����� 4 ���y�
�y 
cobj� m  ���x�x � o  ���w�w 0 valuesarray valuesArray� o      �v�v 0 unixtime unixTime� ��� l ���u�t�s�u  �t  �s  � ��� l ���r���r  �  get metadataItemId   � ��� $ g e t   m e t a d a t a I t e m I d� ��� r  ����� b  ����� m  ���� ��� h S E L E C T   m e t a d a t a _ i t e m _ i d   F R O M   m e d i a _ i t e m s   W H E R E   i d   =  � o  ���q�q 0 mediaitemid mediaItemId� o      �p�p 0 
sqlcommand 
sqlCommand� ��� l ���o���o  � # write btime to metadataItemID   � ��� : w r i t e   b t i m e   t o   m e t a d a t a I t e m I D� ��� r  ����� b  ����� b  ����� b  ����� b  ����� m  ���� ��� J U P D A T E   m e t a d a t a _ i t e m s   S E T   a d d e d _ a t   =  � o  ���n�n 0 unixtime unixTime� m  ���� ���    W H E R E   i d   =   (� o  ���m�m 0 
sqlcommand 
sqlCommand� m  ���� ���  ) ;� o      �l�l 0 
sqlcommand 
sqlCommand� ��� I ���k��
�k .coredoscnull��� ��� ctxt� l ����j�i� o  ���h�h 0 
sqlcommand 
sqlCommand�j  �i  � �g��f
�g 
kfil� o  ���e�e 0 
currenttab 
currentTab�f  � ��d� I ���c��b
�c .sysodelanull��� ��� nmbr� m  ���� ?��������b  �d  �� 0 	mediaitem 	mediaItem� o  }��a�a 0 filelist fileList��  r m  HK���                                                                                      @ alis    <  MacOS                      �!��BD ����Terminal.app                                                   �����!��        ����  
 cu             	Utilities   -/:System:Applications:Utilities:Terminal.app/     T e r m i n a l . a p p    M a c O S  *System/Applications/Utilities/Terminal.app  / ��  ��  ��  o ��� l     �`�_�^�`  �_  �^  � ��� l ���]�\� r  ���� \  ���� l ���[�Z� I ��Y�X�W
�Y .misccurdldt    ��� null�X  �W  �[  �Z  � o  �V�V 0 	starttime 	startTime� o      �U�U 0 itemduration itemDuration�]  �\  � ��� l ��T�S� r  ��� l ��R�Q� ^  ��� o  �P�P 0 itemcounter itemCounter� o  �O�O 0 itemduration itemDuration�R  �Q  � o      �N�N 0 	itemspeed 	itemSpeed�T  �S  � ��� l     �M�L�K�M  �L  �K  � ��� l     �J���J  � M G step 2: set the albums date_added to the date_added of the first track   � ��� �   s t e p   2 :   s e t   t h e   a l b u m s   d a t e _ a d d e d   t o   t h e   d a t e _ a d d e d   o f   t h e   f i r s t   t r a c k� ��� l     �I�H�G�I  �H  �G  � ��� l     �F���F  � I Creturns a list of metadata_item_ids, so we can take the min and max   � ��� � r e t u r n s   a   l i s t   o f   m e t a d a t a _ i t e m _ i d s ,   s o   w e   c a n   t a k e   t h e   m i n   a n d   m a x� ��� l )��E�D� r  )��� b  '� � b  # b   m   � t S E L E C T   m e t a d a t a _ i t e m _ i d   F R O M   m e d i a _ i t e m s   W H E R E   i d   B E T W E E N   o  �C�C  0 minmediaitemid minMediaItemId m  " � 
   a n d    o  #&�B�B  0 maxmediaitemid maxMediaItemId� o      �A�A 0 sqlquery sqlQuery�E  �D  � 	
	 l *3�@�? r  *3 n  *1 1  /1�>
�> 
strq l */�=�< b  */ o  *+�;�; 0 sqlquery sqlQuery m  +. �  ;�=  �<   o      �:�: 0 	sqlquery1 	sqlQuery1�@  �?  
  l 4E�9�8 r  4E b  4A b  4? b  4; b  49 !  o  45�7�7  0 sqlitelocation sqliteLocation! m  58"" �##    o  9:�6�6 $0 databaselocation databaseLocation m  ;>$$ �%%    o  ?@�5�5 0 	sqlquery1 	sqlQuery1 o      �4�4 (0 getitemlistcommand getItemListCommand�9  �8   &'& l FQ(�3�2( r  FQ)*) I FM�1+�0
�1 .sysoexecTEXT���     TEXT+ o  FI�/�/ (0 getitemlistcommand getItemListCommand�0  * o      �.�. 0 	sqloutput 	sqlOutput�3  �2  ' ,-, l R].�-�,. r  R]/0/ n  RY121 2 UY�+
�+ 
cpar2 o  RU�*�* 0 	sqloutput 	sqlOutput0 o      �)�) 0 itemlist itemList�-  �,  - 343 l ^j5�(�'5 r  ^j676 n  ^f898 4 af�&:
�& 
cobj: m  de�%�% 9 o  ^a�$�$ 0 itemlist itemList7 o      �#�# &0 firstmetadataitem firstMetadataItem�(  �'  4 ;<; l kw=�"�!= r  kw>?> n  ks@A@ 4 ns� B
�  
cobjB m  qr����A o  kn�� 0 itemlist itemList? o      �� $0 lastmetadataitem lastMetadataItem�"  �!  < CDC l     ����  �  �  D EFE l     �GH�  G } w select all tracks (metadata_type = 10), and return columns parent_id (=the metadata_item id of the album) and added_at   H �II �   s e l e c t   a l l   t r a c k s   ( m e t a d a t a _ t y p e   =   1 0 ) ,   a n d   r e t u r n   c o l u m n s   p a r e n t _ i d   ( = t h e   m e t a d a t a _ i t e m   i d   o f   t h e   a l b u m )   a n d   a d d e d _ a tF JKJ l x�L��L r  x�MNM b  x�OPO b  x�QRQ b  x�STS b  xUVU m  x{WW �XX � S E L E C T   p a r e n t _ i d , a d d e d _ a t   F R O M   m e t a d a t a _ i t e m s   W H E R E   ( m e t a d a t a _ t y p e   =   1 0   A N D   i d   B E T W E E N  V o  {~�� &0 firstmetadataitem firstMetadataItemT m  �YY �ZZ 
   a n d  R o  ���� $0 lastmetadataitem lastMetadataItemP m  ��[[ �\\  )N o      �� 0 sqlquery sqlQuery�  �  K ]^] l ��_��_ r  ��`a` n  ��bcb 1  ���
� 
strqc l ��d��d b  ��efe o  ���� 0 sqlquery sqlQueryf m  ��gg �hh  ;�  �  a o      �� 0 	sqlquery1 	sqlQuery1�  �  ^ iji l ��k��k r  ��lml b  ��non b  ��pqp b  ��rsr b  ��tut o  ���
�
  0 sqlitelocation sqliteLocationu m  ��vv �ww   s o  ���	�	 $0 databaselocation databaseLocationq m  ��xx �yy   o o  ���� 0 	sqlquery1 	sqlQuery1m o      �� (0 getitemlistcommand getItemListCommand�  �  j z{z l ��|��| r  ��}~} I ����
� .sysoexecTEXT���     TEXT o  ���� (0 getitemlistcommand getItemListCommand�  ~ o      �� 0 	sqloutput 	sqlOutput�  �  { ��� l ���� ��� r  ����� n  ����� 2 ����
�� 
cpar� o  ������ 0 	sqloutput 	sqlOutput� o      ���� 0 itemlist itemList�   ��  � ��� l     ������  �    list of parentId|added_at   � ��� 4   l i s t   o f   p a r e n t I d | a d d e d _ a t� ��� l     ������  �   12345|1551722656   � ��� "   1 2 3 4 5 | 1 5 5 1 7 2 2 6 5 6� ��� l     ��������  ��  ��  � ��� l ������� Z  �������� = ����� n  ����� m  ����
�� 
nmbr� n ����� 2 ����
�� 
cobj� o  ������ 0 itemlist itemList� m  ������  � k  ��� ��� O  ����� I ������
�� .coredoscnull��� ��� ctxt� l �������� m  ���� ��� 
 . e x i t��  ��  � �����
�� 
kfil� o  ������ 0 
currenttab 
currentTab��  � m  �����                                                                                      @ alis    <  MacOS                      �!��BD ����Terminal.app                                                   �����!��        ����  
 cu             	Utilities   -/:System:Applications:Utilities:Terminal.app/     T e r m i n a l . a p p    M a c O S  *System/Applications/Utilities/Terminal.app  / ��  � ��� I ������
�� .sysodlogaskr        TEXT� b  �
��� b  ���� b  ����� b  ����� b  ����� l �������� c  ����� o  ������ 0 itemcounter itemCounter� m  ����
�� 
TEXT��  ��  � m  ���� ��� $   f i l e s   u p d a t e d   i n  � l �������� c  ����� o  ������ 0 itemduration itemDuration� m  ����
�� 
TEXT��  ��  � m  ���� ���    s e c o n d s   (� l ������� c  ���� o  ����� 0 	itemspeed 	itemSpeed� m  ��
�� 
TEXT��  ��  � m  	�� ��� $   f i l e s   p e r   s e c o n d )��  � ���� I �����
�� .sysodlogaskr        TEXT� m  �� ��� ( N o   a l b u m s   t o   p r o c e s s��  ��  ��  ��  ��  ��  � ��� l 1������ Z 1������� = (��� n  &��� m  "&��
�� 
nmbr� n "��� 2 "��
�� 
cobj� o  ���� 0 itemlist itemList� m  &'����  � L  +-����  ��  ��  ��  ��  � ��� l     ������  � ] Wdisplay dialog "about to process " & (number of items in itemList as string) & " files"   � ��� � d i s p l a y   d i a l o g   " a b o u t   t o   p r o c e s s   "   &   ( n u m b e r   o f   i t e m s   i n   i t e m L i s t   a s   s t r i n g )   &   "   f i l e s "� ��� l     ��������  ��  ��  � ��� l 2;������ r  2;��� l 27������ I 27������
�� .misccurdldt    ��� null��  ��  ��  ��  � o      ����  0 albumstarttime albumStartTime��  ��  � ��� l <G������ r  <G��� m  <?�� ���  |� n     ��� 1  BF��
�� 
txdl� 1  ?B��
�� 
ascr��  ��  � ��� l HQ������ r  HQ��� c  HM��� m  HI����  � m  IL��
�� 
long� o      ���� 0 trackcounter trackCounter��  ��  � ��� l R[������ r  R[��� c  RW��� m  RS����  � m  SV��
�� 
long� o      ���� 0 albumcounter albumCounter��  ��  � ��� l \c������ r  \c��� m  \_�� ���  � o      ���� ,0 previoustrackalbumid previousTrackAlbumId��  ��  �    l     ����   M G set album added_at date to the first date encountered in the tracklist    � �   s e t   a l b u m   a d d e d _ a t   d a t e   t o   t h e   f i r s t   d a t e   e n c o u n t e r e d   i n   t h e   t r a c k l i s t  l d���� O  d	 k  j

  X  j �� k  ��  r  �� [  �� o  ������ 0 trackcounter trackCounter m  ������  o      ���� 0 trackcounter trackCounter  r  �� n  �� 2 ����
�� 
citm o  ������ 	0 track   o      ���� 0 valuesarray valuesArray  r  �� n  �� !  4 ����"
�� 
cobj" m  ������ ! o  ������ 0 valuesarray valuesArray o      ���� 0 albumid albumId #$# r  ��%&% n  ��'(' 4 ����)
�� 
cobj) m  ������ ( o  ������ 0 valuesarray valuesArray& o      ���� 0 trackaddedat trackAddedAt$ *+* l ����������  ��  ��  + ,-, l ����./��  . 3 - only process when we arrive at a new albumID   / �00 Z   o n l y   p r o c e s s   w h e n   w e   a r r i v e   a t   a   n e w   a l b u m I D- 121 Z  ��34����3 > ��565 o  ������ 0 albumid albumId6 o  ������ ,0 previoustrackalbumid previousTrackAlbumId4 k  ��77 898 l ����:;��  :  write added_at to album   ; �<< . w r i t e   a d d e d _ a t   t o   a l b u m9 =>= r  ��?@? b  ��ABA b  ��CDC b  ��EFE b  ��GHG m  ��II �JJ J U P D A T E   m e t a d a t a _ i t e m s   S E T   a d d e d _ a t   =  H o  ������ 0 trackaddedat trackAddedAtF m  ��KK �LL    W H E R E   i d   =  D o  ������ 0 albumid albumIdB m  ��MM �NN  ;@ o      ���� 0 
sqlcommand 
sqlCommand> OPO l ����QR��  Q  display dialog sqlCommand   R �SS 2 d i s p l a y   d i a l o g   s q l C o m m a n dP TUT I ����VW
�� .coredoscnull��� ��� ctxtV l ��X����X o  ������ 0 
sqlcommand 
sqlCommand��  ��  W ��Y��
�� 
kfilY o  ������ 0 
currenttab 
currentTab��  U Z[Z I ����\��
�� .sysodelanull��� ��� nmbr\ m  ��]] ?���������  [ ^��^ r  ��_`_ [  ��aba o  ������ 0 albumcounter albumCounterb m  ������ ` o      ���� 0 albumcounter albumCounter��  ��  ��  2 c��c r  ��ded o  ������ 0 albumid albumIde o      ���� ,0 previoustrackalbumid previousTrackAlbumId��  �� 	0 track   o  mp���� 0 itemlist itemList f��f I ��gh
�� .coredoscnull��� ��� ctxtg l i��~i m  jj �kk 
 . e x i t�  �~  h �}l�|
�} 
kfill o  
�{�{ 0 
currenttab 
currentTab�|  ��  	 m  dgmm�                                                                                      @ alis    <  MacOS                      �!��BD ����Terminal.app                                                   �����!��        ����  
 cu             	Utilities   -/:System:Applications:Utilities:Terminal.app/     T e r m i n a l . a p p    M a c O S  *System/Applications/Utilities/Terminal.app  / ��  ��  ��   non l     �z�y�x�z  �y  �x  o pqp l 7r�w�vr I 7�us�t
�u .sysodlogaskr        TEXTs b  3tut b  /vwv b  'xyx b  #z{z b  |}| l ~�s�r~ c  � o  �q�q 0 itemcounter itemCounter� m  �p
�p 
TEXT�s  �r  } m  �� ��� $   f i l e s   u p d a t e d   i n  { l "��o�n� c  "��� o  �m�m 0 itemduration itemDuration� m  !�l
�l 
TEXT�o  �n  y m  #&�� ���    s e c o n d s   (w l '.��k�j� c  '.��� o  '*�i�i 0 	itemspeed 	itemSpeed� m  *-�h
�h 
TEXT�k  �j  u m  /2�� ��� $   f i l e s   p e r   s e c o n d )�t  �w  �v  q ��� l 8E��g�f� r  8E��� \  8A��� l 8=��e�d� I 8=�c�b�a
�c .misccurdldt    ��� null�b  �a  �e  �d  � o  =@�`�`  0 albumstarttime albumStartTime� o      �_�_ 0 albumduration albumDuration�g  �f  � ��� l Fa��^�]� Z  Fa���\�� > FK��� o  FI�[�[ 0 albumduration albumDuration� m  IJ�Z�Z  � r  NY��� l NU��Y�X� ^  NU��� o  NQ�W�W 0 albumcounter albumCounter� o  QT�V�V 0 albumduration albumDuration�Y  �X  � o      �U�U 0 
albumspeed 
albumSpeed�\  � r  \a��� m  \]�T�T��� o      �S�S 0 
albumspeed 
albumSpeed�^  �]  � ��� l b���R�Q� I b��P��O
�P .sysodlogaskr        TEXT� b  b���� b  b���� b  by��� b  bu��� b  bm��� l bi��N�M� c  bi��� o  be�L�L 0 albumcounter albumCounter� m  eh�K
�K 
TEXT�N  �M  � m  il�� ��� &   a l b u m s   u p d a t e d   i n  � l mt��J�I� c  mt��� o  mp�H�H 0 albumduration albumDuration� m  ps�G
�G 
TEXT�J  �I  � m  ux�� ���    s e c o n d s   (� l y���F�E� c  y���� o  y|�D�D 0 
albumspeed 
albumSpeed� m  |�C
�C 
TEXT�F  �E  � m  ���� ��� $   f i l e s   p e r   s e c o n d )�O  �R  �Q  � ��� l     �B�A�@�B  �A  �@  � ��� j     �?��? 0 pmaxint pMaxInt� \     ��� l    ��>�=� a     ��� m     �<�< � m    �;�; �>  �=  � m    �:�: � ��� l     �9�8�7�9  �8  �7  � ��� i    
��� I      �6��5�6 0 integerstring IntegerString� ��4� o      �3�3 0 n  �4  �5  � Z     J���2�� ?     ��� o     �1�1 0 n  � o    �0�0 0 pmaxint pMaxInt� k   
 B�� ��� r   
 ��� J   
 �� ��� o   
 �/�/ 0 n  � ��.� m    �� ���  �.  � J      �� ��� o      �-�- 0 lngrest lngRest� ��,� o      �+�+ 0 str  �,  � ��� V    <��� k   & 7�� ��� r   & 1��� b   & /��� l  & -��*�)� c   & -��� c   & +��� l  & )��(�'� `   & )��� o   & '�&�& 0 lngrest lngRest� m   ' (�%�% 
�(  �'  � m   ) *�$
�$ 
long� m   + ,�#
�# 
TEXT�*  �)  � o   - .�"�" 0 str  � o      �!�! 0 str  � �� � r   2 7��� _   2 5��� o   2 3�� 0 lngrest lngRest� m   3 4�� 
� o      �� 0 lngrest lngRest�   � ?   " %� � o   " #�� 0 lngrest lngRest  m   # $�� 
� � b   = B l  = @�� c   = @ o   = >�� 0 lngrest lngRest m   > ?�
� 
TEXT�  �   o   @ A�� 0 str  �  �2  � c   E J c   E H	
	 o   E F�� 0 n  
 m   F G�
� 
long m   H I�
� 
TEXT� � l     ����  �  �  �       � %���   �
�	�����
 0 pmaxint pMaxInt�	 0 integerstring IntegerString
� .aevtoappnull  �   � ****�  0 defaultlibrary defaultLibrary�  �   A����    ������ 0 integerstring IntegerString� � �    ���� 0 n  �   �������� 0 n  �� 0 lngrest lngRest�� 0 str   ���������
�� 
cobj�� 

�� 
long
�� 
TEXT� K�b    =��lvE[�k/E�Z[�l/E�ZO h����#�&�&�%E�O��"E�[OY��O��&�%Y ��&�& ��������
�� .aevtoappnull  �   � **** k    �     '  6  A  H  T  e  k  r  |    �!!  �""  �##  �$$ %% && '' )(( 4)) I** P++ V,, f-- i.. n// �00 �11 �22 	33 44 &55 ,66 377 ;88 J99 ]:: i;; z<< �== �>> �?? �@@ �AA �BB �CC �DD EE pFF �GG �HH �����  ��  ��   �������� 0 fileitem fileItem�� 0 	mediaitem 	mediaItem�� 	0 track   � %�� 3���������� =�� F�� R�� a c���������������� ��� ����� � ������� � � ��� ��� � � � ��� � ������'<��E������[��������������������������������������������#0������G�������������������������"$��������WY[gvx�������������������IKM]j������������  0 defaultlibrary defaultLibrary
�� 
dtxt
�� .sysodlogaskr        TEXT
�� 
ttxt
�� 
strq�� $0 databaselocation databaseLocation��  0 sqlitelocation sqliteLocation�� 0 sqlquery sqlQuery�� 0 	sqlquery1 	sqlQuery1�� 20 getdirectorylistcommand getDirectoryListCommand
�� .sysoexecTEXT���     TEXT�� 0 	sqloutput 	sqlOutput
�� 
cpar�� 0 directorylist directoryList
�� 
cobj
�� 
long��  0 directorycount directoryCount
�� 
ctxt�� 0 
dialogtext 
dialogText
�� 
btns
�� 
dflt�� 
�� 
bhit��  0 firstdirectory firstDirectory�� 0 lastdirectory lastDirectory�� 0 unixstarttime unixStartTime�� (0 getfilelistcommand getFileListCommand�� 0 filelist fileList
�� 
nmbr
�� 
TEXT�� 0 counter  
�� .misccurdldt    ��� null�� 0 	starttime 	startTime
�� 
ascr
�� 
txdl
�� 
kocl
�� .corecnte****       ****
�� 
citm�� 0 valuesarray valuesArray�� 0 mediaitemid mediaItemId��  0 minmediaitemid minMediaItemId��  0 maxmediaitemid maxMediaItemId�� 0 filepath filePath�� 0 	birthtime 	birthTime�� 0 _day  ������ 
0 _month  ����� 	0 _year  ����� d�� 	0 _time  �� 0 	birthdate 	birthDate
�� 
ldt �� 0 integerstring IntegerString�� 0 unixtime unixTime�� 0 itemcounter itemCounter
�� .miscactvnull��� ��� null
�� .coredoscnull��� ��� ctxt�� 0 
currenttab 
currentTab
�� .sysodelanull��� ��� nmbr
�� 
kfil�� 0 
sqlcommand 
sqlCommand�� 0 itemduration itemDuration�� 0 	itemspeed 	itemSpeed�� (0 getitemlistcommand getItemListCommand�� 0 itemlist itemList�� &0 firstmetadataitem firstMetadataItem�� $0 lastmetadataitem lastMetadataItem��  0 albumstarttime albumStartTime�� 0 trackcounter trackCounter�� 0 albumcounter albumCounter�� ,0 previoustrackalbumid previousTrackAlbumId�� 0 albumid albumId�� 0 trackaddedat trackAddedAt�� 0 albumduration albumDuration�� 0 
albumspeed 
albumSpeed����E�O���l �,�,E�O��,E�O�E�O��%�,E�O��%�%�%�%E` O_ j E` O_ a -E` O_ a i/a &E` Oa _ %a &a %E` O_ a a a lva la   a !,a "  
a #E�Y ;a $�kl �,a &E` %Oa &�ll �,a &E` 'Oa (_ %%a )%_ '%E�O�a *%�,E�Oa +E` ,O�a -%�%a .%�%E` /O_ /j E` O_ a -E` 0O_ 0a -a 1,j  a 2j Y hO_ 0a -a 1,j  hY hOa 3_ 0a -a 1,a 4&%a 5%j Oja &E` 6O*j 7E` 8Oa 9_ :a ;,FO�_ 0[a <a l =kh  _ 6kE` 6O�a >-E` ?O_ ?a k/E` @O_ 6k  _ @E` AO_ @E` BY hO_ A_ @ _ @E` AY hO_ B_ @ _ @E` BY hO_ ?a l/E` COa D_ C�,%j E` EOa F_ :a ;,FO_ Ea >-E` EO_ Ea l/E` GOa H_ G%[a \[Zi\Za I2E` GO_ Ea k/E` JOa K_ J%[a \[Zi\Za I2E` JO_ Ea m/a LE` MO_ Ma N _ Ma OE` MY hO_ Ea a  /E` PO_ G_ J_ Mmva 4&E` QO_ Qa R%_ P%a 4&E` EO_ Ea S &*a T_ E/E` EO)_ E_ ,k+ Ua 4&E` VY hOa W_ :a ;,FO_ @_ Vlva 4&E�O�_ 0a _ 6/F[OY�SOjE` XOa Y �*j ZO�j [E` \Olj ]Oa ^�%a __ \l [Olj ]O �_ 0[a <a l =kh _ XkE` XO�a >-E` ?O_ ?a k/E` @O_ ?a l/E` VOa `_ @%E` aOa b_ V%a c%_ a%a d%E` aO_ aa __ \l [Oa ej ][OY��UO*j 7_ 8E` fO_ X_ f!E` gOa h_ A%a i%_ B%E�O�a j%�,E�O�a k%�%a l%�%E` mO_ mj E` O_ a -E` nO_ na k/E` oO_ na i/E` pOa q_ o%a r%_ p%a s%E�O�a t%�,E�O�a u%�%a v%�%E` mO_ mj E` O_ a -E` nO_ na -a 1,j  Ia Y a wa __ \l [UO_ Xa 4&a x%_ fa 4&%a y%_ ga 4&%a z%j Oa {j Y hO_ na -a 1,j  hY hO*j 7E` |Oa }_ :a ;,FOja &E` ~Oja &E` Oa �E` �Oa Y � �_ n[a <a l =kh _ ~kE` ~O�a >-E` ?O_ ?a k/E` �O_ ?a l/E` �O_ �_ � <a �_ �%a �%_ �%a �%E` aO_ aa __ \l [Oa �j ]O_ kE` Y hO_ �E` �[OY�Oa �a __ \l [UO_ Xa 4&a �%_ fa 4&%a �%_ ga 4&%a �%j O*j 7_ |E` �O_ �j _ _ �!E` �Y iE` �O_ a 4&a �%_ �a 4&%a �%_ �a 4&%a �%j �  �   ascr  ��ޭ