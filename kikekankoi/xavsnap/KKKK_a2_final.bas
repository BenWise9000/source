0  GOTO 8900
1  REM
10  HOME 
19  DIM S(21): REM POINTEURS
REM S(1)=ITEM INVENTAIRE (5 MAX)
20  DIM C(21): REM COMPTEURS
30 SALLE = 1
40  DIM P$(2)
50  DIM PO(O)
60  FOR X = 1 TO O
70 PO(X) = Q(X)
80  NEXT X
100 REM ********* (Affichage Salle 1) **********
101 S(2)=0
102 IF SALLE=10 OR SALLE=22 OR SALLE=54 OR SALLE=15 THEN S(2)=1
103 IF O(10)=SALLE OR O(10)=1 THEN 200
105 GOSUB 2850 : REM 110  IF C(2) THEN C(2) = C(2) - 1
110  IF S(2) = 0 THEN 200
120  IF C(3) > 0 OR S(3)>1 THEN 200
130 PRINT "Il fait trop sombre pour voir quelque "
135 PRINT "chose...":PRINT "peut etre faudrait-il allumer"
150  GOTO 1000

200  REM ********* (Affichage Salle 2) **********
210  REM PRINT "SALLE:";SALLE
215  IF (SALLE > 10) AND (SALLE < 21) THEN 230
216  IF (SALLE > 20) AND (SALLE < 31) THEN 232
217  IF (SALLE > 30) AND (SALLE < 41) THEN 234
218  IF (SALLE > 40) AND (SALLE < 51) THEN 236
219  IF (SALLE > 50) THEN 238
220  ON SALLE GOSUB 8010,8020,8030,8040,8050,8060,8070,8080,8090,8100: GOTO 300
230  ON (SALLE-10) GOSUB 8110,8120,8130,8140,8150,8160,8170,8180,8190,8200: GOTO 300
232  ON (SALLE-20) GOSUB 8210,8220,8230,8240,8250,8260,8270,8280,8290,8300: GOTO 300
234  ON (SALLE-30) GOSUB 8310,8320,8330,8340,8350,8360,8370,8380,8390,8400: GOTO 300
236  ON (SALLE-40) GOSUB 8410,8420,8430,8440,8450,8460,8470,8480,8490,8500: GOTO 300
238  ON (SALLE-50) GOSUB 8510,8520,8530,8540,8550,8560,8570,8580: GOTO 300
250  PRINT "Erreur de programme": STOP 
300 F = 0
305 PRINT
310  FOR X = 1 TO O
315 RW = PO(X)
320  IF RW <  > (SALLE) THEN  GOTO 500
330  IF F THEN 400
340  PRINT "Ici,il y a egalement :"
350 F = 1
400  PRINT "   ";O$(X)
500  NEXT X
600 PRINT
1000  REM ********* (DECODE SUIVANT) **********
1010 T = 1
1020  GOTO 2000

1100  REM ********* (PROMPT) ********** 
1105 GOSUB 2850:REM IF C(1) THEN C(1) = C(1) - 1
1110  REM IF C(4) THEN C(4) = C(4) - 1
1120  INPUT "Que faites vous?>";Y$
1140  HOME 
1150 Y = 0
1160  PRINT ">";Y$
1170 P$(2) = "00"
1200  FOR W = 1 TO 2
1210  GOSUB 6000
1220  IF Y >  LEN (Y$) THEN 1300
1230  IF P$(W) = "00" THEN 1210
1240  NEXT W
1300  IF P$(1) <  > "00" THEN 1600
1310  PRINT "Pardon?"
1320  GOTO 110
1600  REM
1610 Z = 1
1620 T$ =  MID$ (M$(SALLE),Z,2)
1630  IF T$ = "00" THEN 1900
1640  IF T$ <  > P$(1) THEN 1700
1650 SALLE =  VAL ( MID$ (M$(SALLE),Z + 2,2))
1660  GOTO 100
1700 Z = Z + 4
1710  GOTO 1620
1900 T = 0
1910 XXO = 0

2000 REM ********* (PROMPT) **********
2010 CP = 0
2100 CP = CP + 1
2110  IF T = 0 THEN 2300
2120 E$ = C$(CP)
2130  GOTO 2600
2300  IF CP <  = (A) THEN 2400
2310  IF XXO THEN 1000
2320  PRINT "Impossible ";
2330  IF  VAL (P$(1)) < 10 THEN  PRINT "de prendre cette direction";
2340  PRINT "."
2350  GOTO 100
2400  IF  LEFT$ (A$(CP),2) <  > P$(1) THEN 2100
2410 Y$ =  MID$ (A$(CP),3,2)
2420  IF Y$ <  > "00" AND Y$ <  > P$(2) THEN 2100
2430 E$ =  MID$ (A$(CP),5)

2600 E = 1
2700  IF  MID$ (E$,E,1) = "." THEN 3000
2710 TYPE =  ASC ( MID$ (E$,E,1)) - 64
2720 N =  VAL ( MID$ (E$,E + 1,2))
2800 ON TYPE GOSUB 2900,2910,2920,2930,2940,2950,2960,2970,2980
2810 IF OK=0 THEN  GOTO 2100
2820 E = E + 3 : GOTO 2700

REM TOUT COMPTEURS -1 SI POSITIFS
2850 FOR ZZ=1 TO 10
2860 IF C(ZZ) THEN C(ZZ)=C(ZZ)-1
2885 NEXT ZZ
2890 RETURN

REM ----------- CONDITIONS -----------
REM ACTIVE SI DANS SALLE NN (1) "A"
2900 OK = (N = SALLE)
2905  RETURN 

REM ACTIVE SI OBJET NN PRESENT/INVENTAIRE (2) "B"
2910 OK = (PO(N) = SALLE OR PO(N) < 0)
2915  RETURN 

REM ACTIVE SI OBJET NN ABSENT (3) "C"
2920 OK = (PO(N) <  > SALLE AND PO(N) >  = 0)
2925  RETURN 

REM ACTIVE SI OBJET NN INVENTAIRE (4) "D"
2930 OK = (PO(N) < 0)
2935  RETURN 

REM ACTIVE SI POINTEUR NN >0 (5) "E"
2940 OK = (S(N) <  > 0)
2945  RETURN 

REM ACTIVE SI POINTEUR NN =0 (6) "F"
2950 OK = (S(N) = 0)
2955  RETURN 

REM ACTIVE SI COMPTEUR NN =1 (7) "G"
2960 OK = (C(N) = 1)
2965  RETURN 

REM ACTIVE SI ALEATOIRE / 99 X<NN (8) "H"
2970 OK = ( INT ( RND (1) * 100) <  =  N)
2975  RETURN 

REM SI PAS DANS LA SALLE NN (9) "I"
REM Ajout "Le Mysthere de KiKeKanKoi"
2980 OK = (N <> SALLE)
2985  RETURN 

