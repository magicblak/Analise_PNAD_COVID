-- Script de Consulta BigQuery no Google Cloud
SELECT  
x1.mes,
x1.semana,

COUNT (*) as qtd_amostra,

CASE 
      WHEN cast(x1.a002 as int64) <= 9 THEN '0 a 9 anos'
      WHEN cast(x1.a002 as int64) BETWEEN 10 AND 19 THEN '10 a 19 anos'          
      WHEN cast(x1.a002 as int64) BETWEEN 20 AND 29 THEN '20 a 29 anos'
      WHEN cast(x1.a002 as int64) BETWEEN 30 AND 59 THEN '30 a 59 anos'
      WHEN cast(x1.a002 as int64) >= 60 THEN '60 anos ou mais'
		  ELSE 'Outros'
		  END as faixa_idade,

CASE 
          WHEN cast(x1.a003 as int64) = 1 THEN 'Homem'
          WHEN cast(x1.a003 as int64) = 2 THEN 'Mulher'
		    ELSE 'Outros'
		    END as sexo,

CASE 
          WHEN cast(x1.a004 as int64) = 1 THEN 'Branca'
          WHEN cast(x1.a004 as int64) = 2 THEN 'Preta'
          WHEN cast(x1.a004 as int64) = 3 THEN 'Amarela'
          WHEN cast(x1.a004 as int64) = 4 THEN 'Parda'
          WHEN cast(x1.a004 as int64) = 5 THEN 'Indigena'
          WHEN cast(x1.a004 as int64) = 9 THEN 'Ignorado'
		    ELSE 'Outros'
		    END as raca,

CASE 
          WHEN cast(x1.a005 as int64) = 1 THEN 'Sem instrução' 
          WHEN cast(x1.a005 as int64) = 2 THEN 'Fundamental incompleto'
          WHEN cast(x1.a005 as int64) = 3 THEN 'Fundamental completo'
          WHEN cast(x1.a005 as int64) = 4 THEN 'Médio incompleto'
          WHEN cast(x1.a005 as int64) = 5 THEN 'Médio completo'
          WHEN cast(x1.a005 as int64) = 6 THEN 'Superior incompleto'
          WHEN cast(x1.a005 as int64) = 7 THEN 'Superior completo'
          WHEN cast(x1.a005 as int64) = 8 THEN 'Pós-graduação, mestrado ou doutorado'

		    ELSE 'Outros'
		    END as escolaridade,

