20CLEAR300,-16385
30DISKLOAD"CODE"
35CALL-16384:POKE&"47FD",0
40GOSUB7600
45INIT0,0:TX3,0,0:PRINT:PRINTSPC(10)"VEUILLEZ PATIENTER"
50GOSUB8000:REM CHARGEMENT VARIABLES
51GOSUB7500
55MODEMN:INIT0,0:TX0,0,0
57DIM P(12):P(11)=0:P(12)=0
60SALLE=1
70FORN=1TO10
80P(N)=0:C(N)=0
85NEXTN
90C(3)=14:C(7)=12:C(1)=80:C(9)=12
100IFSALLE<>14ANDSALLE<>16ANDSALLE<>17ANDSALLE<>19 THENP(2)=0 
105IFP(2)=0 THEN 200 
106IFO(22)=SAANDP(7)=1 THEN200
107IFO(05)=SAANDP(3)=1 THEN200
110IFC(9)>1 THEN C(9)=C(9)-1
130MODEMC:MODEMN
140CURSORX1:CURSORY18:PRINT"Il fait noir comme dans un four!"
145PRINT"Il faudrait peut être allumer."
150GOTO500

200REM DESCRIPTION SALLE
210MODEMN:MODEMC: REM cadre+zone+dessin
215DEST=SALLE
220GOSUB6900
230MODEMD
300H=0:N=1
310IFO(N)<>SALLE THEN400
320IFH=1 THEN350 
330MODEML:PRINT"Il y a dans la salle:":MODEMW,10
340H=1
350MODEML:PRINT" ";O$(N);
360MODEMW,25
400N=N+1
410IFN<=O THEN310 
415MODEML:PRINT

500REM ACCEPTATION COMMANDE
510T=1:Y$(1)="":Y$(2)="":N=0
520GOTO1000
530IFC(7)>1ANDP(7)=1 THENC(7)=C(7)-1 
540IFC(3)>1ANDP(3)=1 THENC(3)=C(3)-1
545IFC(4)>1ANDP(4)=1 THENC(4)=C(4)-1
547IFC(5)>1 THENC(5)=C(5)-1
550X$="":INPUT"Que faites vous ";X$
560MODEMN:PRINT">";X$   
570GOSUB6000
580MODEML:IFMO(1)=0 THENPRINT"Je ne comprends pas...":MODEMW,50:GOTO500

* nouvelle version*
900REM CONTROLE Mvt
905 MODEMI,SALLE
910 IF PEEK(-4)=0 THEN 980
920 SALLE=PEEK(-4):GOTO100

980T=0
990A1=0
1000REM CONTROLE 
1010NL=0
1100NL=NL+1
1110IFT=0 THEN1150
1120E$=C$(NL)
1130GOTO1400
1150 MODEMA: NL=PEEK(-33)
1151 IFPEEK(-32)=0 THEN1159
1152 AD=-32:E$=""
1153 IF PEEK(AD)=255 THEN 1400
1154 E$=E$+CHR$(PEEK(AD)):AD=AD+1
1155 GOTO1153
1159PY=23:CO=12
1160IFA1=1 THEN500 
1170MODEML:PRINT"Impossible ";
1180IFMO(1)<10 THEN PRINT"de prendre ce chemin";

1190PRINT"!":MODEMW,100:GOTO100

1400REM CONDITIONS
1410E=1
1420IFMID$(E$,E,1)="." THEN1700
1430LI=ASC(MID$(E$,E,1))-65
1440N=VAL(MID$(E$,E+1,2))
1450ON(LI+1)GOSUB 1500,1510,1520,1530,1540,1550,1560,1570,1580
1460IFOK=0 THEN1100
1470E=E+3:GOTO1420
1500IFN=SALLE THEN1590
1505GOTO1585
1510IFO(N)=-1ORO(N)=SALLE THEN1590
1515GOTO1585
1520IFO(N)<>SALLE ANDO(N)<>-1 THEN1590
1525GOTO1585
1530IFO(N)=-1 THEN1590
1535GOTO1585
1540IFP(N)=1 THEN1590
1545GOTO1585
1550IFP(N)=0 THEN1590
1555GOTO1585
1560IFC(N)=1 THEN1590
1565GOTO1585
1570IFINT(RND(1)*99+1)<N THEN1590
1575GOTO1585
1580IFN<>SALLE THEN1590
1585OK=0:RETURN
1590OK=1:RETURN

