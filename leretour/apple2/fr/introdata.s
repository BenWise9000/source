*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	lst	off

*-----------------------------------
* LES TEXTES DE L'INTRO
*-----------------------------------

txtINTRO1	ENT
	str	'Brutal Deluxe Software'
txtINTRO2	ENT
	str	'Antoine Vignau & Olivier Zardini'
txtINTRO3	ENT
	str	'pr'8e'sentent'
txtINTRO4	ENT
	str	'Merci XavSnap'
txtINTRO5	ENT
	str	'LE RETOUR DU DR GENIUS'
txtINTRO6	ENT
	str	'(c) 1984 - 2024'
txtINTRO7	ENT
	str	'Laurent Benes & Loriciels'
	
*-----------------------------------

telexRECT	ENT
	dw	0,0,102,320

txtTELEX1	ENT
	asc	'Une heure du matin'00
txtTELEX2	ENT
	asc	'(heure francaise)'00
txtTELEX3	ENT
	asc	'sur tous les t'8e'lex'00
txtTELEX4	ENT
	asc	'du monde appara'94't ce'00
txtTELEX5	ENT
	asc	'message angoissant...'00
	
*-----------------------------------

txtGENIUSTEXTE	ENT
	asc	'  Moi, GENIUS, je d'8e'fie le monde. J'27'ai'0d
	asc	'invent'8e' une nouvelle arme capable de'0d
	asc	'raser la Terre, ce que je ferai dans'0d
	asc	'deux semaines... Mais, comme je ne suis'0d
	asc	'pas un monstre, je vous laisse une'0d
	asc	'chance. J'27'accepte que des hommes de'0d
	asc	'tout pays se rendent sur mon vaisseau'0d
	asc	'en orbite autour de la Terre afin de'0d
	asc	'tenter de d'8e'samorcer mes armes. Mais,'0d
	asc	'jamais plus d'27'un homme '88' la fois....'00

*-----------------------------------

txtSERPENT1	ENT
	str	'LORICIELS'
txtSERPENT2	ENT
	str	'vous propose ce que'
txtSERPENT3	ENT
	str	'vous redoutiez'
txtSERPENT4	ENT
	str	'depuis longtemps'

*-----------------------------------

txtTITRE1	ENT
	asc	'Le retour'00
txtTITRE2	ENT
	asc	'du Docteur'00
txtTITRE3	ENT
	asc	'Genius'00

txtECRITPAR1	ENT
	str	'Ecrit par Laurent Benes'
txtECRITPAR2	ENT
	str	'Assist'8e' de Karine Le Pors'
txtECRITPAR3	ENT
	str	'('A9') LORICIELS   ao'9e't 1984'

txtECRITPAR6	ENT
	str	'3 jours plus tard'
txtECRITPAR7	ENT
	str	'dans les journaux'

ecritparRECT	ENT
	dw	160,0,200,320

*-----------------------------------

txtMONDE	ENT
	asc	'C'27'est ainsi que vous d'8e'cidez de'0d
	asc	'vous rendre aux autorit'8e's pour combat-'0d
	asc	'tre de nouveau le Dr Genius.'0d
	asc	'Le lendemain, on vous emm'8f'ne au vais-'0d
	asc	'seau o'9d' vous allez maintenant tenter'0d
	asc	'de vaincre le Dr Genius afin de sauver'0d
	asc	'la Terre.'0d0d0d
	asc	'          BON COURAGE...'0d0d0d
	asc	'Vous en aurez besoin !'00

*-----------------------------------

txtEXPLICATIONS1	ENT
	asc	'Voici quelques explications'0d
	asc	'Le jeu est en temps r'8e'el, un chronom'8f'-'0d
	asc	'tre sera affich'8e' en permanence.'0d
	asc	'D'27'autre part, vous devrez prendre'0d
	asc	'garde '88' votre '8e'nergie qui diminuera au'0d
	asc	'fil de la partie.'0d
	asc	'Attention, plus vous transportez'0d
	asc	'd'27'objets, plus votre force d'8e'croit.'0d0d
	asc	'Pour converser avec l'27'ordinateur, vous'0d
	asc	'pouvez utiliser un vocabulaire choisi'0d
	asc	'parmi pr'8f's de 150 mots que vous allez'0d
	asc	'donc d'8e'couvrir au fur et '88' mesure...'0d
	asc	'et oui, c'27'est '8d'a l'27'aventure.'0d0d
	asc	'D'27'autre part, l'27'ordinateur ne prendra'0d
	asc	'en compte que les 4 premi'8f'res lettres'0d
	asc	'de chaque mot, ainsi : PRENDS CARTON'0d
	asc	'sera compris comme :   PREN CART'00

