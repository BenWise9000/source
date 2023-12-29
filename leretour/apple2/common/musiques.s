*
* Le retour du Dr Genius
*
* (c) 1983, Loriciels
* (c) 2023, Brutal Deluxe Software (Apple II)
*

	mx	%11
	lst	off

*-----------------------------------
* PLAYMUSIC
*-----------------------------------

playMUSIC
	sty	$1e
	stx	$1f

	LDA	#$01
	STA	$09
	STA	$1D
	PHA
	PHA
	PHA
	BNE	LA04D
LA038	INY
	LDA	($1E),Y
	STA	$09
	INY
	LDA	($1E),Y
	STA	$1D
LA042	LDA	$1E
	CLC	
	ADC	#$03
	STA	$1E
	BCC	LA04D
	INC	$1F
LA04D	LDY	#$00
	LDA	($1E),Y
	CMP	#$01
	BEQ	LA038
	BCS	LA067
	PLA
	PLA
	PLA
LA05A	LDX	#$49
	INY
	LDA	($1E),Y
	BNE	LA063
	LDX	#$C9
LA063	BIT	KBDSTROBE
	RTS	

LA067       STA   $08
            JSR   LA05A
            STX   LA0B6
            STA   $06
            LDX   $09
LA073       LSR
            DEX
            BNE   LA073
            STA   LA0AE+1
            JSR   LA05A
            STX   LA0EE
            STA   $07
            LDX   $1D
LA084       LSR
            DEX
            BNE   LA084
            STA   LA0E6+1
*
            PLA
            TAY
            PLA
            TAX
            PLA
            BNE   LA098
LA095       BIT   SPKR
LA098       CMP   #$00
            BMI   LA09F
            NOP
            BPL   LA0A2
LA09F       BIT   SPKR
LA0A2       STA   $4E
            BIT   KBD
            BMI   LA063
            DEY
            BNE   LA0AE
            BEQ   LA0B4
LA0AE       CPY   #$36
            BEQ   LA0B6
            BNE   LA0B8
LA0B4       LDY   $06
LA0B6       EOR   #$40
LA0B8       BIT   $4E
            BVC   LA0C3
            BVS   LA0BE
LA0BE       BPL   LA0C9
            NOP
            BMI   LA0CC
LA0C3       NOP
            BMI   LA0C9
            NOP
            BPL   LA0CC
LA0C9       CMP   SPKR
LA0CC       DEC   $4F
            BNE   LA0E1
            DEC   $08
            BNE   LA0E1
            BVC   LA0D9
            BIT   SPKR
LA0D9       PHA
            TXA
            PHA
            TYA
            PHA
            JMP   LA042

LA0E1       DEX
            BNE   LA0E6
            BEQ   LA0EC
LA0E6       CPX   #$0C
            BEQ   LA0EE
            BNE   LA0F0
LA0EC       LDX   $07
LA0EE       EOR   #$80
LA0F0       BVS   LA095
            NOP
            BVC   LA098
            NOP

*--- End of player
 
*--- INTRODUCTION (Prelude)

