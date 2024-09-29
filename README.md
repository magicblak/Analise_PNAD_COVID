# Análise de Dados PNAD-COVID19

Este projeto faz parte de um estudo aprofundado sobre o comportamento da população brasileira durante a pandemia de COVID-19, utilizando a base de dados PNAD-COVID19 do IBGE. O objetivo principal é fornecer insights estratégicos que auxiliem na preparação e resposta de instituições de saúde, como o **Hospital Hospitalize-se**, para possíveis novos surtos de COVID-19.

## Tecnologias Utilizadas
- **Python**: para análise de dados e construção de modelos de machine learning.
- **Power BI**: criação de dashboards interativos.
- **Google BigQuery**: para armazenamento e processamento escalável de dados.

## Etapas do Projeto

### 1. Preparação dos Dados
- **Base de Dados**: Utilização da base de dados PNAD-COVID19 disponibilizada pelo IBGE no BigQuery.
- **Filtragem**: Foco nos casos positivos para COVID-19.
- **Transformação de Variáveis Categóricas**: As variáveis categóricas foram convertidas em variáveis binárias para simplificar as análises.

### 2. Análise Exploratória de Dados (EDA)
- **Correlação**: Análise das correlações entre sintomas, comorbidades e gravidade da doença (internação e intubação). A análise revelou correlações moderadas entre sintomas comuns, como dor de garganta e tosse, além da relação entre comorbidades e a intensificação dos sintomas.
- **Distribuição Etária**: Identificação de grupos de risco com base na faixa etária, onde idosos apresentaram maior incidência de internação e intubação.

### 3. Análise de Cluster (K-means)
- **MCA (Análise de Componentes Múltiplos)**: Redução da dimensionalidade para identificar as variáveis mais relevantes na variação dos sintomas.
- **Definição de Clusters**: Utilizando os métodos elbow e silhouette, identificamos 15 clusters que agrupam indivíduos com base em características e sintomas relevantes.
- **Remoção de Outliers**: Pontos atípicos foram identificados e removidos para garantir uma melhor qualidade dos clusters.

### 4. Resultados e Insights
- **Identificação de Sintomas Relevantes**: Os sintomas mais frequentes e significativos para casos positivos de COVID-19 incluem febre, tosse, fadiga, perda de olfato e paladar.
- **Indicadores de Gestão**: Os insights extraídos servem como base para otimizar o planejamento de recursos, como medicamentos e equipe médica, em futuras emergências de saúde pública.

### 5. Visualização de Dados
- **Dashboard Power BI**: Criação de visualizações interativas para explorar a distribuição de sintomas, faixa etária e comorbidades, facilitando a compreensão dos dados por stakeholders.

## Conclusão
O estudo demonstrou a importância de utilizar técnicas avançadas de análise de dados para compreender o impacto da COVID-19 e preparar instituições de saúde para responder de maneira eficiente a futuros surtos. A análise de clusters e correlações fornece subsídios importantes para o planejamento estratégico de alocação de recursos médicos e testagem.