3000 REM
3010 XXO = 1
3020 E = E + 1
3100  IF E>LEN(E$) OR ASC ( MID$ (E$,E,1))<0 THEN PRINT "SYNTAXE ERROR:";E$:STOP
3102 IF  MID$ (E$,E,1) = "." THEN 2100
3105  IF  MID$ (E$,E,1) = "" THEN TYPE = 0: GOTO 3120
3110 TYPE =  ASC ( MID$ (E$,E,1)) - 64
3120  IF  MID$ (E$,E + 1,1) <  > "." THEN N =  VAL ( MID$ (E$,E + 1,2))
3200 BREAK = 0
REM 3201 PRINT E$;">" ;MID$ (E$,E,1)
3205  IF TYPE > 10 THEN 3215
REM DE A-J
3210  ON TYPE GOSUB 4000,4100,4200,4300,4400,4500,4600,4700,4800,4900: GOTO 3220
REM DE K-V
3215  ON TYPE-10 GOSUB 5000,5100,5300,5400,5450,5500,5600,5700,5900: GOTO 3220
3218  PRINT "Erreur de programme": STOP 
3220 IF BREAK>0 THEN E =0
3221 IF BREAK = -1 THEN E=E+1:GOTO 3100
3222 IF BREAK = 100 THEN 100
3223 IF BREAK = 200 THEN 200
3224 IF BREAK = 1000 THEN 1000
3225 IF BREAK = 1100 THEN 1100
3226 IF BREAK = 8600 THEN 8600
3230 E = E + 3
3240  GOTO 3100

REM INVENTAIRE (1) "A"
4000  PRINT 
4010  PRINT "Vous tenez:"
4020 F = 1
4030  FOR X = 1 TO O
4040  IF PO(X) >  = 0 THEN 4070
4050  PRINT "   ";O$(X)
4060 F = 0
4070  NEXT X
4080  IF F THEN  PRINT "   Rien."
4090 BREAK = 100
4095  RETURN 

REM PREND (2) "B"
4100 OK=0
4110 IF S(1) < 5 THEN 4140 
4120 PRINT "Vous ne pouvez porter plus."
4130 OK=1
4135  RETURN 
4140  IF PO(N) =  - 1 THEN 4180
4150 PO(N) =  - 1
4160 S(1) = S(1) + 1
4170  RETURN
4180  PRINT "Vous l'avez deja."
4190  GOTO 4130

REM POSE (3) "C"
4200 IF PO(N) =  - 1 THEN 4240
4210 PRINT "Vous n'avez pas ";O$(N)
4220 GOTO 5110 
4240 PO(N) = SALLE
4250 S(1) = S(1) - 1
4260 PRINT "D'acccord."
4270 RETURN 

REM MESSAGE (4) "D"
4300 PRINT
4302  IF (N > 10) AND (N < 21) THEN 4312
4303  IF (N > 20) AND (N < 31) THEN 4313
4304  IF (N > 30) AND (N < 41) THEN 4314
4305  IF (N > 40) AND (N < 51) THEN 4315
4306  IF (N > 50) AND (N < 61) THEN 4316
4307  IF (N > 60) AND (N < 71) THEN 4317
4308  IF (N > 70)  THEN 4318
4310  ON N GOSUB 7010,7020,7030,7040,7050,7060,7070,7080,7090,7100: GOTO 4320
4312  ON N - 10 GOSUB 7110,7120,7130,7140,7150,7160,7170,7180,7190,7200: GOTO 4320
4313  ON N - 20 GOSUB 7210,7220,7230,7240,7250,7260,7270,7280,7290,7300: GOTO 4320
4314  ON N - 30 GOSUB 7310,7320,7330,7340,7350,7360,7370,7380,7390,7400: GOTO 4320
4315  ON N - 40 GOSUB 7410,7420,7430,7440,7450,7460,7470,7480,7490,7500: GOTO 4320
4316  ON N - 50 GOSUB 7510,7520,7530,7540,7550,7560,7570,7580,7590,7600: GOTO 4320
4317  ON N - 60 GOSUB 7610,7620,7630,7640,7650,7660,7670,7680,7690,7700: GOTO 4320
4318  ON N - 70 GOSUB 7710,7720,7730,7740,7750,7760,7770,7780,7790,7800: GOTO 4320
4319  PRINT "Erreur de programme": STOP 
4320 RETURN 

REM ACTIVE LE POINTEUR N (5) "E"
4400 S(N) = 1
4410  RETURN 

REM DESACTIVE LE POINTEUR N (6) "F"
4500 S(N) = 0
4510  RETURN 

REM  FIXE LE COMPTEUR (-) NN A MM (7) "G"
4600 C(N) =  VAL ( MID$ (E$,E + 3,2))
4610 E = E + 2
4620  RETURN

REM  INVERSE LES LIGNES NN ET NN+1 DANS LE TABEAU OBJET (8) "H"
4700 X = PO(N)
4710 PO(N) = PO(N + 1)
4720 PO(N + 1) = X
4730  RETURN 

REM  POSE OBJET NN DANS LA SALLE EN COURS (9) "I"
4800 PO(N) = SALLE
4805 REM BREAK = -1
4810  RETURN 

REM MET LE NO DE SALLE CONTENANT L OBJET NN A 0 (10) "J"
4900  IF PO(N) < 0 THEN S(1) = S(1) - 1
4910 PO(N) = 0
4920  RETURN 

REM FIXE LE NO DE SALLE EN COURS A LA VALEUR NN  (11) "K"
5000 SALLE = N
5010  RETURN 

REM AFFICHE "D ACCORD" ET ATTEND  (12) "L"
5100  PRINT "D'acccord."
5110 FOR ZZ=0 TO 1000
5120 NEXT ZZ
5200 BREAK = 1000
5210  RETURN 

REM ATTEND UNE NOUVELLE COMMANDE MAIS LE TABLEAU 
REM DES ACTIONS EST REPASSE EN REVUE (13) "M"
5300 BREAK = 1100
5310  RETURN 

REM ATTEND UNE NOUVELLE COMMANDE (14) "N"
5400 BREAK = 1000
5410  RETURN 

REM AFFICHE LA DESCRIPTION DE LA SALLE EN COURS (15) "O"
5450 BREAK = 100
5455  RETURN 

REM  ETES VOUS SURE ? >>> STOP (16) "P"
5500  PRINT "Etes vous sur ";
5510  INPUT W$
5520  PRINT W$
5530  IF  LEFT$ (W$,1) <  > "O" THEN  RETURN 

REM  >>> STOP (17) "Q"
5600  GOTO 9999

REM  >>> MORT (18) "R"
5700  GOTO 8600

REM  (19) "S"
5800 RETURN

REM  (20) "T"
5900 RETURN