CASE 
          WHEN cast(x1.b0011 as int64) = 1
          OR cast(x1.b0012 as int64) = 1
          OR cast(x1.b0013 as int64) = 1
          OR cast(x1.b0014 as int64) = 1
          OR cast(x1.b0015 as int64) = 1
          OR cast(x1.b0016 as int64) = 1
          OR cast(x1.b0017 as int64) = 1
          OR cast(x1.b0018 as int64) = 1
          OR cast(x1.b0019 as int64) = 1
          OR cast(x1.b00110 as int64) = 1
          OR cast(x1.b00111 as int64) = 1
          OR cast(x1.b00112 as int64) = 1 
          OR cast(x1.b00113 as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END as teve_sintoma,

CASE 
          WHEN cast(x1.b0101 as int64) = 1
          OR cast(x1.b0102 as int64) = 1
          OR cast(x1.b0103 as int64) = 1
          OR cast(x1.b0104 as int64) = 1
          OR cast(x1.b0105 as int64) = 1
          OR cast(x1.b0106 as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END as tem_doenca,

CASE 
          WHEN cast(x1.b009b as int64) = 1
          OR cast(x1.b009d as int64) = 1
          OR cast(x1.b009f as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END as positivo_covid,

CASE 
          WHEN cast(x1.b005 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as ficou_internado,

CASE 
          WHEN cast(x1.b006 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as foi_sedado,

CASE 
          WHEN cast(x1.b007 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as plano_de_saude,

CASE 
          WHEN cast(x1.b008 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as fez_teste,

CASE 
          WHEN cast(x1.b002 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as procurou_estabelecimento,

CASE 
          WHEN cast(x1.c001 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as trabalhou,

CASE 
          WHEN cast(x1.c002 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END as afastado,

    SUM( IF(cast(x1.b0011 as int64) = 1 , 1, 0)) febre,
    SUM( IF(cast(x1.b0012 as int64) = 1 , 1, 0)) tosse,
    SUM( IF(cast(x1.b0013 as int64) = 1 , 1, 0)) dor_garganta,
    SUM( IF(cast(x1.b0014 as int64) = 1 , 1, 0)) dificuldade_respirar,
    SUM( IF(cast(x1.b0015 as int64) = 1 , 1, 0)) dor_cabeca,
    SUM( IF(cast(x1.b0016 as int64) = 1 , 1, 0)) dor_peito,
    SUM( IF(cast(x1.b0017 as int64) = 1 , 1, 0)) nausea,
    SUM( IF(cast(x1.b0018 as int64) = 1 , 1, 0)) nariz_entupido,
    SUM( IF(cast(x1.b0019 as int64) = 1 , 1, 0)) fadiga,
    SUM( IF(cast(x1.b00110 as int64) = 1 , 1, 0)) dor_olhos,
    SUM( IF(cast(x1.b00111 as int64) = 1 , 1, 0)) perda_cheiro,
    SUM( IF(cast(x1.b00112 as int64) = 1 , 1, 0)) dor_muscular,
    SUM( IF(cast(x1.b00113 as int64) = 1 , 1, 0)) diarreia,
    SUM( IF(cast(x1.B002 as int64) = 1 , 1, 0)) procurou_estabelecimento_saude,
    SUM( IF(cast(x1.B0031 as int64) = 1 , 1, 0)) ficou_em_casa,
    SUM( IF(cast(x1.B0032 as int64) = 1 , 1, 0)) ligou_profissional_saude,
    SUM( IF(cast(x1.B0033 as int64) = 1 , 1, 0)) tomou_remedio_conta_propria,
    SUM( IF(cast(x1.B0034 as int64) = 1 , 1, 0)) tomou_remedio_orient_medica,
    SUM( IF(cast(x1.B0035 as int64) = 1 , 1, 0)) recebeu_visita_SUS,
    SUM( IF(cast(x1.B0036 as int64) = 1 , 1, 0)) recebeu_visita_Particular,
    SUM( IF(cast(x1.B0037 as int64) = 1 , 1, 0)) outra_providencia,
    SUM( IF(cast(x1.b0041 as int64) = 1 , 1, 0)) posto_saude,
    SUM( IF(cast(x1.b0042 as int64) = 1 , 1, 0)) UPA,
    SUM( IF(cast(x1.b0043 as int64) = 1 , 1, 0)) hospital_SUS,
    SUM( IF(cast(x1.b0044 as int64) = 1 , 1, 0)) ambulatorio_forcas_armadas,
    SUM( IF(cast(x1.b0045 as int64) = 1 , 1, 0)) pronto_socorro_forcas_armadas,
    SUM( IF(cast(x1.b0046 as int64) = 1 , 1, 0)) hospital_forcas_armadas,
    SUM( IF(cast(x1.b005 as int64) = 1 , 1, 0)) ficou_internado,
    SUM( IF(cast(x1.B006 as int64) = 1 , 1, 0)) ficou_sedado,
    SUM( IF(cast(x1.B007 as int64) = 1 , 1, 0)) Tem_plano_saude,
    SUM( IF(cast(x1.b008 as int64) = 1 , 1, 0)) fez_teste_covid,
    SUM( IF(cast(x1.b009a as int64) = 1 , 1, 0)) swab,
    SUM( IF(cast(x1.b009b as int64) = 1 , 1, 0)) positivo_swab,
    SUM( IF(cast(x1.b009c as int64) = 1 , 1, 0)) furo_dedo,
    SUM( IF(cast(x1.b009d as int64) = 1 , 1, 0)) positivo_furo_dedo,
    SUM( IF(cast(x1.b009e as int64) = 1 , 1, 0)) veia_do_braco,
    SUM( IF(cast(x1.b009f as int64) = 1 , 1, 0)) positivo_veia,
    SUM( IF(cast(x1.b0101 as int64) = 1 , 1, 0)) teve_diabetes,
    SUM( IF(cast(x1.b0102 as int64) = 1 , 1, 0)) teve_hipertensao,
    SUM( IF(cast(x1.b0103 as int64) = 1 , 1, 0)) teve_doenca_pulmonar,
    SUM( IF(cast(x1.b0104 as int64) = 1 , 1, 0)) teve_doenca_coracao,
    SUM( IF(cast(x1.b0105 as int64) = 1 , 1, 0)) teve_depressao,
    SUM( IF(cast(x1.b0106 as int64) = 1 , 1, 0)) teve_cancer,
    SUM( IF(cast(x1.c001 as int64) = 1 , 1, 0)) trabalhou,    
    SUM( IF(cast(x1.c002 as int64) = 1 , 1, 0)) afastado_trabalho,

	
FROM basedosdados.br_ibge_pnad_covid.microdados x1
WHERE x1.mes BETWEEN 9 AND 11
GROUP BY
x1.mes,
x1.semana,

CASE 
      WHEN cast(x1.a002 as int64) <= 9 THEN '0 a 9 anos'
      WHEN cast(x1.a002 as int64) BETWEEN 10 AND 19 THEN '10 a 19 anos'          
      WHEN cast(x1.a002 as int64) BETWEEN 20 AND 29 THEN '20 a 29 anos'
      WHEN cast(x1.a002 as int64) BETWEEN 30 AND 59 THEN '30 a 59 anos'
      WHEN cast(x1.a002 as int64) >= 60 THEN '60 anos ou mais'
		  ELSE 'Outros'
		  END,
CASE 
          WHEN cast(x1.a003 as int64) = 1 THEN 'Homem'
          WHEN cast(x1.a003 as int64) = 2 THEN 'Mulher'
		    ELSE 'Outros'
		    END,
CASE 
          WHEN cast(x1.a004 as int64) = 1 THEN 'Branca'
          WHEN cast(x1.a004 as int64) = 2 THEN 'Preta'
          WHEN cast(x1.a004 as int64) = 3 THEN 'Amarela'
          WHEN cast(x1.a004 as int64) = 4 THEN 'Parda'
          WHEN cast(x1.a004 as int64) = 5 THEN 'Indigena'
          WHEN cast(x1.a004 as int64) = 9 THEN 'Ignorado'
		    ELSE 'Outros'
		    END,

CASE 
          WHEN cast(x1.a005 as int64) = 1 THEN 'Sem instrução' 
          WHEN cast(x1.a005 as int64) = 2 THEN 'Fundamental incompleto'
          WHEN cast(x1.a005 as int64) = 3 THEN 'Fundamental completo'
          WHEN cast(x1.a005 as int64) = 4 THEN 'Médio incompleto'
          WHEN cast(x1.a005 as int64) = 5 THEN 'Médio completo'
          WHEN cast(x1.a005 as int64) = 6 THEN 'Superior incompleto'
          WHEN cast(x1.a005 as int64) = 7 THEN 'Superior completo'
          WHEN cast(x1.a005 as int64) = 8 THEN 'Pós-graduação, mestrado ou doutorado'

		    ELSE 'Outros'
		    END,

CASE 
          WHEN cast(x1.b0011 as int64) = 1
          OR cast(x1.b0012 as int64) = 1
          OR cast(x1.b0013 as int64) = 1
          OR cast(x1.b0014 as int64) = 1
          OR cast(x1.b0015 as int64) = 1
          OR cast(x1.b0016 as int64) = 1
          OR cast(x1.b0017 as int64) = 1
          OR cast(x1.b0018 as int64) = 1
          OR cast(x1.b0019 as int64) = 1
          OR cast(x1.b00110 as int64) = 1
          OR cast(x1.b00111 as int64) = 1
          OR cast(x1.b00112 as int64) = 1 
          OR cast(x1.b00113 as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END,
CASE 
          WHEN cast(x1.b0101 as int64) = 1
          OR cast(x1.b0102 as int64) = 1
          OR cast(x1.b0103 as int64) = 1
          OR cast(x1.b0104 as int64) = 1
          OR cast(x1.b0105 as int64) = 1
          OR cast(x1.b0106 as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END,


CASE 
          WHEN cast(x1.b009b as int64) = 1
          OR cast(x1.b009d as int64) = 1
          OR cast(x1.b009f as int64) = 1 THEN 'Sim'
         
		        ELSE 'Nao'
		         END,

CASE 
          WHEN cast(x1.b005 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END ,

CASE 
          WHEN cast(x1.b006 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END,

CASE 
          WHEN cast(x1.b007 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END,
CASE 
          WHEN cast(x1.b008 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END,
CASE 
          WHEN cast(x1.b002 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END,
CASE 
          WHEN cast(x1.c001 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END,

CASE 
          WHEN cast(x1.c002 as int64) = 1 THEN 'Sim'
		        ELSE 'Nao'
		        END

-- Consultas no python
SELECT B0011,B0012,B0013,B0014,B0015,B0016,B0017,B0018,B0019,B00110,B00111,B00112,B00113,B0011,
    B0012,B0014,B008,B009B,B009D,B009F,B0101,B0102,B0103,B0104,B0105,B0106,A002,A004,
    sigla_uf,A005,A003,V1022,B0031,B0032,B0033,B0034,B0035,B0036,B0037,B0044,B0045,B0046,B005,B006,C01011
FROM basedosdados.br_ibge_pnad_covid.microdados
WHERE mes in (9,10,11)