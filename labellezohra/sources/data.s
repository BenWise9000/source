*
* La Belle Zohra
*
* (c) 1992, Fran�ois Coulon
* (c) 2023, Antoine Vignau & Olivier Zardini
*

	mx    %00

*-----------------------
* ATARI
*-----------------------

*---

* Apple		Atari
* 22	"	7E
* 82	�	80
* 88	�	85
* 89	�	83
* 8D	�	87
* 8E	�	82
* 8F	�	8A
* 90	�	88
* 91	�	
* 94	�	8C
* 95	�	8B
* 99	�	93
* 9E	�	96
* 9D	�	97
* CE	OE	B4
* CF	oe	B5

tblATARI	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	606162636465666768696A6B6C6D6E6F
	hex	707172737475767778797A7B7C7D227F
	hex	82818E898488868D90898F95948D8E8F
	hex	9091929994959E9D98999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3CFCEB6B7B8B9BBBABCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

tblUPPER	hex	000102030405060708090A0B0C0D0E0F
	hex	101112131415161718191A1B1C1D1E1F
	hex	202122232425262728292A2B2C2D2E2F
	hex	303132333435363738393A3B3C3D3E3F
	hex	404142434445464748494A4B4C4D4E4F
	hex	505152535455565758595A5B5C5D5E5F
	hex	604142434445464748494A4B4C4D4E4F	; a-z => A-Z
	hex	505152535455565758595A7B7C7D7E7F
	hex	808182838485868788898A8B8C8D8E8F
	hex	909192939495969798999A9B9C9D9E9F
	hex	A0A1A2A3A4A5A6A7A8A9AAABACADAEAF
	hex	B0B1B2B3B4B5B6B7B8B9BABBBCBDBEBF
	hex	C0C1C2C3C4C5C6C7C8C9CACBCCCDCECF
	hex	D0D1D2D3D4D5D6D7D8D9DADBDCDDDEDF
	hex	E0E1E2E3E4E5E6E7E8E9EAEBECEDEEEF
	hex	F0F1F2F3F4F5F6F7F8F9FAFBFCFDFEFF

*-----------------------
* DATA
*-----------------------

DEBUT_DATA	=	*

nombre_indicateurs	=	30	; NOMBRE MAXI D'INDICATEURS
pointeur_indicateurs	=	0	; CLEAR DU NOMBRE D'INDICATEURS
nombre_paragraphes	=	110	; NOMBRE MAXI DE TEXTES
indicateur$		ds	nombre_indicateurs	; NOM DES INDICATEURS UTILISES PAR MOI
indicateur!		ds	nombre_indicateurs	; INDICATEUR EN LUI-MEME
paragraphe_lu	ds	nombre_paragraphes

indicateur_paragraphes%	ds	nombre_paragraphes	; NUMERO DE L'INDIC CR�E A CHAQUE TEXTE
indicateur_paragraphes_prealables%	ds	nombre_paragraphes ; NUMERO DE L'INDIC NECESSAIRE POUR LIRE CE TEXTE

* LOGO indicateur!(0)=TRUE                       !INDICATEUR VIRTUEL TOUJOURS POSITIF

*---

nombre_objets	=	8	; NOMBRE D'OBJETS
objet$	ds	nombre_objets	; !NOM DE CHAQUE OBJET

*---