REM
6000 REM
6010 W$ = ""
6015 P$(W) = "00"
6020  GOSUB 6600
6025  IF (FIN) THEN  RETURN 
6030  FOR Q = 1 TO 4
6040 W$ = W$ +  MID$ (Y$,Y,1)
6050  GOSUB 6500
6060  IF (FIN) THEN 6100
6070  NEXT Q
6080  GOSUB 6500
6090  IF (FIN) = 0 THEN 6080
6100  IF W$ = "   " THEN  RETURN 
6110  FOR Q = 1 TO V
6120  IF W$ =  MID$ (V$(Q),3) THEN 6200
6130  NEXT Q
6140  RETURN 
6200 P$(W) =  LEFT$ (V$(Q),2)
6210  RETURN 

REM
6500 Y = Y + 1
6510 FIN = (Y >  LEN (Y$))
6520  IF (FIN) THEN  RETURN 
6530 FIN = ( MID$ (Y$,Y,1) = " ")
6540  RETURN 

REM
6600 Y = Y + 1
6610 FIN = (Y >  LEN (Y$))
6620  IF (FIN) THEN  RETURN 
6630  IF  MID$ (Y$,Y,1) = " " THEN 6600
6640  RETURN

REM 1 
7010 PRINT "Vous etes arrive dans la salle de dis-  section, et vous n'avez pas fait de     vieux os..."
7015 RETURN
7020 PRINT "Vous etes tombe dans l'incinerateur     d'organes ..."
7025 RETURN
7030 PRINT "Vous venez de faire une chute dans un   precipice d'au moins 200 m."
7035 RETURN
7040 PRINT "Cette soupe etait un acide sulfurique   parfume... Hum! Douce mort."
7045 RETURN
REM 5 
7050 PRINT "Il ne se passe rien, cela fait toujours un repas de gagne."
7055 RETURN
7060 PRINT "La soupe est euphorisante, vous avez la vision d'une ville doree."
7065 RETURN
7070 PRINT "Vous mourez etouffe dans les sables     mouvants..."
7075 RETURN
7080 PRINT "Vous trebuchez en l'abordant....        Miam, miam (les piranhas)."
7085 RETURN
7090 PRINT "Des gaz mortels s'echappent de la       bouteille... c'est triste."
7095 RETURN

REM 10 
7100 PRINT "Un panneau du mur pivote, des COBRAS en sortent... Adieu !"
7105 RETURN
7110 PRINT "Vous trebuchez et vous vous empallez surle tournevis."
7115 RETURN
7120 PRINT "Vous avez ete broye !!!"
7125 RETURN
7130 PRINT "Le robot vous broie les os..."
7135 RETURN
7140 PRINT "Un barreau de l'echelle se detache."
7145 RETURN
REM 15 
7150 PRINT "Vous ne saviez pas piloter le DELTA     PLANE... Adieu !"
7155 RETURN
7160 PRINT "J'ai toujours pense qu'en 10 lecons le  DELTA c'est juste."
7165 RETURN
7170 PRINT "Vous avez ete happe par une presse      hydraulique..."
7175 RETURN
7180 PRINT "Vous grillez sur le generateur de la    salle d'operation."
7185 RETURN
7190 PRINT "Vous glissez en montant, la colle gicle dans vos yeux."
7195 RETURN
REM 20 
7200 PRINT "L'eau touche le systeme electrique...   Vous grillez..."
7205 RETURN
7210 PRINT "La folie vous a pris (vider un seau     vide), vous vous suicidez."
7215 RETURN
7220 PRINT "Vous electrocutez le robot, mais vous   aussi par la meme occasion."
7225 RETURN
7230 PRINT "Petit genie, hein ? Vous avez enraye le mecanisme du robot."
7235 RETURN
7240 PRINT "Vous vous etes colles les doigts, et en voulant les separer a la lame de rasoir,vous vous etes tranche la gorge."
7245 RETURN
REM 25 
7250 PRINT "Oh merci, merci beaucoup... SMACK !"
7255 RETURN
7260 PRINT "Vous l'avez deja fait."
7265 RETURN
7270 PRINT "Il faudrait peut-etre debrancher la     batterie."
7275 RETURN
7280 PRINT "Ce livre apprend le DELTA-PLANE en 10   lecons."
7285 RETURN
7290 PRINT "L'endroit est un peu trop exigu pour    essayer une telle chose."
7295 RETURN
REM 30 
7300 PRINT "Vous avez l'intention de vous shooter ?"
7305 RETURN
7310 PRINT "La boite explose !"
7315 RETURN
7320 PRINT "Il y a une clef sous l'adhesif."
7325 RETURN
7330 PRINT "Cette fois vous en avez trop enleve, la barque part en miettes."
7335 RETURN
7340 PRINT "La trappe est fermee a clef."
7345 RETURN
REM 35 
7350 PRINT "Le passe partout ne fonctionne pas avec cette serrure."
7355 RETURN
7360 PRINT "Les murs se rapprochent les uns des     autres, vous etes aplati."
7365 RETURN
7370 PRINT "Si cela vous plait de perdre du temps !"
7375 RETURN
7380 PRINT "Il faudrait peut etre de l'electricite.."
7385 RETURN
7390 PRINT "Il faudrait peut etre y visser une      ampoule."
7395 RETURN
REM 40 
7400 PRINT "IMPOSSIBLE"
7405 RETURN
7410 PRINT "Vous tombez dans un cercueil qui se     referme sur vous."
7415 RETURN
7420 PRINT "Vous avez du attraper la rage aupres de rats..."
7425 RETURN
7430 PRINT "Vous avez mal digere la soupe, c'est    une intoxication."
7435 RETURN
7440 PRINT "Vous avez ete electrocute par la lampe."
7445 RETURN
REM 45 
7450 PRINT "A force de rester dans le noir, vous    etes devenu fou !"
7455 RETURN
7460 PRINT "Vous ne pouvez prendre, il faut acheter."
7465 RETURN
7470 PRINT "Le marchand est fou, il se jette sur    vous et vous tue."
7475 RETURN
7480 PRINT "He! he! On ne rentre pas dans un temple avec ses chaussures, les gardes vous tue"
7485 RETURN
7490 PRINT "La piece etait pleine de mouches........tse-tse !!!"
7495 RETURN
REM 50 
7500 PRINT "Les murs s'ecroulent sur vous, vous     n'auriez pas du la laisser, grand lache."
7505 RETURN
7510 PRINT "Toutes mes felicitations.":PRINT: GOTO 8800
7515 RETURN
7520 PRINT "Il aurait fallu mettre le masque, les   gaz vous tue !"
7525 RETURN
7530 PRINT "La fille n'avait pas de masque, elle    meurt et vous aussi (le remord...)."
7535 RETURN
7540 PRINT "La fille etait nue, elle ne pouvait voussuivre. Pour se venger elle vous tranchela gorge avec les debris."
7545 RETURN
REM 55 
7550 PRINT "Vous n'avez rien pour trancher les      cordes."
7555 RETURN
7560 PRINT "Vous auriez du eteindre la lampe avant  de debrancher. Quel court circuit !!!"
7565 RETURN
7570 PRINT "Le possesseur du portefeuille devait    avoir la lepre..."
7575 RETURN
7580 PRINT "Vous trebuchez sur la hache...          Que de sang..."
7585 RETURN
7590 PRINT "Voici enfin la ville des mutiles.       Pauvres survivants des experiences      cruelles du savant fou."
7595 RETURN
REM 60 
7600 PRINT "Vous avez du prendre mal par les pieds."
7605 RETURN
7610 PRINT "La quinine etait trop forte, vous mourezempoisonne..."
7615 RETURN
7620 PRINT "Je ne suis pas interresse."
7625 RETURN 
7630 PRINT "Alors,que faites vous la?"
7635 RETURN 
7640 PRINT "Si cela vous plait de perdre du temps"
7645 RETURN 
REM 65 
7650 PRINT "Oh merci,merci beaucoup...' SMACK '"
7655 RETURN 
7660 ZX=INT(RND(1)*9+1)
7661 ON ZX GOTO 7670,7680,7690,7700,7710,7720,7730,7740,7750
7670 PRINT "Courage,pensez a la recompense..."
7675 RETURN 
7680 PRINT "Hum!Il y a de l'idee dans ce que vous   faites."
7685 RETURN 
7690 PRINT "Je n'aurais pas pense a faire cela."
7695 RETURN 
7700 PRINT "Vous etes un habitue des jeux d'aventures ?"
7705 RETURN  
7710 PRINT "Quelle drole d'idee ?"
7715 RETURN 
7720 PRINT "Pourquoi pas ?"
7725 RETURN 
7730 PRINT "Quel aventurier vous faites...fiiuuue"
7735 RETURN 
7740 PRINT "A ce train la,vous finirez bien par   y  arriver"
7745 RETURN 
7750 PRINT "Vous,vous avez pas de petrole , mais     vous avez des idees"
7755 RETURN 
REM 75
7760 PRINT "Vous etes dans une barque rafistolee    par de l'adhesif."
7765 RETURN
7770 PRINT "Enfin la rive nord."
7775 RETURN
7780 PRINT "Enfin la rive sud."
7785 RETURN
7790 SALLE=53:PO(2)=-1:PO(34)=-1:PO(6)=51:PO(9)=-1:PO(13)=-1:PO(20)=-1:PO(12)=-1:PO(11)=-1:PO(17)=-1
7795 PO(26)=-1:PO(25)=-1:PO(31)=-1:PO(38)=-1:PO(23)=-1:PO(27)=-1:PO(23)=-1:PO(29)=-1:PO(22)=-1
7799 RETURN
7800 PRINT "Masque sur le visage."
7805 RETURN
REM ------------ LIEUX --------------
REM 1
8010 PRINT "L'antre du demon.":PRINT
8011 PRINT "Vous etes dans une grotte amenagee..."
8015 RETURN
8020  PRINT "Le repere du chirurgien.":PRINT
8021 PRINT "Il y a une porte au sud ,il y a plein dephotos chirurgicales sur les murs"
8025 RETURN
8030 PRINT "xxxxxxxxxxxxxxxxxx 1"
8035 RETURN
8040 PRINT "L'antre du sorcier.":PRINT
8045 RETURN
8050 PRINT "Au bord du lac.":PRINT
8051 PRINT "Vous etes au bord d'un lac souterrain"
8055 RETURN
8060 PRINT "Vous etes sur la rive nord du lac":PRINT