1700REM ACTIONS
1705E=E+1:A1=1
1710IF MID$(E$,E,1)="." THEN1100 
1720LI=ASC(MID$(E$,E,1))-65
1730IF MID$(E$,E+1,1)<>"." THENN=VAL(MID$(E$,E+1,2)) 
1740BREAK=0
1750ON(LI+1)GOSUB 1800,1900,2000,2100,2200,2300,2400,2500,2600,2700,2800,2900,3000,3100,3200,3300
1760IFBREAK>0 THEN ON BREAK GOTO 100,300,500,530,20000
1780E=E+3
1790GOTO1710
1800G=0:HH=0
1810G=G+1
1820IFO(G)=-1 THEN1840
1830IFG<O THEN1810
1835GOTO1870
1840MODEML:IF HH=0 THENPRINT"Vous détenez:"
1850HH=1
1860MODEML:PRINTO$(G);:PRINT" ";:MODEMW,30
1865IFG<V THEN1810
1870MODEML:IFHH=1 THENPRINT".":RETURN
1880MODEML:PRINT"Vous ne détenez absolument rien!!!":RETURN
1900IFS(1)<5 THEN 1930
1910MODEML:PRINT"Il parait évident que vous ne pouvez"
1915MODEML:PRINT"porter tant de chose!!!"
1920MODEMW,200:BREAK=1:RETURN
1930IFO(N)<>-1 THEN1960 
1935REM
1940MODEML:PRINT"Vous l'avez déjà,vous êtes étourdis et"
1945MODEML:PRINT"dans cette maison ce n'est pas très"
1950MODEML:PRINT"conseillé...":GOTO1920
1960O(N)=-1:S(1)=S(1)+1:RETURN
2000IFO(N)=-1 THEN 2030
2010MODEML:PRINT"Comment voulez vous poser ce que vous"
2015MODEML:PRINT"n'avez pas..."
2020GOTO1920
2030O(N)=SALLE:S(1)=S(1)-1:RETURN

2100REM
2105DEST=N+1:GOSUB 3900
2110RETURN
2200P(N)=1:RETURN
2300P(N)=0:RETURN
**
2400C(N)=VAL(MID$(A$(N),E+3,2)):E=E+2:RETURN 
**
2500IFO(N)=-1 THENS(1)=S(1)-1 
2510O(N)=0:RETURN 
2600SALLE=N:RETURN 
2700MODEML:PRINT"D'accord..."
2710MODEMW,20:BREAK=2:RETURN
2800BREAK=3 
2810RETURN
2900BREAK=4:RETURN
3000BREAK=1:RETURN
3100BREAK=5:RETURN
3200O(N)=SALLE:RETURN
3300X$=O$(N):O$(N)=O$(N+1):O$(N+1)=X$:RETURN

3900IFDEST<11 THEN ON DEST GOTO 4000,4010,4020,4030,4040,4050,4060,4070,4080,4090
3910DEST=DEST-10
3915IFDEST<11 THEN ON DEST GOTO 4100,4110,4120,4130,4140,4150,4160,4170,4180,4190
3920DEST=DEST-10
3925IFDEST<11 THEN ON DEST GOTO 4200,4210,4220,4230,4240,4250,4260,4270,4280,4290
3930DEST=DEST-10
3935IFDEST<11 THEN ON DEST GOTO 4300,4310,4320,4330,4340,4350,4360,4370,4380,4390
3940DEST=DEST-10
3945IFDEST<11 THEN ON DEST GOTO 4400,4410,4420,4430,4440,4450,4460,4470,4480,4490
3950DEST=DEST-10
3955IFDEST<11 THEN ON DEST GOTO 4500,4510,4520,4530,4540,4550,4560,4570,4580,4590
3960DEST=DEST-10
3965IFDEST<11 THEN ON DEST GOTO 4600,4610,4620,4630,4640