zikINTRODUCTION
	hex	0C80000C2B800C19800C1C800C19400C 
	hex	2B400C19560C2B560C80000C2B800C19 
	hex	800C1C800C19400C2B400C19560C2B56 
	hex	0102020C80000C26800C18800C19800C 
	hex	18390C26390C18400C26400C80000C26 
	hex	800C18800C19800C18440C26440C1840 
	hex	0C26400103030C80000C22800C18800C 
	hex	19800C18390C22390C18560C22560C80 
	hex	000C22800C18800C19800C18560C2256 
	hex	0C18390C22390102020C80000C20800C 
	hex	19800C1C800C19560C20560C19560C20 
	hex	560C4C000C204C0C194C0C1C4C0C1944 
	hex	0C20440C19440C20440101010C80000C 
	hex	26800C19800C1C800C19400C20400C22 
	hex	400C20400C26390C20390C22390C2039 
	hex	0C33000C2B330C2D330C33000102020C 
	hex	2D000C202D0C1C330C20330C1C390C20 
	hex	390C1C400C20400C44000C20440C1C4C 
	hex	0C204C0C1C560C20560C1C600C206001 
	hex	01010C22560C1C560C15560C16560C15 
	hex	560C1C560C20000C1C000C22560C1C56 
	hex	0C20560C1C560C2B560C22560C26000C 
	hex	2B000102020C4C000C334C0C204C0C22 
	hex	4C0C204C0C334C0C204C0C334C0C5600 
	hex	0C33560C20560C22560C204C0C334C0C 
	hex	20560C33560103030C4C000C264C0C2B 
	hex	4C0C264C0C2B000C2D000C33000C3900 
	hex	0C20720C22720C26720C15000C16000C 
	hex	19000C1C000C20000102020C22560C26 
	hex	560C2B560C15560C1C560C15560C2200 
	hex	0C1C000C2B560C26560C22560C1C560C 
	hex	20560C22560C26000C2B000101010C1E 
	hex	560C2B560C24560C26560C243C0C2B3C 
	hex	0C1E330C2B330C19560C2B560C24560C 
	hex	26560C243C0C2B3C0C1E330C2B330102 
	hex	020C60000C26600C1C600C19600C1860 
	hex	0C1C600C26600C2B600C30000C26300C 
	hex	1C330C19330C18390C1C390C22720C26 
	hex	720103030C28660C22660C28660C2266 
	hex	0C1C300C22300C1C330C22330C28390C 
	hex	22390C28390C22390C1C400C22400C1C 
	hex	440C22440102020C204C0C224C0C2633 
	hex	0C20330C22300C20300C1C300C22300C 
	hex	204C0C224C0C264C0C2B4C0C30000C33 
	hex	000C39000C40000101010C44000C3044 
	hex	0C2B440C30440C2B440C30440C2B000C 
	hex	30000102020C72000C30720C2B720C30 
	hex	720C2B720C30720C2B000C3000010101 
	hex	0C40000C33400C24400C26400C24800C 
	hex	33800C24800C33800102020C40000C33 
	hex	400C24400C26400C24800C33800C2480 
	hex	0C33800103030C40000C30400C26400C 
	hex	2B400C26800C30800C26800C30800102 
	hex	020C40000C30400C26400C2B400C2680 
	hex	0C30800C26800C30800103030C40000C 
	hex	22400C18400C19400C18800C22800C18 
	hex	800C22800102020C40000C22400C1840 
	hex	0C19400C18800C22800C18800C228001 
	hex	01010C40000C2B400C19400C1C400C19 
	hex	800C20800C22800C26800C2B800C3080 
	hex	0C33800C39800C40000C44000C4C000C 
	hex	56000102020C5A000C395A0C265A0C22 
	hex	5A0C205A0C265A0C22000C2000010401 
	hex	0101010C5A000C395A0C265A0C225A0C 
	hex	205A0C265A0C22000C20000102020C60 
	hex	000C39600C2B600C26600C22600C2B60 
	hex	0C26000C22000103030C60000C39600C 
	hex	2B600C26600C22600C2B600C26000C22 
	hex	000101010C60000C39600C2B300C2230 
	hex	0C1C300C16300C15560102020C15000C 
	hex	39000C33000C2D000C2B000C26000C22 
	hex	000C20000103030C1C560C22560C2B56 
	hex	0C26560C22560C20560C1C000C190001 
	hex	02020C18560C1C560C22560C20560C1C 
	hex	560C19560C18000C15000103030C1422 
	hex	0C15220C16220C15220C15280C18280C 
	hex	19280C18280C182B0C1C2B0C222B0C26 
	hex	2B0C2B560C30560C33560C3056010202 
	hex	0C56000C39560C2B560C22560C1C560C 
	hex	19560C18000C1C000C19560C20560C2B 
	hex	560C30560C33560C40560C39000C3300 
	hex	0101010C56000C40560C33560C2B560C 
	hex	20560C1C560C19000C20000102020C16 
	hex	260C1B260C1C260C1B260C1B2D0C1C2D 
	hex	0C1E2D0C1C2D0C1C000C20000C22000C 
	hex	20000C20000C26000C2D000C33000C39 
	hex	000C2D390C26390C20390C1C400C1640 
	hex	0C15400C16400103030C15440C1C440C 
	hex	22440C26440C22660C1C660C2B660C22 
	hex	660102020C39000C2B390C2D390C3339 
	hex	0C395A0C405A0C445A0C4C5A0101010C 
	hex	00560C00560C184C0C194C0C1C440C20 
	hex	440C22400C26400C2B390C18390C1933 
	hex	0C1C330C20300C22300C26400C2B4001 
	hex	02020C304C0C194C0C1C4C0C204C0C22 
	hex	000C26000C2B000C30000C33500C1C50 
	hex	0C204C0C224C0C26440C28440C30800C 
	hex	33800103030C39600C20600C22600C26 
	hex	600C22560C1C560C2B440C1C440C2640 
	hex	0C1C400C22390C1C390C20330C1C330C 
	hex	262D0C1C2D0102020C22560C1C560C2B 
	hex	440C1C440C20330C1C330C262D0C1C2D 
	hex	0C22560C1C560C2B440C1C440C20330C 
	hex	1C330C262D0C1C2D0101010C22560C1C 
	hex	560C2B2B0C1C2B0C26260C1C260C2222 
	hex	0C1C220C20200C1C200C1C1C0C1C000C 
	hex	19190C1C190C2B2B0C1C2B0102020C1C 
	hex	1C0C1C000C19190C1C190C18180C1C18 
	hex	0C2B2B0C1C2B0C19190C1C190C18180C 
	hex	1C180C15150C1C150C19190C1C190103 
	hex	030C18180C1C180C19190C1C190C1818 
	hex	0C1C180C1C1C0C1C000C19190C1C190C 
	hex	1C1C0C1C000C19190C1C190C20200C1C 
	hex	200102020C1C1C0C1C000C20200C1C20 
	hex	0C1C1C0C1C000C22220C1C220C20200C 
	hex	1C200C22220C1C220C20200C1C200C26 
	hex	260C1C260101010C22220C1C220C2B2B 
	hex	0C262B0102020C243C0C24560C22390C 
	hex	22560C20360C20560C1E330C1E560C1C 
	hex	300C1C560C1B2D0103030C1B560C192B 
	hex	0C19560C18280C18560C16260C16560C 
	hex	15240C15560C14220C14560C13200C13 
	hex	560C121E0C12560C111C0C1156010101 
	hex	0C10560C19560C2B560C19560C102B0C 
	hex	192B0C102B0C192B0103030C10560C19 
	hex	560C2B560C19560C102B0C192B0C102B 
	hex	0C192B0101010C10560C1C560C2B560C 
	hex	1C560C102B0C1C2B0C102B0C1C2B0103 
	hex	030C10560C1C560C2B560C1C560C102B 
	hex	0C1C2B0C102B0C1C2B0101010C11560C 
	hex	1C560C2B560C1C560C11300C1C300C11 
	hex	300C1C300102020C11560C1C560C2B56 
	hex	0C1C560C11300C1C300C11560C1C5630 
	hex	1040FFFFFE00FFFE1000000000000000 
	hex	00000000000000000000000000000000 