8065 RETURN
8070 PRINT "Le repere du lecteur."

8075 RETURN
8080 PRINT "Au nord,un banc de sable."
8082 PRINT "Vous etes sur le cote du lac,le seul"
8083 PRINT "chemin est au nord sous la forme d'un   banc de sable"
8085 RETURN

8090 PRINT "Le bout du lac."
8095 RETURN

REM 10
8100 PRINT "La salle mecanique."
8105 RETURN
8110 PRINT "Une grotte vide."
8115 RETURN
8120 PRINT "La trappe des enrages.":PRINT "Il y a une trappe au sol, munie d'une   serrure."
8125 RETURN
8130 PRINT "Il y a une porte au sud marquee 'EXIT'"
8135 RETURN
8140 PRINT "Il y a une porte au sud avec le jour     qui filtre en dessous"
8145 RETURN
8150 PRINT "L'antre du lecteur."
8155 RETURN
8160 PRINT "Il y a trois marmites avec des soupes":PRINT "rouge,verte et bleue"
8165 RETURN
8170 PRINT "L'atelier."
8175 RETURN
8180 PRINT "Dans une frele esquive en scotch et boispourri, proche de la rive.":
8185 RETURN
8190 PRINT "La chambre des lumieres."
8195 RETURN

REM 20
8200 PRINT "Le refuge de l'alchimiste."
8205 RETURN
8210 PRINT "Le gite du fakir.":PRINT
8211 PRINT "Il y a un anneau fixe au mur"
8215 RETURN
8220 PRINT "L'antre de la verite."
8225 RETURN
8230 PRINT "L'antre du fou."
8235 RETURN
8240 PRINT "L'antre du maigre."
8245 RETURN
8250 PRINT "Le repere de l'embaumeur."
8255 RETURN
8260 PRINT "Le gite du bricoleur.":PRINT
8261 PRINT "Il y a une ouverture au sud..."
8265 RETURN
8270 PRINT "Le repere du fuyard. Il y a une trappe."
8275 RETURN
8280 PRINT "Le refuge du montagnard."
8285 RETURN
8290 PRINT "Le chemin des rongeurs."
8295 RETURN
REM 30
8300 PRINT "L'antichambre de la mort."
8305 RETURN
8310 PRINT "Du bruit a l'est.":PRINT
8311 PRINT "Il y a une porte marquee DANGER au sud"
8315 RETURN
8320 PRINT "De la lumiere au sud."
8321 PRINT "Il y a au sud un passage d'ou viennent    de droles de bruits"
8325 RETURN
8330 PRINT "L'antre du maniaque."
8335 RETURN
8340 PRINT "Le repere des rats.":PRINT
8341 PRINT "Il y a des rats un peu partout..."
8345 RETURN
8350 PRINT "La salle des survivants."
8355 RETURN
8360 PRINT "La cremerie et le tailleur."
8365 RETURN
8370 PRINT "Le tabac et la boulangerie."
8375 RETURN
8380 PRINT "Le traiteur."
8385 RETURN
8390 PRINT "Le medecin et le chausseur."
8395 RETURN
8400 PRINT "Le coin nord-ouest de la ville."
8405 RETURN
8410 PRINT "La fin de la ville !"
8415 RETURN
8420 PRINT "Dans le tabac.":PRINT
8421 PRINT "Le vendeur dort sur le comptoir"
8425 RETURN
8430 PRINT "xxxxxxxxxxxxxxxxxx 3"
8435 RETURN
8440 PRINT "Chez le tailleur.":PRINT
8441 PRINT "  Il y a plein d'habits a vendre"
8445 RETURN
8450 PRINT " Vous etes dans la cremerie"
8455 RETURN
8460 PRINT "Vous etes chez le chausseur":PRINT
8461 PRINT "La boutique est bien achalandee"
8465 RETURN
8470 PRINT "Chez le medecin.":PRINT
8471 PRINT "Le medecin est parti"
8475 RETURN
8480 PRINT "Vous face a la droguerie."
8485 RETURN
8490 PRINT "Dans la droguerie."
8495 RETURN
REM 50
8500 PRINT "Le coin sud-est de la ville."
8505 RETURN
8510 PRINT "Devant un monument..? ": PRINT"Le fameux temple a la gloire du GRAND   KiKeKanKoi !"
8515 RETURN
8520 PRINT "Vous etes en face du traiteur":PRINT
8521 PRINT "Que vendez-vous ?"
8525 RETURN
8530 PRINT "La salle de la B.A."
8535 RETURN
8540 PRINT "Le mausolee de l'exterminateur."
8545 RETURN
8550 PRINT "Le choeur du Temple."
8555 RETURN
8560 PRINT "L'antre du venere.":PRINT
8561 PRINT "Il y a une porte au sud"
8565 RETURN
8570 PRINT "Le chemin des dipteres."
8575 RETURN
8580 PRINT "L'antre du victorieux."
8581 PRINT "Vous etes dans un reduit dont les"
8582 PRINT "murs sont fait de blocs de pierre."
8585 RETURN