txtEXPLICATIONS2	ENT
	asc	'L'27'ordinateur ne prend en compte en'0d
	asc	'g'8e'n'8e'ral que deux mots, exemple :'0d
	asc	'- ALLUME SALLE'0d
	asc	'- EST  ou  E  ou  AVANCE EST'0d0d
	asc	'Dans certains cas,l'27'ordinateur prendra'0d
	asc	'en compte trois mots. Il s'27'agit de cas'0d
	asc	'ou un qualificatif est n'8e'cessaire, ou'0d
	asc	'lorsque l'27'on veut mettre une chose'0d
	asc	'dans une autre. Exemple :'0d0d
	asc	'PRENDS LIVRE VERT'0d
	asc	'PRENDS MOUCHOIR PAPIER'0d
	asc	'  ou'0d
	asc	'CRAYON DANS BOITE'0d0d
	asc	'Ce dernier cas indiquera qu'27'il faut'0d
	asc	'mettre le crayon dans la bo'94'te.'0d
	asc	88' condition que vous poss'8e'diez crayon'0d
	asc	'et bo'94'te, '8e'videmment.'00

txtEXPLICATIONS3	ENT
	asc	'Une derni'8f're chose, il est possible de'0d
	asc	'sauver une partie en cours, et de la'0d
	asc	'recharger, mais '88' vous de trouver le'0d
	asc	'vocabulaire ad'8e'quat...'0d0d0d0d
	asc	'Et maintenant, tr'8f's bonne aventure...'0d0d
	asc	'et prenez garde '88' vous !'0d0d0d
*	asc	'Tapez une touche pour charger le'0d
*	asc	'programme de jeu.'00			; Fond rouge, encre 
	asc	'Tapez une touche pour jouer.'00

txtEXPLICATIONS4	ENT
	asc	'Voulez-vous revoir la pr'8e'sentation (O/N) '00

*-----------------------------------
* IMAGE DU DR GENIUS (DRACULA)
*-----------------------------------