*--- GAGNE (Air)

zikGAGNE
	hex	01020308000008306008306008306020 
	hex	3C7808000008366C08366C08366C4040 
	hex	80080000083000083000083000083C90 
	hex	082D90082D90082D90083090081E9008 
	hex	1E90081E901824900824900824900830 
	hex	90083090083090084098082D98082D98 
	hex	082D98083098081B98081B98081B9818 
	hex	2098082098082098081898081898081B 
	hex	98081E00081E78081E78081E6C082060 
	hex	081860081860081B60081E00081E7808 
	hex	1E78081E6C082060081860081860081B 
	hex	60101E60100000102478100000201880 
	hex	080000082D5A082D5A082D5A601B6C08 
	hex	0000082D00082D00082D000836400836 
	hex	4008364008364C08365A08365A08365A 
	hex	0836600836C00836C00836C0083C6008 
	hex	2D00082D00082D000836000836400836 
	hex	4008364008364C08365A08365A08365A 
	hex	083660081BC0081BC0081BC0081E6008 
	hex	30000824000824001024D80824000824 
	hex	D80826D80826D80826000820001020D8 
	hex	0820000820D80824D80824D808240008 
	hex	1E00081E4C08204C062000040000061B 
	hex	00030000081B50081C50061C00040000 
	hex	061800030000081848081B48061B0004 
	hex	00000616000300000816480818480618 
	hex	00040000061400030000081448081648 
	hex	06160004000006120003000008125608 
	hex	13560613000400000610000400000812 
	hex	60080F60080F00080F60081260081860 
	hex	081800081860081E6008246008300008 
	hex	3060083C60084860084800084860084C 
	hex	6C080D6C08100008106C08136C08166C 
	hex	08180008186C08206C08266C08300008 
	hex	366C08406C084C6C0848000848000848 
	hex	56080F56080F00080F56081256081556 
	hex	081500081556081856081E56081E0008 
	hex	1E56082456082B56082B00082B562015 
	hex	56100000200000201450100000080000 
	hex	08280008280008280020003C20360020 
	hex	0050102850101E501020A0081E00081E 
	hex	A0101BA00824000824A01024F0082800 
	hex	0828F01028F0081E00081EF01020A008 
	hex	1E00081EA0101BA00824000824A01024 
	hex	F00828000828F01028F0081E00081EF0 
	hex	1020A0081E00081EA0101BA008240008 
	hex	24A01024F00828000828F01028C00824 
	hex	000824C01022E40824000824E41028D8 
	hex	0824000824D81028D8082B00082BD810 
	hex	22B4081E00081EB4101BC0081E00081E 
	hex	C01022E4081E00081EE41022B4082400 
	hex	0824B4101EB4081B00081BB41019AC08 
	hex	1B00081BAC101EAC081B00081BAC1019 
	hex	A0081B00081BA0101EA0101B00101998 
	hex	081B00081B98101E98101B0010199008 
	hex	1B00081B90101E90101B00101990081B 
	hex	00081B90101990101500101480081400 
	hex	0814800814F00612F00600000614F006 
	hex	00000618F00600000818F00818F0061B 
	hex	00060000061E00060000081ED80820D8 
	hex	062400060000062000060000081BC008 
	hex	1EC00628000600000630000600000820 
	hex	B40824B4062D00060000063600060000 
	hex	0824A00828A0063000060000063C0006 
	hex	00000800A00815A00814000815000814 
	hex	F00815F00814D80815D80614A0060000 
	hex	0612A006000006148006000006168006 
	hex	00000816F00818F0061BC0060000061E 
	hex	C0060000081ED80820D80624B4060000 
	hex	0620B4060000081BC0081EC00628A006 
	hex	00000630A00600000820B40824B4062D 
	hex	900600000636900600000824A00828A0 
	hex	061650060000061B500600000800A008 
	hex	28A0081450081450081E50080B30080B 
	hex	30080B30080F3C081450081450081450 
	hex	081860081E3C081E3C081E3C0828A008 
	hex	1B50081B50081B50081878080B30080B 
	hex	30080B30080F3C081450081450081450 
	hex	081860081E78081E78081E780828A008 
	hex	14500814500814501014501000000800 
	hex	00081450081450081450101450100000 
	hex	080000081050081050081050100F5010 
	hex	00002000004000000830600830600830 
	hex	60203C7808000008366C08366C08366C 
	hex	40408008000008300008300008300008 
	hex	3C90082D90082D90082D90083090081E 
	hex	90081E90081E90182490082490082490 
	hex	083090083090083090084098082D9808 
	hex	2D98082D98083098081B98081B98081B 
	hex	98182098082098082098081898081898 
	hex	081B98081E00081E78081E78081E6C08 
	hex	2060081860081860081B60081E00081E 
	hex	78081E78081E6C082060081860081860 
	hex	081B60101E6010000010247810000020 
	hex	188008000008165A08165A08165A601B 
	hex	6C080000082D00082D00082D00083640 
	hex	08364008364008364C08365A08365A08 
	hex	365A0836600836C00836C00836C0083C 
	hex	60082D00082D00082D00083600083640 
	hex	08364008364008364C08365A08365A08 
	hex	365A083660081BC0081BC0081BC0081E 
	hex	600830000824000824001024D8082400 
	hex	0824D80826D80826D808260008200010 
	hex	20D80820000820D80824D80824D80824 
	hex	00081E00081E4C08204C062000060000 
	hex	061B00060000081B50081C50061C0006 
	hex	0000061800060000081848081B48061B 
	hex	00060000061600060000081648081848 
	hex	06180006000006140006000008144808 
	hex	16480616000600000612000600000812 
	hex	56081356061300060000061000060000 
	hex	081260080F60080F00080F6008126008 
	hex	1860081800081860081E600824600830 
	hex	00083060083C60084860084800084860 
	hex	084C6C080D6C08100008106C08136C08 
	hex	166C08180008186C08206C08266C0830 
	hex	0008366C08406C084C6C084800084800 
	hex	08482D080F3C080F3C080F3C08124808 
	hex	1556081556081556081966081E78081E 
	hex	78081E78082490082BAC082BAC082BAC 
	hex	10339010000020000010309810000008 
	hex	0000083000083000083000083C90082D 
	hex	90082D90082D90083090081E90081E90 
	hex	081E9010249008249008249008309008 
	hex	3090083090083C90082D90082D90082D 
	hex	90083090081E90081E90081E90182490 
	hex	0824900824900820C00820C00820C010 
	hex	1E901000000800000820C00820C00820 
	hex	C0101EC01000000800000820C00820C0 
	hex	0820C0101ED81020C0101ED81020C010 
	hex	1ED81015C01014D81015C01014D81000 
	hex	001026C01000002024D80062C5000000 
	hex	00000000000000000000000000000000 