8600 PRINT:PRINT " EN CETTE HEURE PENIBLE ,MOI Apple 2":PRINT
8620 PRINT "J'ai le terrible devoir de vous       "
8630 PRINT "annoncer la mort tragique de votre    "
8640 PRINT "propre personne dans la redoutable    "
8650 PRINT "KIKEKANKOI,mais peut etre vous en     "
8660 PRINT "etiez vous rendu compte...?":PRINT 
8670 PRINT "Vos funerailles furent respectables,  "
8680 PRINT "de par la preuve de courage que vous  "
8690 PRINT "aviez donne,et pour la personne qui   "
8700 PRINT "a cette heure ci est encore prison-   "
8710 PRINT "niere de la cite mysterieuse... "
8720 PRINT
8730 PRINT "  OUF.....oui je sais,c'est toujours  "
8740 PRINT "trop long les sepultures...":PRINT
8750 PRINT "Voulez vous arreter ?"
8760 GOSUB 5510
8770 RUN

8800 PRINT "Quelle classe...,ressortir vivant de  "
8810 PRINT "KIKEKANKOI,il fallait le faire,       "
8820 PRINT "d'autant plus que vous ne vous etes   "
8830 PRINT "meme pas ecorche un doigt!Mais ne     "
8840 PRINT "restez pas trop dans les parages,car  "
8850 PRINT "le savant fou a peut etre encore      "
8860 PRINT "quelques experiences a faire sur vous,"
8865 PRINT "comme vous greffer une tete de singe  "
8870 PRINT "ou un cerveau electronique de 48 Ko..."
8875 PRINT:PRINT "Merci d'etre reste si longtemps a"
8880 PRINT "votre clavier,et encore toutes mes    ":PRINT "felicitations"
8885 PRINT "Voulez vous arreter ?"
8890 GOSUB 5510
8895 RUN

8900 O = 38: DIM Q(O): DIM O$(O)
8902 LET O$(01)="Une batterie"
8903 LET O$(02)="Une batterie branchee"
8904 LET O$(03)="Une barque"
8905 LET O$(04)="X"
8906 LET O$(05)="Un seau"
8907 LET O$(06)="Un seau plein de sable"
8908 LET O$(07)="Un seau plein d'eau"
8909 LET O$(08)="Une lampe electrique"
8910 LET O$(09)="Une lampe avec une ampoule"
8911 LET O$(10)="Une lampe allumee"
8912 LET O$(11)="Une fiole"
8913 LET O$(12)="Une clef"
8914 LET O$(13)="Une bouteille"
8915 LET O$(14)="Un livre"
8916 LET O$(15)="Un passe partout"
8917 LET O$(16)="Un tournevis"
8918 LET O$(17)="Un delta plane"
8919 LET O$(18)="Une echelle de corde"
8920 LET O$(19)="Un tube de colle"
8921 LET O$(20)="Une ampoule"
8922 LET O$(21)="Une boite"
8923 LET O$(22)="Des debris de verre"
8924 LET O$(23)="Un masque a gaz"
8925 LET O$(24)="De la quinine"
8926 LET O$(25)="Un aspirine"
8927 LET O$(26)="Des espadrilles"
8928 LET O$(27)="Une robe"
8929 LET O$(28)="Un portefeuille"
8930 LET O$(29)="Une broche"
8931 LET O$(30)="Un harnais"
8932 LET O$(31)="Une bombe insecticide"
8933 LET O$(32)="Une hache"
8934 LET O$(33)="Un pot de creme"
8935 LET O$(34)="Une liasse de billets"
8936 LET O$(35)="Vos chaussures"
8937 LET O$(36)="Une super jolie fille ligotee....       et nue qui plus est."
8938 LET O$(37)="Une super jolie fille libre...":O$(38)="Un maillet"
8939 LET Q(01)=2
8940 LET Q(02)=0
8941 LET Q(03)=5
8942 LET Q(04)=0
8943 LET Q(05)=14
8944 LET Q(06)=0
8945 LET Q(07)=0
8946 LET Q(08)=19
8947 LET Q(09)=0
8948 LET Q(10)=0
8949 LET Q(11)=20
8950 LET Q(12)=0
8951 LET Q(13)=18
8952 LET Q(14)=15
8953 LET Q(15)=17
8954 LET Q(16)=26
8955 LET Q(17)=27
8956 LET Q(18)=28
8957 LET Q(19)=33
8958 LET Q(20)=34
8959 LET Q(21)=35
8960 LET Q(22)=0
8961 LET Q(23)=47
8962 LET Q(24)=47
8963 LET Q(25)=47
8964 LET Q(26)=46
8965 LET Q(27)=44
8966 LET Q(28)=50
8967 LET Q(29)=50
8968 LET Q(30)=49
8969 LET Q(31)=54
8970 LET Q(32)=42
8971 LET Q(33)=45
8972 LET Q(34)=0
8973 LET Q(35)=0
8974 LET Q(36)=53
8975 LET Q(37)=0
8976 LET Q(38)=40