4000MODEMC:FORN=1TO20:MODEME:MODEMW,4:NEXTN
4001MODEMN:PRINT"Vous avez gardé la lampe allumée trop"
4002MODEML:PRINT"longtemps, elle a explosé!"
4005MODEMW,200:RETURN
4010MODEMC
4011MODEMN:PRINT"Vous avez oublié de fermer le robinet"
4012MODEML:PRINT"vous mourez sous des tonnes d'eau!"
4015MODEMW,200:RETURN
4020MODEMC
4022MODEMN:PRINT"La porte vient de se refermer derrière"
4023MODEML:PRINT"vous. Vous êtes prisonnier..."
4025MODEMW,200:RETURN
4030MODEMC
4031MODEMN:PRINT"Vous avez trébuché dans l'escalier,vous"
4032MODEML:PRINT"vous empallez sur le couteau!"
4035MODEMW,200:RETURN
4040MODEMC
4041MODEMN:PRINT"Vous renversez l'eau dans l'escalier,"
4042MODEML:PRINT"ce qui provoque une décharge au niveau"
4043MODEML:PRINT"de la prise électrique." 
4045MODEMW,200:RETURN
4050MODEMC 
4051MODEMN:PRINT"Vous êtes sauf grace à la combinaison"
4052MODEML:PRINT"que vous avez enfilé..!"
4055MODEMW,200:RETURN
4060MODEML:PRINT"Vous mourez électrocuté..."
4065MODEMW,200:RETURN
4070MODEMC:FORN=1TO20:MODEMM,2,2,2,10:MODEMP,3,7,4,80:MODEMW,1:MODEME:MODEMW,6:NEXTN
4071MODEMN:PRINT"La pièce était pleine de gaz explosif,"
4072MODEML:PRINT"vous auriez dû éteindre..."
4073MODEMW,200:PRINT"On ramassera vos morceaux un autre"
4074MODEML:PRINT"jour..!"
4075MODEMW,200:RETURN
4080MODEMC 
4081MODEMN:PRINT"Vous mourez empallé sur des lances"
4082MODEML:PRINT"sorties du mur...!" 
4085MODEMW,200:RETURN
4090MODEML:PRINT"La porte ne s'ouvre pas de cette pièce":MODEMW,200:RETURN
4100MODEMC
4101MODEML:PRINT"La lampe et le briquet refusent de"
4102MODEML:PRINT"fonctionner dans cette pièce!"
4109MODEMW,200:RETURN
4110MODEMC
4111MODEML:PRINT"Vous tombez dans une trappe,vous vous"
4112MODEML:PRINT"disloquez en arrivant au sol.."
4115MODEMW,200:RETURN
4120MODEML:PRINT"Vous avez raison de passer,car ce"
4122MODEML:PRINT"monstre n'était qu'une projection"
4124MODEML:PRINT"en 3 dimensions sur un écran de fumée"
4125MODEMW,250:RETURN
4130MODEML:PRINT"Vous avez raison,la curiosité est un"
4132MODEML:PRINT"vilain défaut!!!"
4134MODEMW,250
4135RUN20040
4140MODEML:PRINT"Vous avez raison d'attendre,mais cela"
4141MODEML:PRINT"ne pourra pas durer éternellement.."
4142MODEMW,200:RETURN
4150MODEML:PRINT"Vous avez de la chance car ce coffre"
4151MODEML:PRINT"était ouvert.":MODEMW,100
4152MODEML:PRINT"Un message à l'intérieur dit:"
4153MODEML:PRINTCHR$(34)+"Ne respectez pas les couleurs du code"
4154MODEML:PRINT"de la route...?"+CHR$(34):MODEMW,200 
4156MODEML:PRINT"Tiens le coffre se referme!":MODEMW,150:RETURN
4160MODEML:PRINT"Maintenant,vous avez une lampe pleine"
4162MODEML:PRINT"de pétrole."
4165MODEMW,200:RETURN
4170MODEML:PRINT"Vous n'avez rien pour transporter le"
4171MODEML:PRINT"pétrole.":MODEMW,200:RETURN
4180FORN=1TO10:MODEME:MODEMW,6:NEXTN
4181MODEMC:MODEMN:PRINT"Le briquet que vous aviez laissé"
4182MODEML:PRINT"allumé vient d'exploser!"
4185MODEML:MODEMW,200:PRINT"Ca tue l'étourderie.....":MODEMW,150:RETURN
4190MODEMC:MODEMN:PRINT"A force de marcher en long et en large"
4191MODEML:PRINT"dans cette maison, vous sombrez dans"
4194MODEML:PRINT"un coma des plus mortel...
4195MODEMW,300:RETURN
4200PRINT"L'eau coule...":RETURN
4210MODEMC:MODEMN:PRINT"Vous avez les pieds trempés,et cela"
4211MODEML:PRINT"vous rend très malade..."
4215MODEMW,100:MODEML:PRINT"Vous mourez d'une triple pneumonie...!":MODEMW,200:RETURN
4220MODEML:PRINT"Le titre est:"
4225MODEML:PRINTCHR$(34)+"La mort à la 1ère page."+CHR$(34):MODEMW,200:RETURN
4230MODEMC:FOR N=1 TO 20:MODEME:NEXTN
4233MODEMN:PRINT"Le livre a explosé lorsque vous l'avez"
4235MODEML:PRINT"ouvert...":MODEMW,200:RETURN
4240MODEML:PRINT"Le papier indique: "+CHR$(34)+"Cherchez la clef."+CHR$(34)
4242MODEMW,200:RETURN
4250MODEML:PRINT"La clef vous permettra de trouver le"
4252MODEML:PRINT"code de la porte d'entrée."
4255MODEMW,200:RETURN
4260MODEML:PRINT"Il y a un clavier numérique permettant"
4261MODEML:PRINT"d'entrer un code à côté de la porte.":MODEMW,200:RETURN
4270MODEML:PRINT"Pour faire quoi..?":MODEMW,200:RETURN
4280MODEML:PRINT"Il y a une odeur de gaz.":MODEMW,200:RETURN
4290MODEML:PRINT"Apparemment,il n'y a aucune odeur.":MODEMW,200:RETURN
4300MODEML:PRINT"C'est déja fait,espèce de rigolo!":MODEMW,200:RETURN
4310MODEML:PRINT"Il faudrait peut être du feu!":MODEMW,200:RETURN
4320MODEML:PRINT"La lampe ne contient pas de pétrole!":MODEMW,200:RETURN
4330MODEML:PRINT"Vous ne l'avez pas!":MODEMW,200:RETURN
4340MODEML:PRINT"Le briquet est encore allumé et il"
4342MODEML:PRINT"éclaire la pièce.":MODEMW,200:RETURN
4350FORN=1TO15:MODEME:MODEMW,4:NEXTN
4355MODEML:PRINT"La torche était piégée,elle vous"
4356MODEML:PRINT"a explosé dans les mains.."
4357MODEMW,200:RETURN
4360MODEML:PRINT"La lampe est encore allumée,et elle"
4362MODEML:PRINT"vous éclaire.":MODEMW,200:RETURN
4370MODEML:PRINT"Un nain vient de vous lancer un"
4371MODEML:PRINT"poignard en plein coeur.."
4375MODEMW,200:RETURN
4380MODEML:PRINT"Un nain vient de se précipiter sur"
4385MODEML:PRINT"vous, il s'empalle sur votre ciseau.":MODEMW,200:RETURN
4390MODEML:PRINT"Un nain vient de se précipiter sur"
4395MODEML:PRINT"vous, il s'empalle sur votre couteau.":MODEMW,200:RETURN
4400MODEML:PRINT"Vous venez de renverser le pot.":MODEMW,150:RETURN
4410IF PEEK(-1)=1 THEN BREAK=3:RETURN
4411MODEMC:MODEMS,4,4,0:MODEMP,0,1,1,5000
4412MODEMN:PRINT"La foudre vient de tomber sur la maison":MODEMW,200
4413MODEML:PRINT"La maison n'existe plus!":MODEMW,100
4414MODEML:PRINT"Vous non plus!":MODEMW,100:MODEMP,0,0,0,0:RETURN
4420MODEMC:MODEMN:PRINT"A force de marcher dans le noir,vous"
4422MODEML:PRINT"avez trébuché.":MODEMW,100
4425MODEML:PRINT"Vous mourez d'une fracture du crâne...":MODEMW,200:RETURN
4430MODEML:PRINT"Vous ne pouvez pas travailler dans le"
4433MODEML:PRINT"noir...":MODEMW,200:RETURN
4440MODEML:PRINT"La lumière du briquet ne suffit pas"
4442MODEML:PRINT"pour travailler...":MODEMW,200:RETURN
4450MODEML:PRINT"Impossible !":MODEMW,100:RETURN
4460MODEML:PRINT"Vous n'avez aucun outil...":MODEMW,200:RETURN
4470MODEML:PRINT"Le téléporteur est en panne,donc les"
4472MODEML:PRINT"boutons ne fonctionnent pas."
4475MODEMW,400:RETURN
4480FORN=1TO25:MODEME:MODEMW,5:NEXTN
4484MODEMC:MODEMN:PRINT"Le téléporteur vient d'exploser,"
4485MODEML:PRINT"vous êtes décomposé..!":MODEMW,200:RETURN
4490MODEMN:PRINT"Le téléporteur se met en marche"
4491MODEML:PRINT"vous disparaissez...":MODEMW,50
4492MODEMM,2,1,5,0:MODEMP,2,1,3,1000
4493MODEMF
4494MODEMP,0,0,0,0
4495FORN=500TO30STEP-5
4497MODEMS,2,N,12:MODEMP,2,0,0,100
4498NEXTN
4499MODEMP,0,0,0,0:RETURN
4500MODEMC:MODEML:PRINT"Vous prenez du 30000 Volts dans les"
4502MODEML:PRINT"doigts!":MODEMW,200:RETURN
4510MODEML:PRINT"Le placard est fermé à clef!":MODEMW,200:RETURN
4520MODEMC:MODEMN:PRINT"L'horrible monstre sorti du placard"
4522MODEML:PRINT"vient de vous dévorer!"
4525MODEMW,200:RETURN
4530MODEML:PRINT"Il ne fallait pas fuir!":MODEMW,200:RETURN
4540MODEMC:MODEML:PRINT"Vous avez raison d'utiliser le ciseau,"
4542MODEML:PRINT"le monstre est mort!"
4545MODEMW,200:RETURN
4550MODEMD:MODEMN:PRINT"A l'intérieur du placard,le No "PL
4552MODEML:PRINT"est inscrit":MODEMW,200
4555MODEML:PRINT"Le placard se referme.":MODEMW,100:RETURN
4560MODEMC:FORN=1TO30:MODEME:MODEMW,5:NEXTN
4562MODEMN:PRINT"le pistolet a explosé!":MODEMW,200
4565RETURN