*--- PERDU (Beethoven's fifth)

zikPERDU
	hex	010303302B6C302B36302B39302B7230 
	hex	2B80302B40302B48302B90309FA00102 
	hex	0218205018285018304C18364C183998 
	hex	1836980C39900C36900C39900C369030 
	hex	39901840901848903048A00101013024 
	hex	AC302456302460302460180066010303 
	hex	182B66183C6618406618308018338018 
	hex	24801828800102023028601828601828 
	hex	6C182860182856182850182860182872 
	hex	01010118307218407218487218369018 
	hex	3990182890182B90302B6C302B36302B 
	hex	390102021826721824723036800C3640 
	hex	0C3040182B40182B4C18304C18306018 
	hex	36600103031839481840480C406C0C39 
	hex	6C18366C303660183960184060010101 
	hex	18489018488018487218486C18486018 
	hex	4850184856184860010303302B6C302B 
	hex	36302B39302B72302B80302B40302B48 
	hex	302B90309FA001020218205018285018 
	hex	304C18364C1839981836980C39900C36 
	hex	900C39900C3690303990184090184890 
	hex	3048A00101013024AC30245630246030 
	hex	2460180066010303182B66183C661840 
	hex	66183080183380182480182880010202 
	hex	30286018286018286C18286018285618 
	hex	28501828601828720101011830721840 
	hex	72184872183690183990182890182B90 
	hex	302B6C302B36302B3901020218267218 
	hex	24723036800C36400C3040182B40182B 
	hex	4C18304C183060183660010303183948 
	hex	1840480C406C0C396C18366C30366018 
	hex	3960184060010101C0488F3039903039 
	hex	481839500C36500C39500C40A00C39A0 
	hex	1848A01848AC1840AC303C56303C6030 
	hex	3C600102023040663020661800561824 
	hex	56182880182B80010303302860302860 
	hex	0C286C0C2B6C0C306C0C366C18396C18 
	hex	406C0102021844721840723039721839 
	hex	80183680303080010404183090182B90 
	hex	302880302872302B9001020218308018 
	hex	36801839501840500C39600C36601830 
	hex	60303656304080303F40304748308F90 
	hex	01010130369830364C183656182B5618 
	hex	30AC1836AC3020601820601820563020 
	hex	4C18246C18266C0103030C2B720C3072 
	hex	18247230487230406C1840600C39600C 
	hex	3660303990183948183F403048500101 
	hex	013048A03036AC303656303650182BA0 
	hex	1830A001020230309830304C30304818 
	hex	2890182B90010303302B88302B44302B 
	hex	40182480182880010404302860302830 
	hex	30283630286C01040430487230487218 
	hex	48901839901830721828720103031828 
	hex	6C182B6C302B6C302B78182B780C2878 
	hex	0C247801020230368030368018369018 
	hex	2B90182448181E480103033020503020 
	hex	50302056303656183960183060302860 
	hex	30286C30406C3048720102020C30900C 
	hex	2B9018289018286C182B6C182B501830 
	hex	500103030C36900C39901840901840A0 
	hex	1839A00C39900C36900C39900C369018 
	hex	39901836903036D8C0D7D80066B31000 
	hex	00000000000000000000000000000000 