9100 V = 133: DIM V$(V)
9101 LET V$(001)="01N"
9102 LET V$(002)="O1NORD"
9103 LET V$(003)="02S"
9104 LET V$(004)="02SUD"
9105 LET V$(005)="03E"
9106 LET V$(006)="03EST"
9107 LET V$(007)="04O"
9108 LET V$(008)="04OUES"
9109 LET V$(009)="05M"
9110 LET V$(010)="05MONT"
9111 LET V$(011)="05GRIM"
9112 LET V$(012)="06DESC"
9113 LET V$(013)="06D"
9114 LET V$(014)="07ENTR"
9115 LET V$(015)="08AVAN"
9116 LET V$(016)="09SORS"
9117 LET V$(017)="10PREN"
9118 LET V$(018)="10RAMA"
9119 LET V$(019)="11POSE"
9120 LET V$(020)="11LAIS"
9121 LET V$(021)="12OUVR"
9122 LET V$(022)="13FERM"
9123 LET V$(023)="14ALLU"
9124 LET V$(024)="14ECLA"
9125 LET V$(025)="15ETEI"
9126 LET V$(026)="15ARRE"
9127 LET V$(027)="16LIS"
9128 LET V$(028)="16LIT"
9129 LET V$(029)="17REGA"
9130 LET V$(030)="18REMP"
9131 LET V$(031)="19VIDE"
9132 LET V$(032)="20INVE"
9133 LET V$(033)="20LIST"
9134 LET V$(034)="20I"
9135 LET V$(035)="21RIEN"
9136 LET V$(036)="21ATTE"
9137 LET V$(037)="22FRAP"
9138 LET V$(038)="22ASSO"
9139 LET V$(039)="22ATTA"
9140 LET V$(040)="23POUS"
9141 LET V$(041)="23TIRE"
9142 LET V$(042)="24JETT"
9143 LET V$(043)="24LANC"
9144 LET V$(044)="25MANG"
9145 LET V$(045)="25GOUT"
9146 LET V$(046)="25AVAL"
9147 LET V$(047)="26BOIS"
9148 LET V$(048)="27BARQ"
9149 LET V$(049)="28RADE"
9150 LET V$(050)="29BOUT"
9151 LET V$(051)="30MESS"
9152 LET V$(052)="31SEAU"
9153 LET V$(053)="32MANU"
9154 LET V$(054)="32LIVR"
9155 LET V$(055)="33ECHE"
9156 LET V$(056)="34PASS"
9157 LET V$(057)="35LAMP"
9158 LET V$(058)="35TORC"
9159 LET V$(059)="36BATT"
9160 LET V$(060)="37FIOL"
9161 LET V$(061)="38DELT"
9162 LET V$(062)="39TOUR"
9163 LET V$(063)="40AMPO"
9164 LET V$(064)="41BOIT"
9165 LET V$(065)="42CLEF"
9166 LET V$(066)="43MARM"
9167 LET V$(067)="44ANNE"
9168 LET V$(068)="45ROUG"
9169 LET V$(069)="46VERT"
9170 LET V$(070)="47BLEU"
9171 LET V$(071)="48TRAP"
9172 LET V$(072)="49SABL"
9173 LET V$(073)="50ROBO"
9174 LET V$(074)="51BRAN"
9175 LET V$(075)="52"
9176 LET V$(076)="53TUBE"
9177 LET V$(077)="53COLL"
9178 LET V$(078)="54VISS"
9179 LET V$(079)="55EAU"
9180 LET V$(080)="56DEBO"
9181 LET V$(081)="57CASS"
9182 LET V$(082)="58ESSA"
9183 LET V$(083)="59SENS"
9184 LET V$(084)="59RENI"
9185 LET V$(085)="60PLAC"
9186 LET V$(086)="61ADHE"
9187 LET V$(087)="62DECO"
9188 LET V$(088)="63RAME"
9189 LET V$(089)="64CHRO"
9190 LET V$(090)="65MAIL"
9191 LET V$(091)="66MASQ"
9192 LET V$(092)="67CHAU"
9193 LET V$(093)="68ROBE"
9194 LET V$(094)="69PORT"
9195 LET V$(095)="70BROC"
9196 LET V$(096)="71HARN"
9197 LET V$(097)="72BOMB"
9198 LET V$(098)="73"
9199 LET V$(099)="74DONN"
9200 LET V$(100)="75VETE"
9201 LET V$(101)="76VEND"
9202 LET V$(102)="77ACHE"
9203 LET V$(103)="78ENLE"
9204 LET V$(104)="78ARRA"
9205 LET V$(105)="78CREU"
9206 LET V$(106)="79PIER"
9207 LET V$(107)="79BLOC"
9208 LET V$(108)="79MUR"
9209 LET V$(109)="80ESPA"
9210 LET V$(110)="81HACH"
9211 LET V$(111)="82POT"
9212 LET V$(112)="83LIAS"
9213 LET V$(113)="84TABA"
9214 LET V$(114)="85MEDE"
9215 LET V$(115)="86CHAU"
9216 LET V$(116)="87CREM"
9217 LET V$(117)="88TRAI"
9218 LET V$(118)="89BOUL"
9219 LET V$(119)="90TAIL"
9220 LET V$(120)="91DROG"
9221 LET V$(121)="92TEMP"
9222 LET V$(122)="93DELI"
9223 LET V$(123)="93LIBE"
9224 LET V$(124)="94FEMM"
9225 LET V$(125)="94FILL"
9226 LET V$(126)="95METS"
9227 LET V$(127)="95ENFI"
9228 LET V$(128)="95PASS"
9229 LET V$(129)="96DEBR"
9230 LET V$(130)="97ASPI"
9231 LET V$(131)="98QUIN"
9232 LET V$(132)="99FIN"
9233 LET V$(133)="00ESCA"

9300 R = 58: DIM M$(58)
9301 LET M$(01)="04020304060500"
9302 LET M$(02)="030100"
9303 LET M$(03)="X"
9304 LET M$(04)="0401031300"
9305 LET M$(05)="05010408030700"
9306 LET M$(06)="X"
9307 LET M$(07)="0405031500"
9308 LET M$(08)="030500"
9309 LET M$(09)="06120410031100"
9310 LET M$(10)="030900"
9311 LET M$(11)="0409032200"
9312 LET M$(12)="0509012500"
9313 LET M$(13)="0404031400"
9314 LET M$(14)="0413031600"
9315 LET M$(15)="04070121032000"
9316 LET M$(16)="04140119031700"
9317 LET M$(17)="041600"
9318 LET M$(18)="00"
9319 LET M$(19)="021600"
9320 LET M$(20)="041500"
9321 LET M$(21)="021500"
9322 LET M$(22)="04110124032300"
9323 LET M$(23)="042200"
9324 LET M$(24)="0127022200"
9325 LET M$(25)="0212032600"
9326 LET M$(26)="0425032700"
9327 LET M$(27)="0426022400"
9328 LET M$(28)="042901300232033100"
9329 LET M$(29)="032800"
9330 LET M$(30)="022800"
9331 LET M$(31)="0428023500"
9332 LET M$(32)="0128023300"
9333 LET M$(33)="013200"
9334 LET M$(34)="032900"
9335 LET M$(35)="013100"
9336 LET M$(36)="0137031000"
9337 LET M$(37)="023601380348043900"
9338 LET M$(38)="014102370440075200"
9339 LET M$(39)="0140033700"
9340 LET M$(40)="0338023900"
9341 LET M$(41)="023800"
9342 LET M$(42)="093700"
9343 LET M$(43)="00"
9344 LET M$(44)="093600"
9345 LET M$(45)="093600"
9346 LET M$(46)="093900"
9347 LET M$(47)="093900"
9348 LET M$(48)="04370350074900"
9349 LET M$(49)="094800"
9350 LET M$(50)="0151044800"
9351 LET M$(51)="025000"
9352 LET M$(52)="093800"
9353 LET M$(53)="025600"
9354 LET M$(54)="035600"
9355 LET M$(55)="0456035700"
9356 LET M$(56)="0153035502510454095100"
9357 LET M$(57)="045500"
9358 LET M$(58)="015700"

