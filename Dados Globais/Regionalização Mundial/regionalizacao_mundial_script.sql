/*DATABASE REGIONALIZAÇÃO MUNDIAL*/
/*Composição: 
ID (ÍNDICE)
CONTINENTE
PAÍS
COORDENADAS_GEOGRÁFICAS
DEMOGRAFIA_POPULACIONAL
IDIOMA_PRINCIPAL
MOEDA_PRINCIPAL
CÓD_MOEDA (((LEVANTAR CÓDIGO INTERNACIONAL DE CADA MOEDA LEVANTADA)))

*/

create database regionalizacao_mundial;
create table regionalizacao_mundial(
ID int not null auto_increment,
CONTINENTE varchar(15) not null,
PAÍS varchar(3) not null,
COORDENADAS_GEOGRÁFICAS varchar(100) not null,
DEMOGRAFIA_POPULACIONAL varchar(15) not null,
IDIOMA_PRINCIPAL varchar(20) not null,
MOEDA_PRINCIPAL varchar(30) not null,
primary key(ID)
) default charset = utf8mb4 ;

use regionalizacao_mundial;

select * from regionalizacao_mundial;
desc regionalizacao_mundial;

insert into regionalizacao_mundial values
/*ID, CONTINENTE, PAÍS, COORDENADAS_GEOGRÁFICAS, DEMOGRAFIA_POPULACIONAL, IDIOMA_PRINCIPAL, MOEDA_PRINCIPAL*/
(default, 'Oceania', 'Austrália', '', '', '', ''),
(default, 'Estados Federados da Micronésia', 'Austrália', '', '', '', ''),
(default, 'Oceania', 'Ilhas Marshal', '', '', '', ''),
(default, 'Oceania', 'Kiribati', '', '', '', ''),
(default, 'Oceania', 'Nauru', '', '', '', ''),
(default, 'Oceania', 'Nova Zelândia', '', '', '', ''),
(default, 'Oceania', 'Palau', '', '', '', ''),
(default, 'Oceania', 'Papua Nova Guiné', '', '', '', ''),
(default, 'Oceania', 'Samoa', '', '', '', ''),
(default, 'Oceania', 'Tonga', '', '', '', ''),
(default, 'Oceania', 'Tuvalu', '', '', '', ''),
(default, 'Oceania', 'Vanuatu', '', '', '', '');

