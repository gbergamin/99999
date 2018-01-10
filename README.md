# Aggiunta 955 a un record MARC21

## 0. Prerequisito
Installare yaz (dipende dalle versioni Linux es sudo apt-get install yaz)

## 2.
La cartella principale deve contenere
- 99999.sh programma principale: mette assieme un record MARC21 (formato ISO 2709) e un .csv contenente le annate di un periodico; crea un record MARC21XML valido 
- crea955.php crezione delle etichette 955 dal csv
- valida.php validazione finale xml

## 3.
La sottodirectory ./dati  è obbligatoria e contiene:
* il file testata.txt (non va cancellato)
* un file csv di esempio BVE0443169.csv
* un file di esempio del risultato finale  BVE0443169.marc21.xml
* note:
	* In questa directory vengono inseriti i file in formato csv con la consistenza dei periodici che si 
desidera codificare in MARC21 : il file *deve* avere come separatore la virgola, si deve chiamare [BID].csv e
deve avere gli stessi campi del file di esempio BVE0443169.csv. 
	* In questa directory si troveranno anche i risultati finali creati dal programma 99999.sh [BID].marc21.xml

## 4.
lanciare l'elaborazione con ./99999.sh [bid]  (il parametro è costituito dal solo BID). Il file in formato MARC21 viene
catturato automaticamente dall'Indice SBN (OPAC)

## 5.
se non vi sono errori di elaborazione verrà creato nella sottodirectory dati un file [BID].marc21.xml 
con tutti i dati richiesti dal progetto Google Books




_versione 2.1 del 09/01/2017_
 










