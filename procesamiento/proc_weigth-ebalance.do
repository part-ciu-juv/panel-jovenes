***********************************
* Fecha: Marzo 2022             *
* Topico: generacion ponderadores *
***********************************

* ssc install ebalance , replace all // Correr 1 vez si no está instalado

clear
cd "C:\Users\Julio\Dropbox\papers\panel-jovenes"
use "input\data\original\Ola_1.dta" 


 
* Sexo: 1=hombre, 2=mujer
*****************
* Poblacion
	* Hombre: 0.496 
	* Mujer: 0.504

codebook cs_01, m
gen sexoWM=0
replace sexoWM=1 if cs_01==2
replace sexoWM=. if cs_01==.

gen sexoWH=0
replace sexoWH=1 if cs_01==1
replace sexoWH=. if cs_01==.

tab sexoWM,m	
tab sexoWH,m		
	
* Edad
************
	* 1: 18-20
	* 2: 21-25
	* 3: 26-30
	
* Poblacion:
	* 1: 0.215
	* 2: 0.400
	* 3: 0.385
	
tab cs_03,m
gen edadW=.
replace edadW=1 if cs_03 <= 20 // 18 a 20
replace edadW=2 if cs_03 > 21 & cs_03 < 25 // 21 a 25
replace edadW=3 if cs_03 >= 26 // 26 a 30		

tabulate edadW, gen(edadWb)

tab1 edadWb*,m


* Educacion
************
	* 1: no estudio
	* 2: basica incompleta
	* 3: basica completa
	* 4: media incompleta
	* 5: media completa
	* 6: superior no universitaria incompleta
	* 7: superior no universitaria completa
	* 8: universitaria incompleta
	* 9: universitaria completa
	* 10: Postgrado
	
* "Básica completa o menos" = 0.057              
* "Educación media o menos" = 0.43
* "Educación Técnica Superior Incompleta" = 0.084
* "Educación Técnica Superior Completa" = 0.071
* "Profesional Incompleta" = 0.235               
* "Profesional Completa o más" = 0.122      	
	
codebook cs_02	
gen educ=.
replace educ=1 if cs_02 < 3 // Básica completa o menos
replace educ=2 if cs_02 >= 4 & cs_02 <= 5 // Educación media o menos
replace educ=3 if cs_02 == 6 // Educación Técnica Superior Incompleta
replace educ=4 if cs_02 == 7 // Educación Técnica Superior Completa
replace educ=5 if cs_02 == 8 // Profesional Incompleta
replace educ=6 if cs_02 >= 9 & cs_02 <= 10 // Profesional Completa o más		

tab educ,m
tab cs_02 educ,m	
tabulate educ, gen(educb)	
		
tab1 educb*,m	
	

* Generacion de weights 
************************************
* Note que se omite una categoria por colinealidad

ebalance sexoWH	///
edadWb2 edadWb3 ///
educb2 educb3 educb4 educb5 educb6, ///
manualtargets(0.496 0.400 0.385 0.43 0.084 0.071 0.235 0.122)	
                     
* Sexo
tab cs_01
tab cs_01[aw=_webal]

* Edad
tab edadW
tab edadW [aw=_webal]

* Educ
tab educ
tab educ [aw=_webal]
	
rename _webal weight_w01

* Eliminar variables
keep ticket weight

save "input\data\proc\weight_w01.dta", replace