picGENIUS   ENT
            HEX   404040405F7F6040404040404040404040
            HEX   404040437F7F7E40404040404040404040
            HEX   4040405F7F7F7F78404040404040404040
            HEX   4040437F7F7E7F7E404040404040404040
            HEX   40405F7F7F604F7F604040404040404040
            HEX   40437F7F7040437F704040404040404040
            HEX   40405F7E4040407F784040404040404040
            HEX   40417F704040404F7C4040404040404040
            HEX   40404F40404040437E4040404040404040
            HEX   40405E405C4040417F4040404040404040
            HEX   40404E417C4040407F6040404040404040
            HEX   40404C437E4040405F7040404040404040
            HEX   40405C477F4C40404F7840404040404040
            HEX   4040584F7F704040477C40404040404040
            HEX   4040584F7E436040477C40404040404040
            HEX   40405040407C4F40437E40404040404040
            HEX   404050404F405070437E40404040404040
            HEX   404050437C436048417F40404040404040
            HEX   4040705C405C4040417F40404040404040
            HEX   4040704043504040417F60404040404040
            HEX   404070404F404040407F60404040404040
            HEX   404173617E404760407F70404040404040
            HEX   4041705E42405F70407F70404040404040
            HEX   4041704042405F78407F78404040404040
            HEX   4041704041407F78405F78404040404040
            HEX   40417040415F7C7C405F7C404040404040
            HEX   40417040415F704E405F7C404040404040
            HEX   40417770465F716F405F7E404040404040
            HEX   4040777F705F6163404F7E404140404040
            HEX   4040777F784F4346404F74404770404040
            HEX   4040777F79677F7C404F64417848404040
            HEX   404057737A417F78424F464E4364404040
            HEX   4040576078517F7042474F505E44404040
            HEX   4040574650486040434651677F42404040
            HEX   40405646504440404346614F7E42404040
            HEX   4040667F7042404043454C7F7E41404040
            HEX   40406D7F704140404346507F7C41404040
            HEX   4041407F60587F474740607F7840604040
            HEX   4041405F4F5C5F637F406C5F7040604040
            HEX   404140404F5C5F7B7F407E5F6040604040
            HEX   404140405F4E5F6B7E407E5F4040504040
            HEX   404148417F4F4F6B7E405E5E4040504040
            HEX   40414C437F6043637E40465C4040504040
            HEX   40406C437F7843637E404C784040484040
            HEX   40406E43637C41717C4070784040484040
            HEX   40406777637F40787C4041704040484040
            HEX   404057776170405C7C4441704040444040
            HEX   404053774040405C5C4A43604040444040
            HEX   70405377405F404E5C4A47404040444040
            HEX   78404977417F7F4E4C494F404040424040
            HEX   7C40497747794F474C4976404040424040
            HEX   7C40487747494967445040404040424040
            HEX   7C4044574D4F7973645048404040417040
            HEX   7C404447597F7F736050487C4040404840
            HEX   7C4044475F7F7F717050517E4040404640
            HEX   7C4042475F7F7F717060577F4040404140
            HEX   7F7F42435F7F7F717060577F6040404140
            HEX   7F7F71437F7F7F717060577F7040404060
            HEX   7F7F7E63797949716060577F7840404060
            HEX   7F7F7C637D4949616140577F7840404060
            HEX   7F7F78516F4F7F4361405B7F7C40404050
            HEX   7F7F7051677F7C6341407B7F7C40404050
            HEX   7F7F6049737F7C6342417D7F7E40404050
            HEX   7F7F4048707F7D47424F7D7F7F40404050
            HEX   7F7E4044787C4146425F7E7F7F60404050
            HEX   7F7C404458704046445F7E7F7F60404050
            HEX   7F7840424C40404E445F7E7F7F70404050
            HEX   7F7760424440404C485F7F5F7F70404050
            HEX   7F7058414243605C485F7F5F7F78404050
            HEX   7C4F444062477058505F7F5F7F7C404050
            HEX   7D7F7A40514F7F70705F7F4F7F7E404048
            HEX   7D7F7D40487F7F73405F7F6F7F7F404048
            HEX   7D7F7E60447F7F7C405F7F6F7F7F604048
            HEX   7E7F7F50437F7F60405F7F6F7F7F704048
            HEX   7E7F7F68417F7C40405F7F6F7F7F7C4048
            HEX   7E7F7F74405F7040405F7F777F7E434048
            HEX   7F5F7F7A40424040405B7F777F60407048
            HEX   7F5F7F7D4042404040437F777E40404C48
            HEX   7F5F7F7D4042404040437F777840404370
            HEX   7F6F7F7E6042404040417F776040404040
            HEX   7F6F7F7E6042404040417F776040404040
            HEX   7F6F7F7F5044404040407F774040404040
            HEX   7F777F7F5044404040407F764040404040
            HEX   7F777F7F5048404040407F744040404040

*-----------------------------------
* IMAGE DU DE LA UNE DU MONDE
*-----------------------------------

