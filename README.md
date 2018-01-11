# Aggiunta 955 a un record MARC21

## 0. Prerequisito
Installare yaz (dipende dalle versioni Linux es sudo apt-get install yaz)

## 2.
La cartella principale deve contenere
- _99999.sh_ programma principale: mette assieme un record MARC21 (formato ISO 2709) e un .csv contenente le annate di un periodico; crea un record MARC21XML valido 
- _crea955.php_  chiamato da _99999.sh_ per la creazione delle etichette 955 MARC21 con i dati del file _.csv_
- _valida.php_ chiamato da _99999.sh_ per la validazione finale del formato xml del record MARC21XML creato

## 3.
La sottodirectory _./dati_  è obbligatoria e contiene:
* il file _testata.txt_ (non va cancellato) e serve a comporre la prima riga del file xml relativo al record MARC21XML creato (si assume che tutta la codifica sia in UTF-8)
* un file _.csv_ di esempio _BVE0443169.csv_
* un file di esempio del risultato finale  _BVE0443169.marc21.xml_
* note:
	* In questa directory vengono inseriti i file in formato _.csv_ con la consistenza dei periodici che si 
desidera codificare in MARC21 : il file *deve* avere come separatore la virgola, si deve chiamare _[BID].csv_ e
deve avere gli stessi campi del file di esempio _BVE0443169.csv_. 
	* In questa directory si troveranno anche i risultati finali creati dal programma _99999.sh_ con la nomenclatura _[BID].marc21.xml_

## 4.
lanciare l'elaborazione con _./99999.sh [bid]_  (il parametro è costituito dal solo BID: es _./99999.sh BVE0443169_ ). Il file in formato MARC21 viene
catturato automaticamente dall'[Indice SBN (OPAC)](http://opac.sbn.it).

## 5.
se non vi sono errori di elaborazione verrà creato nella sottodirectory dati un file _[BID].marc21.xml_ per ogni lancio del programma principale _./99999.sh [bid]_
con tutti i dati richiesti dal progetto Google Books




_versione 2.1 del 09/01/2017_
 