update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-25.544522397872207, 134.47169863896622', DEMOGRAFIA_POPULACIONAL='25788000', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Dólar Australiano'
where PAÍS='Austrália';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='6.48297300172342, 158.67928817944346', DEMOGRAFIA_POPULACIONAL='114164', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Dólar Americano'
where PAÍS='Estados Federados da Micronési';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-17.835955969095036, 177.95299583034577', DEMOGRAFIA_POPULACIONAL='900000', IDIOMA_PRINCIPAL='Fijiano', MOEDA_PRINCIPAL='Fiji Dólar'
where PAÍS='Fiji';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='6.6860657413522375, 169.40834719309606', DEMOGRAFIA_POPULACIONAL='54439', IDIOMA_PRINCIPAL='Marshalês', MOEDA_PRINCIPAL='Dólar Americano'
where PAÍS='Ilhas MArshall';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-10.121691503693263, 160.3096877023847', DEMOGRAFIA_POPULACIONAL='690000', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Dólar'
where PAÍS='Ilhas Salomão';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='1.8669437220674463, -157.22539369564262', DEMOGRAFIA_POPULACIONAL='100835', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Dólar'
where PAÍS='Kiribati';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-0.5200790320592789, 166.93343547443706', DEMOGRAFIA_POPULACIONAL='9976', IDIOMA_PRINCIPAL='Nauruano', MOEDA_PRINCIPAL='Dólar Australiano'
where PAÍS='Nauru';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-42.76805753907618, 172.36634120052963', DEMOGRAFIA_POPULACIONAL='5100000', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Dólar Neozelandês'
where PAÍS='Nova Zelândia';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='7.441925506543992, 134.6106236026956', DEMOGRAFIA_POPULACIONAL='20397', IDIOMA_PRINCIPAL='Palauano', MOEDA_PRINCIPAL='Dólar Americano'
where PAÍS='Palau';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-6.227362495873737, 144.45731661124393', DEMOGRAFIA_POPULACIONAL='6732000', IDIOMA_PRINCIPAL='Inglês', MOEDA_PRINCIPAL='Kinas'
where PAÍS='Papua Nova Guiné';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-13.630899117293687, -172.3785951102285', DEMOGRAFIA_POPULACIONAL='223820', IDIOMA_PRINCIPAL='Samoano', MOEDA_PRINCIPAL='Tala'
where PAÍS='Samoa';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-21.18226231994313, -175.24602680531927', DEMOGRAFIA_POPULACIONAL='107000', IDIOMA_PRINCIPAL='Tonganês', MOEDA_PRINCIPAL='Pa_anga'
where PAÍS='Tonga';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-8.511964799747215, 179.2563310445121', DEMOGRAFIA_POPULACIONAL='11000', IDIOMA_PRINCIPAL='Tuvaluano', MOEDA_PRINCIPAL='Tuvalu Dólar'
where PAÍS='Tuvalu';
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='-15.208956820064973, 166.74420391526854', DEMOGRAFIA_POPULACIONAL='313000', IDIOMA_PRINCIPAL='Bislamá', MOEDA_PRINCIPAL='Vatu'
where PAÍS='Vanuatu';
update regionalizacao_mundial
set DEMOGRAFIA_POPULACIONAL='1344000', IDIOMA_PRINCIPAL= 'Tétum', MOEDA_PRINCIPAL='Dólar'
where PAÍS='Timor-Leste';


select * from regionalizacao_mundial order by PAÍS;
update regionalizacao_mundial
set COORDENADAS_GEOGRÁFICAS ='', DEMOGRAFIA_POPULACIONAL='', IDIOMA_PRINCIPAL='', MOEDA_PRINCIPAL=''
where PAÍS='';

/* Criando uma nova database com a relação global de moedas */
create table relacao_global_moedas as select * from relacao_global_moedas.relacao_global_moedas;
alter table relacao_global_moedas rename to relacao_global_moedas_ref; /* renomeando nome da tabela com a relação global de moedas */

/* Anexo da tabela com a relação global de moedas à tabela principal "regionalizacao_mundial" */
alter table relacao_global_moedas_ref change column país apagar varchar(30) not null;
select * from regionalizacao_mundial join relacao_global_moedas_ref on regionalizacao_mundial.PAÍS = relacao_global_moedas_ref.apagar;


desc regionalizacao_mundial;
desc relacao_global_moedas_ref;
select * from regionalizacao_mundial_rev1;

/*(((CORREÇÕES & UPDATES)))*/
update regionalizacao_mundial set PAÍS='Singapura' where PAÍS='Cingapura'; /*Alterado o nome do País de Singapura */
update regionalizacao_mundial set IDIOMA_PRINCIPAL= 'Xona' where IDIOMA_PRINCIPAL= 'xona'; /*Correção ortográfica de nomes de Idiomas */
update regionalizacao_mundial set MOEDA_PRINCIPAL= 'Xelim somali' where MOEDA_PRINCIPAL= 'xelim somali'; /*Correção ortográfica de nomes de moedas */
alter table regionalizacao_mundial drop column MOEDA_PRINCIPAL; /*Deletado a coluna de nome "MOEDA_PRINCIPAL" para realização do JOIN de informações de moeda a partir de outra tabela */
create table regionalizacao_mundial_rev1 as select * from regionalizacao_mundial join relacao_global_moedas_ref on regionalizacao_mundial.PAÍS = relacao_global_moedas_ref.apagar; /*Criar nova tabela de 
regionalizaao_mundial, com a inclusão das informações de moeda = regionalizacao_mundial_rev1 */ 
alter table regionalizacao_mundial_rev1 drop column apagar;


 