4570IF SALLE=2 THEN RETURN
4571MODEML:PRINT"Impossible!":BREAK=3:RETURN
4575MODEMC:FORN=1TO25:MODEME:MODEMW,7:NEXTN
4576MODEMN:PRINT"le clavier numérique a explosé!":MODEMW,200:BREAK=5:RETURN
4580MODEMN:PRINT"Le clavier numérique prend feu.":MODEMW,200
4581MODEML:IF O(24)<>-1 THEN 4586
4582MODEML:PRINT"Heureusement,vous avez un pot plein"
4584MODEML:PRINT"d'eau. Ce qui vous permet d'éteindre"
4585MODEML:PRINT"ce feu.":MODEMW,300:RETURN
4586MODEML:PRINT"Malheureusement vous n'avez pas d'eau"
4587MODEML:PRINT"pour l'éteindre.":MODEMW,200
4588GOTO4575

4590MODEMN:INPUT"No DE CODE ";ZC
4595IFZC<>PL THEN4575
4600MODEMW,100:MODEML:PRINT"Le code est exact...":MODEML:PRINT"La porte s'ouvre..."
4603MODEMW,150
4605GOTO11000
4610MODEML:PRINT"A l'intérieur du placard,il y a un mot"
4611MODEML:PRINT"qui parle d'un téléporteur.":MODEMW,200
4615MODEML:PRINT"Tiens le placard se ferme tout seul...":MODEMW,100:RETURN
4620MODEML:PRINT"Avant de la poser par terre,il faudrait"
4621MODEML:PRINT"peut être l'enlever."
4625MODEMW,200:RETURN
4630MODEMC:MODEMN:PRINT"Devant vous, il y a un horrible"
4631MODEML:PRINT"monstre qui est sorti du placard."
4635MODEMW,200:RETURN
4640MODEML:PRINT"Le placard était piégé,vous n'auriez"
4641MODEML:PRINT"pas dû l'ouvrir!"
4645FORN=1TO30:MODEME:MODEMW,7:NEXTN
4647MODEMW,200:RETURN

