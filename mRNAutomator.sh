#!/bin/bash
#mRNAutomator by Isaac Moore
#02/08/12

#==FUNCTIONS==

#Function to calculate the mRNA sequence from the given DNA sequence
calcMRNA() {
mRNA=$(tr agtcAGTC UCAGUCAG <<< "$dna")
}

#Function to calculate the Amino Acid pair from the pre-calculated mRNA sequence
calcAminoAcid() {
case "$mRNA" in
UUU|UUC)
  aminoAcid="Phenylalanine"
  ;;
UUA|UUG)
  aminoAcid="Leucine"
  ;;
UC*|AGU|AGC)
  aminoAcid="Serine"
  ;;
UAU|UAC)
  aminoAcid="Tyrosine"
  ;;
UAA|UAG|UGA)
  aminoAcid="Stop Codon"
  ;;
UGU|UGC)
  aminoAcid="Cysteine"
  ;;
UGG)
  aminoAcid="Tryptophan"
  ;;
CU*)
  aminoAcid="Leucine"
  ;;
CC*)
  aminoAcid="Proline"
  ;;
CAU|CAC)
  aminoAcid="Histidine"
  ;;
CAA|CAG)
  aminoAcid="Glutamine"
  ;;
CG*|AGA|AGG)
  aminoAcid="Arginine"
  ;;
AUU|AUC|AUA)
  aminoAcid="Isoleucine"
  ;;
AUG)
  aminoAcid="Methionine"
  ;;
AC*)
  aminoAcid="Threonine"
  ;;
AAU|AAC)
  aminoAcid="Asparagine"
  ;;
AAA|AAG)
  aminoAcid="Lysine"
  ;;
GU*)
  aminoAcid="Valine"
  ;;
GC*)
  aminoAcid="Alanine"
  ;;
GAU|GAC)
  aminoAcid="Aspartic Acid"
  ;;
GAA|GAG)
  aminoAcid="Glutamic Acid"
  ;;
GG*)
  aminoAcid="Glycine"
  ;;
esac
}

#Function to calculate the tRNA sequence from the pre-calculated mRNA sequence
calcTRNA() {
tRNA=$(tr acgtT ACGUU <<< "$dna")
}


#==END FUNCTIONS==
echo "==mRNAutomator=="

#Request a DNA sequence and sanitize it
read -p "Please enter a DNA strand: " dna
length=${#dna}
if [ "$length" != "3" ]; then
	echo "Invalid sequence."
	exit 0
fi
calcMRNA
clear
echo "mRNA Sequence:" ${mRNA}
calcAminoAcid
echo "Amino Acid pair:" ${aminoAcid}
calcTRNA
echo "tRNA Sequence:" ${tRNA}
exit 1