nombre_peches	=	7	; NOMBRE DE PECHES
peche$	ds	nombre_peches+1	; NOM DE CHAQUE PECHE (+1 POUR L'INDIC SUITE...)

*---

icone_objets!	ds	nombre_objets	; ICONES ALLUM�ES OU ETEINTES
icone_peches!	ds	nombre_peches+1	; (+1 POUR L'INDICATEUR DE SUITE...)

icone_objets	ds	nombre_objets	; BLOCS GRAPHIQUES DES ICONES
icone_peches	ds	nombre_peches

objet_x	ds	nombre_objets	; COORDONN�ES DES ICONES DES OBJETS
objet_y	ds	nombre_objets
objet_xx	ds	nombre_objets
objet_yy	ds	nombre_objets

peche_x	ds	nombre_peches	; COORDONN�E DES ICONES DES PECHES
peche_y	ds	nombre_peches
peche_xx	ds	nombre_peches
peche_yy	ds	nombre_peches

*---

fenetre_x	ds	nombre_objets
fenetre_y	ds	nombre_objets
fenetre_xx	ds	nombre_objets
fenetre_yy	ds	nombre_objets

*---

fenetres
	dw	10,100,310,190
	dw	10,100,310,190
	dw	10,100,310,190
	dw	120,10,310,190
	dw	10,100,310,190
	dw	10,100,310,190
	dw	10,100,310,190
	dw	10,10,200,190
	dw	10,100,310,190

objets
	asc	"LUNETTES"
	asc	"CUILLERE"
	asc	"FLEUR"
	asc	"CARNET"
	asc	"DICO"
	asc	"BIJOUX"
	asc	"CLES"
	asc	"ARGENT"
	asc	"FIN"

peches
	asc	"ORGUEIL"
	asc	"AVARICE"
	asc	"GOURMANDISE"
	asc	"ENVIE"
	asc	"LUXURE"
	asc	"COLERE"
	asc	"PARESSE"
	asc	"suite"

coordonnees_objets
	dw	238,51,283,88
	dw	222,110,268,151
	dw	195,0,266,39
	dw	0,17,57,54
	dw	27,55,106,103
	dw	131,32,178,64
	dw	276,19,319,50
	dw	133,69,188,101

coordonnees_peches
	dw	184,162,227,199
	dw	0,162,43,199
	dw	46,162,89,199
	dw	276,162,319,199
	dw	92,162,135,199
	dw	138,162,181,199
	dw	230,162,273,199

*---

bloc_texte	ds	2000
*texte	ds	110000
mot	ds	128

*---

paragraphe	ds	nombre_paragraphes	; INDEX DE DES DEBUTS DES PARAGRAPHES
* LOGO paragraphe%(1)=0
pointeur_paragraphes	ds	2
paragraphes_lus	ds	2
reference_objet	ds	nombre_paragraphes	; NUMERO DE L'OBJET ASSOCIE A CHAQUE PARAGRAPHE
reference_peche	ds	nombre_paragraphes	; NUMERO DU PECHE ASSOCIE A CHAQUE PARAGRAPHE

*---

*  DATA 1cemonsi,7500,"ce monsieur!",""
*  DATA 1safemme,7500,"sa femme!",""
*  DATA 1lechame,7500,"le chameau!",""
*  DATA 1smala,7500,"et toute la smala!",""
*  DATA fx_batte,10000,"",""
*  DATA fx_flute,5000,"",""
*  DATA fx_synth,5000,"",""
*  DATA fx_tromp,7500,"",""
*  DATA fx_tromp,10000,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 2coinfli,7500,"des coins o�","les flics ne vont plus"
*  DATA 2kararab,7500,"y'a des quartiers arab'",""
*  DATA 2karbret,7500,"si c'�tait des quartiers bretons...",""
*  DATA 2gensnan,7500,"some people from Nanterre,","some people from Belleville!"
*  DATA fx_boing,5000,"",""
*  DATA fx_couic,5000,"",""
*  DATA fx_siren,5000,"",""
*  DATA fx_guita,5000,"",""
*  DATA fx_guita,7500,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 3BOPARLE,7500,"ces beaux-parleurs","de la t�l�vision?"
*  DATA 3FAITFRA,7500,"qu'est-ce qu'ils ont fait","pour la france?"
*  DATA 3PASMILI,7500,"les trois quarts du temps, y z'ont","pas fait leur service miliaire"
*  DATA 3UNPEUPE,7500,"y sont meme un peu p�d� sur les bords!",""
*  DATA fx_hey,7500,"hey hey hey!",""
*  DATA fx_cuivr,7500,"",""
*  DATA fx_dzoin,7500,"",""
*  DATA fx_dehem,7500,"",""
*  DATA fx_dehem,10000,"",""
*  DATA FIN,0,"",""
*  '
*  DATA 4algefra,7500,"nous n'�tions pas pour","l'alg�rie francaise"
*  DATA 4algesah,7500,"nous �tions pour l'alg�rie et","le sahara francais!"
*  DATA 4sousoff,7500,"les sous-off' de la coloniale,","dont j'�tais"
*  DATA FIN,0,"",""
*  '
*  DATA 5haine,7500,"qui a la haine de l'�tranger?",""
*  DATA 5terrfra,7500,"la terre de france, elle est","d'abord aux fran�ais"
*  DATA 5collabo,7500,"on nous parle des collabos,","y z'en ont fait moins"
*  DATA 5clepen,7500,"c'est Le Pen (de ch'val)",""
*  DATA 5antifra,7500,"est anti-fran�ais",""
*  DATA 5abrutis,7500,"nous sommes des a.....s",""
*  DATA fx_beat,7500,"",""
*  DATA fx_glin1,7500,"",""
*  DATA fx_glin2,7500,"",""
*  DATA FIN,0,"",""

FIN_DATA	=	*