6000REM ANALYSE DU MOT
6010N=0:GN=0
6020N=N+1:IFMID$(X$,N,1)<>" " THEN6040
6030GOTO6020
6040GN=GN+1:XX$=MID$(X$,N+GN,1):IFXX$=" "ORXX$=""ORGN=20 THEN 6060
6050GOTO6040
6060IFGN>4 THENGN=4
6070X$(1)=MID$(X$,N,GN)
6080N=N+1:XX$=MID$(X$,N,1):IFXX$=" "ORXX$="" THEN6100
6090GOTO6080
6100N=N+1:IFMID$(X$,N,1)<>" " THEN6115
6110GOTO6100
6115GN=0
6120GN=GN+1:XX$=MID$(X$,N+GN,1):IFXX$=" "ORXX$=""ORGN=20 THEN 6140
6130GOTO6120
6140IFGN>4 THEN GN=4 
6150X$(2)=MID$(X$,N,GN)
6160MODEMU,X$(1):MODEMV,X$(2)
6170MO(1)=PEEK(-3)
6180MO(2)=PEEK(-2)
6190RETURN

6900REM Chargement image salle
6902MODEMC:MODEMN
6905IF DEST<11 THEN ON DEST GOTO 7000,7010,7020,7030,7040,7050,7060,7070,7080,7090
6910DEST=DEST-10
6915IF DEST<11 THEN ON DEST GOTO 7100,7110,7120,7130,7140,7150,7160,7170,7180,7190
6920DEST=DEST-10
6925ON DEST GOTO 7200,7210,7220,7230,7240

7000DISKLOAD"IMG_01"
7005PRINT"Vous êtes devant le manoir du défunt"
7006PRINTSPC(14)"Dr  GENIUS"
7009RETURN
7010DISKLOAD"IMG_02"
7015PRINT"Vous êtes dans le hall d'entrée."
7019RETURN
7020DISKLOAD"IMG_03"
7025PRINT"Vous êtes en bas de l'escalier menant"
7026PRINT"au 2ème étage."
7029RETURN
7030DISKLOAD"IMG_04"
7035PRINT"Vous êtes dans la salle à manger."        
7039RETURN
7040DISKLOAD"IMG_05"
7045PRINT"Vous êtes dans une bibliothèque sans"
7046PRINT"livre...!"         
7049RETURN
7050DISKLOAD"IMG_06"
7055PRINT"Vous êtes dans une buanderie."
7059RETURN
7060DISKLOAD"IMG_07"
7065PRINT"Vous êtes dans le salon."
7069RETURN
7070DISKLOAD"IMG_08"
7075PRINT"Vous êtes dans une chambre."
7079RETURN 
7080DISKLOAD"IMG_09"
7085PRINT"Vous êtes dans un corridor."
7089RETURN
7090DISKLOAD"IMG_10"
7095PRINT"Vous êtes dans une salle d'attente."
7099RETURN
7100DISKLOAD"IMG_11"
7105PRINT"Vous êtes dans le vestibule."
7109RETURN 
7110DISKLOAD"IMG_12"
7115PRINT"Vous êtes dans la chambre d'amis."
7119RETURN
7120DISKLOAD"IMG_13"
7125PRINT"Vous êtes dans une chambre."
7129RETURN
7130STOP
7140DISKLOAD"IMG_14"
7145PRINT"Vous êtes dans une petite salle."
7149RETURN
7150DISKLOAD"IMG_15"
7155PRINT"Vous êtes dans le laboratoire du
7156PRINT"Dr GENIUS." 
7159RETURN 
7160DISKLOAD"IMG_16"
7165PRINT"Vous êtes dans une petite pièce vide."
7169RETURN 
7170DISKLOAD"IMG_17"
7175PRINT"Vous ne savez pas où vous êtes."
7179RETURN  
7180DISKLOAD"IMG_18"
7185PRINT"Vous êtes en haut de l'escalier."           
7189RETURN
7190DISKLOAD"IMG_19"
7195PRINT"Vous êtes dans la salle bain." 
7199RETURN
7200DISKLOAD"IMG_20"
7205PRINT"Vous êtes dans le living room."
7209RETURN
7210DISKLOAD"IMG_21"
7215PRINT"Vous êtes dans une pièce enfumée...!"
7219RETURN
7220DISKLOAD"IMG_22"
7225PRINT"Vous êtes dans une grande pièce."
7229RETURN 
7230DISKLOAD"IMG_23"
7235PRINT"Vous êtes dans une pièce de rangement."
7239RETURN
7240DISKLOAD"IMG_24"
7245PRINT"Vous êtes dans le dressing."
7249RETURN

7500TX7,0,0:CURSORY23:PRINTSPC(8)"APPUYEZ SUR UNE TOUCHE"
7510N=RND(1)
7511IFKEY(0)=0 THEN7510
7515RETURN