9399 C = 11: DIM C$( C )
9400 LET C$(01)="G01.D42R."
9401 LET C$(02)="G02.D43R."
9402 LET C$(03)="G03B10.D44R."
9403 LET C$(04)="G09.D45R."
9404 LET C$(05)="E18E19F21.E21E17N."
9405 LET C$(06)="G04.D57R."
9406 LET C$(07)="G06.D58R."
9407 LET C$(08)="H20E14F20.D60R."
9408 LET C$(09)="D26D27D34.J34N."
9409 LET C$(10)="H08.D66N."
9410 LET C$(11)=".M."

REM # E01:
REM # E02:
REM # E03: SEAU+SABLE.
REM # E04: MANUEL.
REM # E05: BATTERIE.
REM # E06:
REM # E07:
REM # E08:
REM # E09: TRAPPE./ADHESIF.
REM # E10: BARQUE.
REM # E11: LAMPE+BATTERIE.
REM # E12: 
REM # E13: TRAPPE.
REM # E14: TOP.
REM # E15: DEBRIS.
REM # E16: PIERRE./BOUTEILLE.
REM # E17: 
REM # E18: ROBE.
REM # E19: VETEMENTS.
REM # E20: ASPIRINE.

9500 A = 184: DIM A$( A )
9501 LET A$(01)="0100A25.D41R."
9502 LET A$(02)="0200A02.D01R."
9503 LET A$(03)="0200A13.D02R."
9504 LET A$(04)="2545A16.D04R."
9505 LET A$(05)="2546A16.D05G0207N."
9506 LET A$(06)="2547A16.D06L."
9507 LET A$(07)="0100A08.D07R."
9508 LET A$(08)="6400.D37N."
9509 LET A$(09)="1028A05.D08R."
9510 LET A$(10)="1229B13C23.D09R."
9511 LET A$(11)="1229B13.J13."
9512 LET A$(12)="2344A21.D10R."
9513 LET A$(13)="0600A12D16E13.D11R."
9514 LET A$(14)="0600A12E13.K28O."
9515 LET A$(15)="0400A10F01F03.D12R."
9516 LET A$(16)="0400A10F03D08E01.D13R."
9517 LET A$(17)="0400A10E03.D59K36O."
9518 LET A$(18)="0200A14C18C17.D03R."
9519 LET A$(19)="0200A14D18C17.D14R."
9520 LET A$(20)="0200A14D17E04.D16R."
9521 LET A$(21)="0200A14D17.D15R."
9522 LET A$(22)="0100A30.D17R."
9523 LET A$(23)="0300A31.D18R."
9524 LET A$(24)="0400A29F05.G0107K34O."
9525 LET A$(25)="0400A29.K34O."
9526 LET A$(26)="0500A28D19.D19R."
9527 LET A$(27)="0500A28.K12O."
9528 LET A$(28)="1435C02D08.D38N."
9529 LET A$(29)="1435D10.D26N."
9530 LET A$(30)="1435D08.D39N."
9531 LET A$(31)="1435D09.G0313H09O."
9532 LET A$(32)="1435C02D09.D38N."
9533 LET A$(33)="1535C10.D40N."
9534 LET A$(34)="1535.H09O."
9535 LET A$(35)="1049D05A08.H05O."
9536 LET A$(36)="1055D05A09.J05B07L."
9537 LET A$(37)="1055D05A05.J05B07L."
9538 LET A$(38)="1055D05A18.J05B07L."
9539 LET A$(39)="1036B01.B01L."
9540 LET A$(40)="1027A05.F10K18D76O."
9541 LET A$(41)="1027A09.E10K18D76O."
9542 LET A$(42)="1031B06.B06L."
9543 LET A$(43)="1031B07.B07L."
9544 LET A$(44)="1031B05.B05L."
9545 LET A$(45)="1035B09.B09L."
9546 LET A$(46)="1035B10.B10L."
9547 LET A$(47)="1035B08.B08L."
9548 LET A$(48)="1037B11.B11L."
9549 LET A$(49)="1042E09B12.B12J12."
9550 LET A$(50)="1029B13.B13L."
9551 LET A$(51)="1032B14.B14L."
9552 LET A$(52)="1034B15.B15L."
9553 LET A$(53)="1039B16.B16L."
9554 LET A$(54)="1038B17.B17L."
9555 LET A$(55)="1033B18.B18L."
9556 LET A$(56)="1053B19.B19L."
9557 LET A$(57)="1041B21.B21L."
9558 LET A$(58)="1040B20.B20L."
9559 LET A$(59)="1136D02.D27N."
9560 LET A$(60)="1136.C01."
9561 LET A$(61)="1127A18E10.K09I03O."
9562 LET A$(62)="1127A18.K05I03O."
9563 LET A$(63)="1131D05.C05J05."
9564 LET A$(64)="1131D06.C06J06."
9565 LET A$(65)="1131D07.C07J07."
9566 LET A$(66)="1135D02.D27N."
9567 LET A$(67)="1135D09.C09J09."
9568 LET A$(68)="1135D10.C10J10."
9569 LET A$(69)="1135.C08J08."
9570 LET A$(70)="1137.C11J11."
9571 LET A$(71)="1142.C12J12."
9572 LET A$(72)="1129.C13J13."
9573 LET A$(73)="1132.C14J14."
9574 LET A$(74)="1134.C15J15."
9575 LET A$(75)="1139.C16J16."
9576 LET A$(76)="1138.C17J17."
9577 LET A$(77)="1133.C18J18."
9578 LET A$(78)="1153.C19J19."
9579 LET A$(79)="1140.C20J20."
9580 LET A$(80)="1141.C21J21."
9581 LET A$(81)="6300A18E10.F10D78O."
9582 LET A$(82)="6300A18.E10D77O."
9583 LET A$(83)="1931D07I05I18I09.D20R."
9584 LET A$(84)="1931D07.J07B05L."
9585 LET A$(85)="1931D06.H05L."
9586 LET A$(86)="1931D05.D21R."
9587 LET A$(87)="2455D07I05I18I09I10.D20R."
9588 LET A$(88)="2455D07A10.D22R."
9589 LET A$(89)="2455D07.J07B05L."
9590 LET A$(90)="2449D06I10.H05O."
9591 LET A$(91)="2449D06.E03H05D23N."
9592 LET A$(92)="1149D06.H05O."