picMONDE    ENT
            HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
	HEX   170040404040404F6040404041637844407040404040404040404840404001404040404040404040
            HEX   170040404040407770404040434F7C7F437E44404040404040405C40404001404040404040404040
	HEX   17004040404041625E604040477C7D6F7E5F78404040404040407E40404001404040404040404040
            HEX   1700404040404373476040404F787E47784760404040404040414F604040015F5E4E5F4E5F594040
	HEX   1700404040404F72634040404B607C43745B404040404040404247604040015F5F4455445F594040
            HEX   17004040404057526C40404048407F4173664040404040404041436040400153534444445B5D4040
	HEX   170040404040645250404040484C7C60704E404040404040404073604040015053444444515D4040
            HEX   1700404040406C524040404044547C59705E40404040404040405360404001585344444451574040
	HEX   1700404040407C524040404043647C49716E40404040404040405360404001585344444451574040
            HEX   1700404040415C524040404040447C49725E40424040505040405360404001505344444451534040
	HEX   1700404040425C5240405C4040457C49725E40474040787C4240576043600153534444445B534040
            HEX   170040404044565240407E40405F7C49725E404F60417F7F44405F604770015F5F4444445F514040
	HEX   170040404044465240437F40406B7C49725E404F78527E5F78407B605F78015F5E4E444E5F514040
            HEX   1700404040457752404F676041417C49725E405C7E645E47704173617C7C01404040404040404040
	HEX   1700404040424F52404F616041407C49725E407C4F444F43704753617C4C01404040404040404040
            HEX   1700404040417F5240576360417C7C49725E407F47434E71704F53627C5C01404040404040404040
	HEX   1700404040425F524067774041447C49725E415C67414E49705753647E7801404040404040404040
            HEX   170040404042575240676C4040447C49725E425C67414E49706753647D60015F5F5F5F4E5F505F40
	HEX   17004040404243524067684040447849725E425C67414E49706753647D40015F5F5F5F445F505F40
            HEX   17004040404279524067784040447849725E425C67414E49706753647F4001535953534451505340
	HEX   17004040404149524067704040447049725E425C67414E49706753647E4001505950504451505040
            HEX   17004040404049524067604040446049725E425F67414E49706773647C40015F5F5850445F505840
	HEX   1700404040404B5E4667604040456049725E425F77415F4970677A447C400141585850445F505840
            HEX   1700404040404F7F7C67716040477049725E625F7E417F6972677C447E4C01595853534451535340
	HEX   1700404040407F7F7C637A40405F7C69725F624F78425F48746778445F50015F585F5F44515F5F40
            HEX   1700404040417C5F70607E4041787F696247414370444E44786370444770015F5C5F5F4E515F5F40
	HEX   17004040404740407058784043404349436240606042444448706043474001404040404040404040
            HEX   170040404048404060454040424F424A406C40534041484250494040684001404040404040404040
	HEX   17004040404F7F71404640404370744C4050404C4040704160464040704001404040404040404040
            HEX   170040404040405E4040404040404848404040404040404040404040404001404040404040404040
	HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
            HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
	HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
            HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
	HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
            HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
	HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
            HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
	HEX   17004040404040404040404040404040404040404040404040404040404040404040404040404040
            HEX   170048404050405040047E477C7E474C
            HEX   7E5F737840437E4F637C5F73797C4300
            HEX   40405040404040401700484040544050
            HEX   40047F477C7F474C7E5F737C40437E5F
            HEX   737E5F73797E43004040544040404040
            HEX   1700487E5E5840507E047F664C71674C
            HEX   5C5873464043465F7346587171634300
            HEX   7E7E58407C7E7E401700406260704050
            HEX   620471664C71676C5C58734640434658
            HEX   73425051716343007062704042707040
            HEX   1700407C7E5040507C0471664071676C
            HEX   5C584346404340587342505171634300
            HEX   607C50407E6060401700406042524058
            HEX   600471664071666C5C58434640434058
            HEX   43465051716343007060524062707040
            HEX   1700405E7C4C405C5E047167607F467C
            HEX   5C5E437C40437058437C5051717E4300
            HEX   7E5E4C405C7E7E401700404040404040
            HEX   40047167607E467C5C5E43784043705F
            HEX   637C5051717C43004040404040404040
            HEX   1700405040404040500471676076465C
            HEX   5C5E43584043705F73405051716C4300
            HEX   40404050404040401700405440484040
            HEX   540471676076465C5C5E435840437040
            HEX   73405051716C43004040405040404040
            HEX   17007E587C407E6C580471664076465C
            HEX   5C5843584043404073405051716C4300
            HEX   6C7E5C507E40624017006270424C6272
            HEX   700471664073464C5C58434C40434040
            HEX   73405051716643007262625062407640
            HEX   17007C507E487C62500471664C73464C
            HEX   5C58734C404346587340505171664000
            HEX   607C5E507C406A401700605262486062
            HEX   52047F664C73464C5C58734C40434658
            HEX   73405871716640006060425860406240
            HEX   17005E4C5C585E624C047F477C71664C
            HEX   7E5F734640437E5F73705F7379634300
            HEX   605E565C5E4062401700404040404040
            HEX   40047E477C71664C7E5F734640437E4F
            HEX   63705F737963430040405C4040404040
            HEX   17004040404050404004404040404040
            HEX   40404040404040404040404040404000
            HEX   42404040504040401700404040405040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004240404050404040
            HEX   17007E5E407C50625E04404040404040
            HEX   40404040404040404040404040404000
            HEX   5E7E407C50625E401700626040625062
            HEX   60044040404040404040404040404040
            HEX   40404040404040007662406250626040
            HEX   17007C7E406650667E04404040404040
            HEX   40404040404040404040404040404000
            HEX   627C406650667E4017006042407C586A
            HEX   42044040404040404040404040404040
            HEX   40404040404040007660407C586A4240
            HEX   17005E7C40605C727C04404040404040
            HEX   40404040404040404040404040404000
            HEX   5E5E40605C727C401700404040604040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040406040404040
            HEX   170040404040404040044040407E4040
            HEX   50405040404040404240404040404000
            HEX   60404040404040401700484040404040
            HEX   40044040406A40405440504040404040
            HEX   42404040404040006040404040404040
            HEX   1700407E7E5E407E6C04404040485C62
            HEX   5840507E40625C6C5E7E407E5C6C4000
            HEX   7C7C6C5E627E6C4017004C6262604062
            HEX   72044040404872627040506240767272
            HEX   7662407072727E007642726262627240
            HEX   1700487C7C7E407C6204404040486266
            HEX   5040507C406A6262627C406062627E00
            HEX   627E6272667C60401700486060424060
            HEX   620440404048666A5240586040626662
            HEX   76604070666240007662625E6A606040
            HEX   1700585E5E7C405E62044040405C5C72
            HEX   4C405C5E40625C625E5E407E5C624000
            HEX   7C5C6242725E60401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404240404040
            HEX   17004050404048404004404040504050
            HEX   4860404040406050404042404C404000
            HEX   40504040404040401700405440444840
            HEX   48044040485440504860404040486050
            HEX   40404240524840004850404040404040
            HEX   17006C584040487C40046C7C40584050
            HEX   48685C6C6C407C507E405E7E50404000
            HEX   405040627C407C401700727040464042
            HEX   4C0472424C70405040747272724C7650
            HEX   624076625C4C40004C50407642406240
            HEX   170062504444407E4804627E48504050
            HEX   40626260604862507C40627C54484000
            HEX   485040547E4066401700625244444062
            HEX   48046262485240584062666060487658
            HEX   60407660504840004858404862407C40
            HEX   1700624C4864405C5804625C584C405C
            HEX   40625C6060587C5C5E405E5E50584000
            HEX   585C40485C40604017004040505C4040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404040406040
            HEX   17004040404040404004404048404050
            HEX   40404040405040404240405040404000
            HEX   4C404040404040401700404040404040
            HEX   40044040484040504040404040504040
            HEX   42404054404040005248404040404840
            HEX   17005E7C62627C5C7E045E62487C4050
            HEX   7C6C7E7E40507E405E5C7E587E626C00
            HEX   50406C7C6C7E40401700604262764262
            HEX   62046262404240504272706240506240
            HEX   76727070626272005C4C724272704C40
            HEX   17007E7E66547E5E7C047266407E4050
            HEX   7E62607C40507C40626260507C666000
            HEX   5448627E62604840170042626A486242
            HEX   60045E6A406240586262706040586040
            HEX   76667052606A60005048626262704840
            HEX   17007C5C72485C565E044272405C405C
            HEX   5C627E5E405C5E405E5C7E4C5E726000
            HEX   5058625C627E5840170040404040405C
            HEX   40044240404040404040404040404040
            HEX   40404040404040004040404040404040
            HEX   170040404042404050047E4040404040
            HEX   4060404042404C404040404040404000
            HEX   40404040404040401700404840424040
            HEX   54047240404840404060404042405240
            HEX   40404040484040004040404840404040
            HEX   17006240405E5C6C5804607E6C40625E
            HEX   40607C405E7E507E6C7E7E40406C4000
            HEX   7E6C62406C5C6C401700624C40767272
            HEX   70046462724C62604060424076625C62
            HEX   727062404C727E006272764C72727240
            HEX   17006648406262625004627C6248667E
            HEX   40627E40627C547C62607C4048627E00
            HEX   7C6254486062624017006A4840766662
            HEX   5204726062486A424C72624076605060
            HEX   62706040486240006062484860666240
            HEX   17007258405E5C624C047E5E6258727C
            HEX   4C7E5C405E5E505E627E5E4058624000
            HEX   5E624858605C62401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404040404040
            HEX   17004040404040404004504040404050
            HEX   40404040504040404042404040404000
            HEX   50487E40404040401700404048404040
            HEX   48045440404040544840404050404040
            HEX   40424044404040005048724040404040
            HEX   17007E6240405E624004587E6C6C7C58
            HEX   405C6C7C507E407C405E7E407C404000
            HEX   5048605E7C7C5C40170062764C406262
            HEX   4C047062727242704C72724250624042
            HEX   40766246424040005040786062426240
            HEX   17007C6A484072664804507C60627E50
            HEX   4862627E507C407E40627C447E404000
            HEX   5040607E667E5E401700606248405E6A
            HEX   48045260606262524866626258604062
            HEX   4076604462404000584072427C624240
            HEX   17005E625840427258044C5E60625C4C
            HEX   585C625C5C5E405C405E5E645C404000
            HEX   5C407E7C605C56401700404040404240
            HEX   40044040404040404040404040404040
            HEX   4040405C404040004040404060405C40
            HEX   17004040404040404004404040404040
            HEX   40404040404040404040404050404000
            HEX   585C5C5E407E40401700404040404040
            HEX   40044040404040404040404840404040
            HEX   40404040544040006862626240724040
            HEX   17005E407E7C5C7E5E047E6C625C627E
            HEX   405E62406C7E7E407C5C7E6C585E4000
            HEX   4862546040606C401700604070426262
            HEX   60046272767262624062624C72646240
            HEX   4262627270604000485E487C40787240
            HEX   17007E40607E5E7C7E047C625462547C
            HEX   4072664862487C407E5E7C62507E4000
            HEX   48425462406062401700424070624260
            HEX   4204606248664860405E6A4862526040
            HEX   6242606252424000486262624C726240
            HEX   17007C407E5C565E7C045E62485C485E
            HEX   40427258627E5E405C565E624C7C4000
            HEX   5C5C5C5C4C7E62401700404040405C40
            HEX   40044040404040404042404040404040
            HEX   405C4040404040004040404040404040
            HEX   17004040404248404004404040404050
            HEX   40404040404040404040404040404000
            HEX   40404040404040401700404040424840
            HEX   40044040404040544040484040404040
            HEX   40404040404040004040404040404040
            HEX   17006C5E405E48626C045E626C7E6C58
            HEX   6C7C406C7E5E407C5C626C407E5E4000
            HEX   7E626C5C7C7E7E401700726040764062
            HEX   720460627262727072424C7262604062
            HEX   7262724062607E006262727262626240
            HEX   1700627E4062406662047E66607C6250
            HEX   607E48627C7E4066626660407C7E7E00
            HEX   7C666062667C7C40170062424076406A
            HEX   6204426A60606252606248626042407C
            HEX   666A604060424000606A60667C606040
            HEX   1700627C405E407262047C72605E624C
            HEX   605C58625E7C40605C7260405E7C4000
            HEX   5E72605C605E5E401700404040404040
            HEX   40044040404040404040404040404060
            HEX   40404040404040004040404060404040
            HEX   17004C40405040404004404040404040
            HEX   4240404C404040404040406040404000
            HEX   50484040404040401700524040544840
            HEX   40044040404040404240405240484040
            HEX   40404060404040005048404040404040
            HEX   1700507C7E58405C6C045E7C627E6C40
            HEX   5E7E40507C406C7E407E7E685C624000
            HEX   50487C6C6C7E7E4017005C4270704C72
            HEX   72046042626272407662405C424C7262
            HEX   4062707472627E005040427272626240
            HEX   1700547E6050486262047E7E547C6040
            HEX   627C40547E48607C407C606262667E00
            HEX   50407E62627C7C401700506270524866
            HEX   62044262486060407660405062486060
            HEX   40607062666A40005840626262606040
            HEX   1700505C7E4C585C62047C5C485E6040
            HEX   5E5E40505C58605E405E7E625C724000
            HEX   5C405C62625E5E401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404040404040
            HEX   17004050404040404004404040404040
            HEX   42404040405040404040404040405000
            HEX   40404060504040401700405440404040
            HEX   40044040404040404240404040544040
            HEX   40484040404050004040406050404040
            HEX   17005E587E6C407C62047E6C407E7E40
            HEX   5E7E627E6C5840627C405E406C625000
            HEX   7E5C627C507E6C401700607062724042
            HEX   62046272407062407662766272704076
            HEX   424C6040726250007072767650627240
            HEX   17007E507C60407E66047C6040607C40
            HEX   627C6A7C6250446A7E487E4062665000
            HEX   60626A62507C60401700425260604062
            HEX   6A046060407060407660626062524462
            HEX   62484240626A58007066627658606040
            HEX   17007C4C5E60405C72045E60407E5E40
            HEX   5E5E625E624C48625C587C4062725C00
            HEX   7E5C627C5C5E60401700404040404040
            HEX   40044040404040404040404040405040
            HEX   40404040404040004040404040404040
            HEX   17004040404040404004404840405040
            HEX   404040404040407E4040404040404000
            HEX   42484040404040401700404040404840
            HEX   40044048404054404040404040404072
            HEX   40404840404040004248404040404040
            HEX   17007E7E406C407E6C046C487E5E5840
            HEX   6C7E627E6C6240607E6C40625E404000
            HEX   5E487E7E625E40401700626440724C62
            HEX   72047240626070407262766272624064
            HEX   62724C62604040007640627062604040
            HEX   17007C484060487C620462407C7E5040
            HEX   607C547C626640627C6248667E404000
            HEX   62407C60667E40401700605240604860
            HEX   620462406042524060604860626A4C72
            HEX   6062486A42404000764060706A424040
            HEX   17005E7E4060585E620462405E7C4C40
            HEX   605E485E62724C7E5E6258727C404000
            HEX   5E405E7E727C40401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404040404040
            HEX   17004040404050405004404050405048
            HEX   60404040404050404040504040404000
            HEX   40404040504840401700404040405440
            HEX   50044040544050486040404040405040
            HEX   40405040404040004040404050484040
            HEX   17007E40627E587C50047E5E58405048
            HEX   685C62627E40507E407C50625E404000
            HEX   5E627E4050487E401700624076627042
            HEX   50046260704050407472767662405062
            HEX   40625062604040006262624050406240
            HEX   17007C406A7C507E50047C7E50405040
            HEX   62626A6A7C40507C406650667E404000
            HEX   72667C4050407C401700604062605262
            HEX   58046042524058406266626260405860
            HEX   407C586A424040005E6A604058406040
            HEX   17005E40625E4C5C5C045E7C4C405C40
            HEX   625C62625E405C5E40605C727C404000
            HEX   42725E405C405E401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40604040404040004240404040404040
            HEX   17004040405040404004404050404040
            HEX   40504050404040504040404240404000
            HEX   42404050404040401700404048544040
            HEX   40044040504840404054405040404050
            HEX   40404042404040004240405040404040
            HEX   17006C5C40585E407C04627C50406C40
            HEX   7E5840507E407C50625E405E7C6C4000
            HEX   5E7E40507C407C40170072724C706040
            HEX   42047642504C72406270405062406250
            HEX   6260407642727E007662405042406240
            HEX   1700606248507E407E046A7E50486240
            HEX   7C5040507C406650667E40627E627E00
            HEX   627C40507E4066401700606648524240
            HEX   62046262584862406052405860407C58
            HEX   6A424076626240007660405862407C40
            HEX   1700605C584C7C405C04625C5C586240
            HEX   5E4C405C5E40605C727C405E5C624000
            HEX   5E5E405C5C4060401700404040404040
            HEX   40044040404040404040404040406040
            HEX   40404040404040004040404040406040
            HEX   17004040404050404004404040404040
            HEX   40404840405040404040404040404000
            HEX   40404040404040401700404048405040
            HEX   48044040404040404040484040544040
            HEX   40404040404048004440484040404040
            HEX   1700625C4040506240045C7E6C7E6262
            HEX   407E487E5E58407C5C626C5E625C4000
            HEX   4062406C407E5E40170062724C405062
            HEX   4C046262726262764070406260704062
            HEX   7262726262724C0046624C7240626040
            HEX   170066624844506648045E7C607C6648
            HEX   4460407C7E5040666266607266624800
            HEX   44664862447C7E4017006A664844586A
            HEX   4804426060606A76447040604252407C
            HEX   666A605E6A664800446A486244604240
            HEX   1700725C58485C725804565E605E7262
            HEX   487E405E7C4C40605C726042725C5800
            HEX   64725862485E7C401700404040504040
            HEX   40045C40404040405040404040404060
            HEX   40404042404040005C40404050404040
            HEX   170040405C5040404004404040404040
            HEX   40406040404060404040405040404000
            HEX   4040404040424040170040405C504040
            HEX   40044040404040404040604040406040
            HEX   40404050404040004040404048424040
            HEX   17004040485040627E046C5C625E406C
            HEX   7E7E687E6C7E685C6C5E40507C404000
            HEX   7E5C6C5E405E7E401700404048504076
            HEX   62047272626040726270746272707472
            HEX   7260405042404000707272604C766240
            HEX   170040404850406A7C046262667E4060
            HEX   7C60627C60606262627E40507E404000
            HEX   6062627E48627C4017004C4C5C584062
            HEX   600462666A4240606070626060706266
            HEX   62424058624040007066624248766040
            HEX   17004C4C5C5C40625E04625C727C4060
            HEX   5E7E625E607E625C627C405C5C404000
            HEX   7E5C627C585E5E401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040004040404040404040
            HEX   17004040405040424004404040404040
            HEX   40404040404040404040405040404000
            HEX   40404040404040401700404048544042
            HEX   40044040404040404040404040484040
            HEX   40404854404040004040484040404040
            HEX   17007C5C4058405E7E047C7E6C5E5C6C
            HEX   6C7E405E6240407C627C405840404000
            HEX   625C405E407C7C40170042624C704076
            HEX   620462627260727272624062624C4042
            HEX   76424C704040400076724C6040426240
            HEX   17007E5E485040627C04667C607E6262
            HEX   627C40726648407E547E485040404000
            HEX   6A62487E407E66401700624248524076
            HEX   60047C60604266626260405E6A484062
            HEX   48624852404040006266484240627C40
            HEX   17005C56584C405E5E04605E607C5C62
            HEX   625E40427258405C485C584C40404000
            HEX   625C587C405C60401700405C40404040
            HEX   40046040404040404040404240404040
            HEX   40404040404040004040404040406040
            HEX   17004040404050404004504040404040
            HEX   60404042404040404040504040404000
            HEX   40404060504040401700404040405040
            HEX   40045440484040406040404240404040
            HEX   40405440404040004040406050404040
            HEX   17006C7E5E40507E5E04586C405C627C
            HEX   687E405E7E405E5C6C40586C5C7C4000
            HEX   7C6C5C7C507E62401700726260405062
            HEX   600470724C7276627462407662406072
            HEX   72407072726240006272727650627640
            HEX   1700627C7E40507C7E04506048626A66
            HEX   627C40627C407E626240506062664000
            HEX   66606262507C6A401700626042405860
            HEX   420452604866627C6260407660404266
            HEX   62405260667C40007C60667658606240
            HEX   1700625E7C405C5E7C044C60585C6260
            HEX   625E405E5E407C5C62404C605C604000
            HEX   60605C7C5C5E62401700404040404040
            HEX   40044040404040604040404040404040
            HEX   40404040406040006040404040404040
            HEX   17004050405040404004404050406040
            HEX   40404040404040404040404040404000
            HEX   40405040504040401700405448504040
            HEX   40044040504060404040404040404840
            HEX   40404040404040004040504854484040
            HEX   17007E5840507E5E40047E7E507E7C6C
            HEX   7E40627C6C5C406C4040404040404000
            HEX   7C5C504058405E40170070704C506260
            HEX   40047062506276726240764272724C72
            HEX   40404040404040006272504C704C6240
            HEX   1700605048507C7E4004607C507C6260
            HEX   7C406A7E626248604040404040404000
            HEX   66625048504872401700705248586042
            HEX   4C047060586076606040626262664860
            HEX   4C404040404040007C66584852485E40
            HEX   17007E4C585C5E7C4C047E5E5C5E7C60
            HEX   5E40625C625C58604C40404040404000
            HEX   605C5C584C5842401700404040404040
            HEX   40044040404040404040404040404040
            HEX   40404040404040006040404040404240
            HEX   1700323530204124283135293D22726F
            HEX   6974732061206D616C696E206574206C
            HEX   6520706C75732064170072616E636169
            HEX   7304202020506F7572206C2748756D61
            HEX   6E6974652C202000636F6D6D756E6120
            HEX   17006E69717565733F04666169746573
            HEX   2D766F757320636F6E6E616974726500
            HEX   73756363657320201700202020202020
            HEX   20202020202020202020202020202020
            HEX   20202020202020202020202020202020
            HEX   55555555555555555555555555555555
            HEX   55555555555555555555234246444655