7600REM CONFIG JEU
7602INIT0,0:TX3,0,0
7605POKE-34,0:POKE-1,0
7610INPUT "Carte SON (O/N)";X$
7620IF X$="O" THENPOKE-34,1:GOTO7630
7625IF X$<>"N"THEN7610
7630INPUT "Foudre (O/N)";X$
7640IF X$="O" THENPOKE-1,1:GOTO7650
7645IF X$<>"N"THEN7630
7650RETURN


8000REM CHARGEMENT VARIABLES
8001RESTORE
8010V=70
8130O=25:DIMO(25)
8140FORN=1TO25
8150READO(N)
8170NEXTN
8180DATA 06,05,05,08,08,00,00,11,11
8190DATA 13,20,18,16,16,16,16,00,21
8200DATA 00,22,25,12,00,25,00
8205DIMO$(25)
8210FORN=1TO25
8220READO$(N)
8240NEXTN
8250DATA UNE TORCHE ELECTRIQUE,UN ROBINET,UN CISEAU,UN TOURNEVIS
8260DATA UNE LAMPE A PETROLE,UNE LAMPE PLEINE,UNE LAMPE ALLUMEE,UN COUTEAU
8270DATA UN PAPIER,UN LIVRE,DU PETROLE DANS UN LAVABO BOUCHE
8280DATA UNE CLEF,UN BOUTON ROUGE,UN BOUTON BLEU
8290DATA UN BOUTON VERT,UN TELEPORTEUR,UN TELEPORTEUR REPARE
8300DATA UNE COMBINAISON ARGENTEE,UNE COMBINAISON ENFILEE,UN MONSTRE A L'EST
8310DATA UN PISTOLET,UN BRIQUET,UN BRIQUET ALLUME,UN POT,UN POT PLEIN D'EAU
8320M=25:DIMM$(25)
8330FORN=1TO25
8340READM$(N)
8360NEXTN
8370DATA 00,0403030400,030200,04020305010600,04040107032000,020400
8380DATA 04080109020500,030700,04130207031000 
8390DATA 0409021100,0110031200,041100,030900,0209031500,00,00
8400DATA 00,00,0122032100,040500,0125022200,012100 
8410DATA 0124042200,022300,022100
8430A=128:DIMA$(128)
8440FORN=1TO128
8450READA$(N)
8470NEXTN
8480DATA 1400A01.I02D02M.,0500A03D08.D03N.,0500A03E08E09D24.D04D05I19E02M.
8485DATA 0500A03E08D24.D04D06N.
8490DATA 0500A03E07.I19M.,0500A03E03.I19M.,0500A03.I19E02M.,0600A19D08.D03N.
8500DATA 0600A19E08E09D24.D04D05I03M.,0600A19E08D24.D04D06N.,0600A19.I03M.
8505DATA 0100A09E07B22.D07N.
8510DATA 0100A09E03B05.D07N.,0100A09.I14E02M.,0100A14.I16E02M.
8515DATA 0200A16E07B22.D07N.,0200A16E03B05.D07N.
8520DATA 0200A16.I14E02M.,0400A15E03B05.D07N.,0400A15E07B22.D07N.
8522DATA 0400A15.I14E02M.,0100A15E03.I17M.,0100A15E07.I17M.,0100A15.I17E02M.
8525DATA 0200A17.F01I15M.
8530DATA 0300A17.D08N.,0400A17.D09K.,0300A18.D10F03E01E02I17M.
8531DATA 0400A21E03.I19M.
8535DATA 0400A21E07.I19M.,0400A21.I19E02M.,0200A22E03.I19M.,0200A22E07.I19M.
8540DATA 0200A22.I19E02M.,0200A19.D11N.,0400A19.D11N.,0300A22.D12I23M.
8541DATA 2500A01.D13.,2500I01.D14K.,1244A03.D15M.,1034B01.B01J.,1027B08.B08J.
8545DATA 1028B04.B04J.,1029B05.B05J.,1032B21.B21J.,1038B24.B24J.
8548DATA 1039B12.B12J.,1040B09.B09J.,1041B10.B10J.,1043B18.B18J.
8550DATA 1050B03.B03J.,1042B22.B22J.,1037A20B05.H11P05E05D16K.,1037A20.D17K.
8553DATA 1134.C01J.,1127.C08J.,1128.C04J.,1129.C05J.,1132.C21J.,1138.C24J.
8555DATA 1143E09.D62K.
8556DATA 1139.C12J.,1140.C09J.,1141.C10J.,1143.C18J.,1150.C03J.,1142.C22J.
8560DATA 2400.A00L.,1249A05.E04D20G0405J.,1349A05.F04J.,2238A05E04.P24E08J.
8563DATA 2338A05E08.F08P24J.,2338E08.D21N.,1848B10.D22L.,1841B10.D23N.