9593 LET A$(93)="5136D09D01.H01J."

9594 LET A$(94)="1937B11.E11J11."
9595 LET A$(95)="1953B19.D24R."

9596 LET A$(96)="5136D08D01.H01J."

9597 LET A$(97)="9636B10.D56R."
9598 LET A$(98)="9636D02.H01G0300O."

9599 LET A$(99)="2637B11F11F05.E05L."
9600 LET A$(100)="5729B13C23.D09R."
9601 LET A$(101)="1232B14.J14."
9602 LET A$(102)="1632B14.D28E04N."
9603 LET A$(103)="2432B14.B14L."
9604 LET A$(104)="5838B17.D29N."
9605 LET A$(105)="1253B19.D24R."
9606 LET A$(106)="5937B11.D30N."
9607 LET A$(107)="5440D20D08.J20H08A."
9608 LET A$(108)="5740D20.C20H20."
9609 LET A$(109)="2440B20.C20H20."
9610 LET A$(110)="1241B21D15.D31R."
9611 LET A$(111)="1248A12C12C15.D34N."
9612 LET A$(112)="1248A12C12.D35N."
9613 LET A$(113)="1248A12.E13."
9614 LET A$(114)="6261A18F09.E09I12D32N."
9615 LET A$(115)="6261A18E09.D33R."
9616 LET A$(116)="1260A24.D36R."
9617 LET A$(117)="2000.A."
9618 LET A$(118)="1067B35.F14B35."
9619 LET A$(119)="1065B38.B38L."
9620 LET A$(120)="1066B23.B23L."
9621 LET A$(121)="1070B29.B29L."
9622 LET A$(122)="1081B32.B32G0603L."
9623 LET A$(123)="1071B30.B30J30."
9624 LET A$(124)="1082B33.B33J33."
9625 LET A$(125)="1069B28.B28G0405L."
9626 LET A$(126)="1072B31.B31L."
9627 LET A$(127)="1080A46B26.D46N."
9628 LET A$(128)="1080B26.B26L."
9629 LET A$(129)="1068A44B27.D46N."
9630 LET A$(130)="1068B27.B27L."
9631 LET A$(131)="1165.C38J38."
9632 LET A$(132)="1166E16.F16C23."
9633 LET A$(133)="1166.C23."
9634 LET A$(134)="1181.C32."
9635 LET A$(135)="1170.C29."
9636 LET A$(136)="1171.C30."
9637 LET A$(137)="1182.C33."
9638 LET A$(138)="1167F14.E14I35O."
9639 LET A$(139)="1172.C31."
9640 LET A$(140)="1180.C26."
9641 LET A$(141)="1168.C27."
9642 LET A$(142)="7638B17A52.J17B34A."
9643 LET A$(143)="7600A52.D62N."
9644 LET A$(144)="7780D34A46.B26J."
9645 LET A$(145)="7768D34A44.B27J."
9646 LET A$(146)="0784A37.I42O."
9647 LET A$(147)="0785A39.K47O."
9648 LET A$(148)="0767A39.K46O."
9649 LET A$(149)="0787A36.K45O."
9650 LET A$(150)="0788A38.K52O."
9651 LET A$(151)="0789A37.D47R."
9652 LET A$(152)="0790A36.K44O."
9653 LET A$(153)="0791A48.K49O."
9654 LET A$(154)="0792A51F14.D48R."
9655 LET A$(155)="0792A51E14.K56O."
9656 LET A$(156)="0200A57C31.D49R."
9657 LET A$(157)="0200A57.K58O."

9658 LET A$(158)="7879A58D29D38F15.D50R."
9659 LET A$(159)="7879A58D29D38F17.D54R."
9660 LET A$(160)="7879A58D29D38.D51N."

9661 LET A$(161)="9566B23F16.E16D80L."
9662 LET A$(162)="5729B13D23F16.D52R."
9663 LET A$(163)="5729B13I53E16.J13I22O."
9664 LET A$(164)="5729B13E16.D53R."
9665 LET A$(165)="1096B22.B22L."

9666 LET A$(166)="9394A53B22F15.E15B36H36D65."
9667 LET A$(167)="9394A53F15.D55N."

9668 LET A$(168)="1196.C22."
9669 LET A$(169)="7475D26D27E15F17.E17J26J27L."
9670 LET A$(170)="7475D27E15F19.E19J27L."
9671 LET A$(171)="7468D27E15F19.E19J27L."
9672 LET A$(172)="7480D26E15F18.E18J26L."
9673 LET A$(173)="1097B25.B25L."
9674 LET A$(174)="2597D25.J25E20L."
9675 LET A$(175)="2597B25.J25E20L."
9676 LET A$(176)="1098B24.B24L."
9677 LET A$(177)="2598B24.D61R."
9678 LET A$(178)="2100A52.D63N."
9679 LET A$(179)="2100.D64N."
9680 LET A$(180)="1197.C25."
9681 LET A$(181)="1198.C24."

9682 LET A$(182)="0727.D75R."
9683 LET A$(183)="9900.P."

9684 LET A$(184)="5600.D79O."

9900  GOTO 1
9999  END 

19000 REM
19400 PR#1
19405 FOR AZ=1 TO A
19410 LET OZ=VAL(MID$ (A$(AZ),1, 2))
19415 GOSUB 19500
19416 PRINT AZ;"=";E$;" ";
19420 OZ=VAL(MID$ (A$(AZ),3,2))
19425 GOSUB 19500
19428 PRINT E$;" : ";A$(AZ)
19430 REM FOR BZ=5 TO LEN (A$(AZ))
19431  REM E$=MID$ (A$(AZ),BZ,1)
19433  REM IF LEFT$(E$,BZ)>="A" AND LEFT$(E$,BZ)<="K" THEN BZ=BZ+2
19434  REM PRINT LEFT$(E$,,3);
19435  REM IF E$<>"" THEN NEXT BZ
19440 NEXT AZ
19445 PR#0
19450 STOP

19500 E$=""
19501 IF OZ=0 THEN RETURN
19505 FOR ZZ=1 TO V
19510 IF OZ<>VAL(LEFT$(V$(ZZ), 2)) THEN NEXT ZZ
19520 IF ZZ<(V+1) THEN E$=MID$(V$(ZZ),3)
19530 RETURN

29100 K = (PO(N) = SALLE OR PO(N) < 0)


