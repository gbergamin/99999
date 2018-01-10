#!/bin/bash -eu
wget -O./dati/${1}.marc21.mrc 'http://opac.sbn.it/opacsbn/opaclib?db=solr_iccu&select_db=solr_iccu&nentries=1&from=1&searchForm=opac/iccu/error.jsp&resultForward=opac/iccu/scarico_marc21.jsp&do_cmd=search_show_cmd&format=usmarc&rpnlabel=+Identificativo+SBN+%3D+'${1}'+%28parole+in+AND%29+&rpnquery=%40attrset+bib-1++%40attr+1%3D1032+%40attr+4%3D6+"'${1}'"&totalResult=1&fname=none'
yaz-marcdump -i marc -o line ./dati/${1}.marc21.mrc > ./dati/${1}.line
php crea955.php ./dati/${1}.csv > ./dati/${1}.955.line
cat ./dati/${1}.line ./dati/${1}.955.line > ./dati/${1}.marc21.line
 sed -i '/^$/d' ./dati/${1}.marc21.line
yaz-marcdump -i line -o marcxml ./dati/${1}.marc21.line > ./dati/${1}.marc21.xml 
mv ./dati/${1}.marc21.xml ./dati/${1}.marc21.xml.temp
cat ./dati/testata.txt ./dati/${1}.marc21.xml.temp >./dati/${1}.marc21.xml
sed -i -e 's#<collection xmlns="http://www.loc.gov/MARC21/slim">#<marc:collection xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:marc="http://www.loc.gov/MARC21/slim" xsi:schemaLocation="http://www.loc.gov/MARC21/slim http://www.loc.gov/standards/marcxml/schema/MARC21slim.xsd">#g' ./dati/${1}.marc21.xml
sed -i -e 's#</collection>#</marc:collection>#g' ./dati/${1}.marc21.xml
sed -i -e 's#record>#marc:record>#g' ./dati/${1}.marc21.xml
sed -i -e 's#leader>#marc:leader>#g' ./dati/${1}.marc21.xml
sed -i -e 's#controlfield>#marc:controlfield>#g' ./dati/${1}.marc21.xml
sed -i -e 's#<controlfield#<marc:controlfield#g' ./dati/${1}.marc21.xml
sed -i -e 's#datafield>#marc:datafield>#g' ./dati/${1}.marc21.xml
sed -i -e 's#<datafield#<marc:datafield#g' ./dati/${1}.marc21.xml
sed -i -e 's#subfield>#marc:subfield>#g' ./dati/${1}.marc21.xml
sed -i -e 's#<subfield#<marc:subfield#g' ./dati/${1}.marc21.xml

php valida.php ./dati/${1}.marc21.xml
rm  ./dati/*.temp ./dati/*.mrc ./dati/*.line 

#versione 2.1 del 9.1.2017