8566DATA 1840B09.D24K.,2040B09.D25K.,1951A02.D26M.,1951.D27K.,2100A14.D28K.
8570DATA 2100.D29K.,1542C22.D33K.,1542E07.D30K.,1542A14.D07N.
8575DATA 1542A17E01.D10K.,1542E02.F02E07E06P22M.,1542.E07P22J.
8580DATA 1529C05.D33K.,1529E03.D30K.,1529F07.D31L.,1529F05.D32L.
8590DATA 1529E02.F02E03E06P06P05M.,1529.E03P06P05J.
8595DATA 1642C22.D33K.,1642F07.D30K.,1642E06E03.D36F07P22M.
8597DATA 1642E06.E02F07F06P22M.
8600DATA 1642.F07P22M.,1629C05.D33K.,1629F03.D30K.,1629E07E06.D34F03P05M.
8605DATA 1629E06.E02F06F03P05M.,1629.F03P05M.,1534B01.D35N.
8610DATA 1735I16.D45K.,1735E02.D43K.,1735F03.D44K.,1735C04.D46K.

8615DATA 1735.P16E10J.,5600A16F10.D47K.,5646A16.D48N.,5647A16.D48N.
8620DATA 5645A16F09.D50D06N.,5645A16.D49I18M.,5543D18E09.D30K.
8625DATA 5543D18.P18E09J.,5743D18F09.D30K.,5743D18.P18F09J.
8630DATA 1233A24C12.D51K.,1233A24C03.D52N.,1233A24.G0503E11D63K.
8635DATA 2636E11.D54F11D55K.,5350E11.D54F11D55K.,5232B21.D56N.
8640DATA 5830F08.D57.,5830.D58D59.,1233A06.D61M.
8650DATA 1233A25.D64N.
8700PL=INT(RND(1)*9000+1000)
8800C=14:DIMC$(14) 
8810FORN=1TO14
8820READC$(N)
8840NEXTN
8850DATA G03E03.D00N.,G04E04.D01N.,I14I16I17I19.F02.,G07E07.D18N.,GO1.D19N.
8860DATA H06C03C08.D37N.,H08D08.D39L.,H06D03.D38L.,G08E08B24.D40D21N.
8870DATA H02.D41N.,G09E02.D42N.,G05E11.D52N.,I24E11.D53D52N.,.L.
8900RETURN

9000FORIJ=1TO100:NEXTIJ
9010RETURN

11000REM SUCCES
11020DISKLOAD"IMG_01"
11030MODEMN:MODEMC:MODEMD
11040PRINT"Vous voila en dehors de la maison..."
11050MODEMW,250
11055MODEMN
11060PRINT" Cela est exceptionnel,vous êtes le"
11065PRINT"premier à sortir vivant de cette"
11070PRINT"maison. Mais à votre place, je me"
11075PRINT"mettrais à courrir car un nain rode"
11080PRINT"peut être dans les parages..."
11085 GOSUB 11100
11090GOTO 20040

11100REM TEA FOR TWO
11102RESTORE11125
11105FORN=1TO110
11110READ A1,A2,A3
11115MODEMM,1,A1,A2,10:MODEMP,1,0,0,100:MODEMW,A3
11120MODEMP,0,0,0,0
11122NEXTN
11123RETURN
11125DATA 4,6,45,4,3,15,4,5,45,4,3,15,4,6,45,4,3,15,4,5,45 
11130DATA 4,1,15,4,5,45,4,1,15,4,3,45,4,1,15,4,5,45,4,1,15
11135DATA4,3,45,4,1,15,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45
11140DATA4,3,15,4,5,45,4,1,30,4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,7,8
11145DATA4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,5,8,4,9,30,4,7,22,4,5,8
11150DATA4,7,30,4,7,22,4,5,8,4,9,30,4,9,22,4,5,8,4,7,30,4,7,22,4,5,8
11155DATA4,10,30,4,10,22,4,7,8,4,9,30,4,9,22,4,7,8,4,10,30,4,10,22,4,7,8
11160DATA4,9,30,4,9,30,5,2,120,5,1,60,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45
11165DATA4,3,15,4,5,45,4,1,15,4,5,45,4,1,15,4,3,45,4,1,15,4,5,45,4,1,15
11170DATA4,3,45,4,1,15,4,6,45,4,3,15,4,5,45,4,3,15,4,6,45,4,3,15,4,5,45
11175DATA4,1,30,5,3,45,5,3,15,5,1,45,5,1,15,4,11,45,4,11,15,4,10,45,4,10,15
11180DATA5,1,45,5,1,15,4,11,45,4,11,15,4,10,45,4,10,15,4,8,45,4,8,15
11185DATA4,6,45,4,3,15,4,5,45,4,3,15
11190DATA4,6,45,4,3,15,4,5,45,4,10,15,4,6,120

20000REM TOMBE
20005DISKLOAD"IMGTMB"
20010MODEMC:MODEMD:MODEMN
20020PRINT"Vous êtes mort !":MODEMW,100
20030IF PEEK(-34)=1 THENGOSUB21000
20040MODEML:PRINT:MODEML:X$="":INPUT"Voulez-vous rejouer ";X$
20050IFX$="O"ORX$="o" THENRUN45
20060IFX$="N"ORX$="n" THEN20080
20070GOTO20040
20080MODEMN:PRINT"     AU REVOIR"
20090END

