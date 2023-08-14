*
* Tout a disparu
*
* (c) 1992, Fran�ois Coulon
* (c) 2022, Antoine Vignau & Olivier Zardini
*

	mx	%00

*-----------------------
* LES VARIABLES
*-----------------------

DEBUT_DATA	=	*	; C'est vachement pratique pour tout effacer !

*--- Variables Apple IIgs

nbTEXTES	ds	2
nbTEXTES2	ds	2	; nombre de textes indiqu� dans le fichier .TEX

tblTEXTES	ds	4*NB_TEXTES

*--- Pour la sauvegarde

C1	ds	1
P	ds	1

*--- Variables Atari ST

aventure	ds	2
nombre_scenes ds	2
scene_actuelle ds	2
scene_nouvelle ds	2
deplacement	ds	2	; BOOL - TRUE (new scene) or FALSE (same scene)
numero_mot	ds	2	; WORD
mot	ds	128	; le mot � chercher (jusqu'au caract�re espace)
option_mot	ds	128	; le mot est enregistr� s'il est dans la liste
image_chargee ds	2	; WORD - TRUE or FALSE
escape	ds	2	; BOOL - TRUE or FALSE
fgSUITEFORCEE ds	2	; BOOL - TRUE or FALSE

* Le texte � afficher

texte	ds	max_colonnes*max_lignes	; the text from the .TXT file
texte_final	ds	max_colonnes*max_lignes	; the final text - known as b$ in Atari ST
	ds	2

* Toujours en d�cal� : index 1 d�marre � 0 (NB_TEXTES est toujours > au nombre de sc�nes)

	asc	"SUITE_DATA"
SUITE_DATA	=	*	; C'est vachement pratique pour tout effacer (encore) !

	asc	"FONCTION_MOTS"
fonction_mots ds	NB_TEXTES*NB_MOTS*2	; PNTR - mots qui vont "r�agir"
	asc	"AIGUILLAGE"
aiguillage	ds	NB_TEXTES*NB_MOTS	; BYTE - scene correspondant au mot
	asc	"CONDITION"
condition	ds	NB_TEXTES*NB_MOTS*2	; WORD - scene devant avoir ete vue (ou non si n�gatif)
	asc	"POINTEUR_MOTS"
pointeur_mots ds	NB_TEXTES		; BYTE - nombre de mots pour chaque scene
	asc	"SCENE_VISITEE"
scene_visitee ds	NB_TEXTES		; BOOL - le joueur est-il pass� par cette sc�ne ?
	asc	"PHRASE"
phrase	ds	NB_TEXTES*NB_MOTS*2	; PNTR - phrases explicatives de chaque mot
	asc	"IMAGE_A_CHARGER"
image_a_charger ds	NB_TEXTES*2		; PNTR - nom des fichiers image � charger � chaque sc�ne
	asc	"ROUGE1"
rouge1	ds	NB_TEXTES		; les composants RVB pour le fond
	asc	"VERT1"
vert1	ds	NB_TEXTES
	asc	"BLEU1"
bleu1	ds	NB_TEXTES
	asc	"ROUGE2"
rouge2	ds	NB_TEXTES
	asc	"VERT2"
vert2	ds	NB_TEXTES
	asc	"BLEU2"
bleu2	ds	NB_TEXTES
	asc	"FIN_DATA"
FIN_DATA	=	*	; Ben, ouais !

	ds	2	; padding, we never know :-)