21000REM SARABANDE
21005RESTORE21040
21015FORN=1TO75
21020READA1,A2,A3,A4,A5
21025READA6,A7,A8,A9,A0
21030MODEMM,1,A1,A2,A3:MODEMM,2,A4,A5,A6:MODEMM,3,A7,A8,A9:MODEMP,7,0,0,100:MODEMW,A0
21031IFKEY(0)<>0 THEN MODEMP,0,0,0,0:RETURN
21032IFN>70 THENNEXTN:MODEMP,0,0,0,0:RETURN
21035MODEMP,0,0,0,0:NEXTN
21040DATA 3,6,8,3,3,8,2,10,8,80
21045DATA 3,6,8,3,3,8,2,10,8,80
21050DATA 0,1,1,0,1,1,0,1,1,40
21055DATA 3,8,8,3,5,8,0,1,1,40
21060DATA 3,5,8,3,2,8,2,10,8,80
21065DATA 3,5,8,3,2,8,2,10,8,40
21070DATA 1,11,8,0,1,1,0,1,1,40
21075DATA 1,10,8,0,1,1,0,1,1,40
21080DATA 1,8,8,0,1,1,0,1,1,40
21085DATA 3,10,8,3,6,9,3,1,8,80
21090DATA 3,10,8,3,6,9,3,1,8,80
21095DATA 0,1,1,0,1,1,0,1,1,40     
21100DATA 3,11,8,3,8,8,0,1,1,40
21105DATA 3,8,8,3,5,8,3,1,8,80
21110DATA 3,8,8,3,5,8,3,1,8,40 
21115DATA 2,1,8,0,1,1,0,1,1,40
21120DATA 1,11,8,0,1,1,0,1,1,40 
21125DATA 1,10,8,3,7,8,3,10,8,40
21130DATA 3,11,8,3,8,8,3,3,8,80
21135DATA 3,11,8,3,8,8,3,3,8,80
21140DATA 1,8,8,0,1,1,0,1,1,40
21145DATA 1,8,8,3,10,8,4,1,8,40
21150DATA 3,10,8,3,6,8,3,3,8,80
21155DATA 3,10,8,3,6,8,3,3,8,80
21160DATA 0,1,1,0,1,1,0,1,1,40
21165DATA 3,10,8,2,1,8,0,1,1,40
21170DATA 4,3,8,3,10,8,1,11,8,80
21175DATA 4,3,8,3,8,8,2,11,9,80
21180DATA 0,1,1,0,1,1,0,1,1,40
21185DATA 4,5,8,0,1,1,0,1,1,40
21190DATA 4,2,8,3,10,8,3,5,8,80
21195DATA 4,2,8,3,10,8,3,5,8,40
21200DATA 2,8,8,0,1,1,0,1,1,40
21202DATA 2,6,8,0,1,1,0,1,1,40
21203DATA 2,5,8,0,1,1,0,1,1,40
21205DATA 3,6,8,3,3,8,2,10,8,80
21210DATA 3,6,8,3,3,8,2,10,8,80
21215DATA 0,1,1,0,1,1,0,1,1,40 
21220DATA 3,8,8,3,5,8,0,1,1,40 
21225DATA 3,5,8,3,2,8,2,10,8,80
21230DATA 3,5,8,3,2,8,2,10,8,40
21235DATA 1,11,8,0,1,1,0,1,1,40
21240DATA 1,10,8,0,1,1,0,1,1,40
21245DATA 1,8,8,0,1,1,0,1,1,40
21250DATA 3,10,8,3,6,9,3,1,8,80
21255DATA 3,10,8,3,6,9,3,1,8,80
21260DATA 0,1,1,0,1,1,0,1,1,40
21265DATA 3,11,8,3,8,8,0,1,1,40
21270DATA 3,8,8,3,5,8,3,1,8,80
21275DATA 3,8,8,3,5,8,3,1,8,40
21280DATA 2,1,8,0,1,1,0,1,1,40
21285DATA 1,11,8,0,1,1,0,1,1,40
21290DATA 1,10,8,3,7,8,3,10,8,40
21295DATA 3,11,8,3,8,8,3,3,8,80
21300DATA 2,8,8,0,1,1,0,1,1,40
21305DATA 3,11,8,3,8,8,3,1,8,40
21310DATA 2,8,8,0,1,1,0,1,1,40
21315DATA 2,1,8,0,1,1,0,1,1,40
21320DATA 4,1,8,2,5,8,0,1,1,40
21325DATA 3,10,8,3,6,8,3,1,8,80
21330DATA 3,10,8,2,3,8,0,1,1,40
21335DATA 4,3,8,3,6,8,2,11,8,40
21340DATA 4,2,8,0,1,1,0,1,1,40
21345DATA 4,3,8,3,11,8,2,8,8,40
21350DATA 4,5,8,0,1,1,0,1,1,40
21355DATA 4,6,8,3,10,8,2,10,8,80
21360DATA 4,5,8,3,8,8,1,10,8,40
21365DATA 0,1,1,3,8,8,1,10,8,40
21370DATA 4,3,8,0,1,1,0,1,1,40
21375DATA 4,3,8,3,6,8,2,3,8,80
21380DATA 3,3,8,3,10,8,3,6,8,40
21385DATA 3,3,7,3,10,7,3,6,7,40
21390DATA 3,3,6,3,10,6,3,6,6,40
21395DATA 3,3,5,3,10,5,3,6,5,40
21400DATA 3,3,4,3,10,4,3,6,5,40

