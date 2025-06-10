# IMPORTA AS BIBLIOTECAS

import numpy as np
import matplotlib as plt
import pandas as pd
from sklearn.impute import SimpleImputer
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

# LÊ A BASE DE DADOS

# print(r'C:\pasta\pasta2\arquivo.txt')

dataset = pd.read_csv(r'04_dados_paises.csv') #r: raw

# PRÉ-PROCESSAMENTO DE DADOS

# SUBSTITUIR VALORES NULOS PELA MÉDIA

features = dataset.iloc[:, :-1].values
classe = dataset.iloc[:, -1].values
imputer = SimpleImputer(
    missing_values=np.nan,
    strategy="mean"
)

imputer.fit(features[:, 1:3])
features[:, 1:3] = imputer.transform(features[:, 1:3])

# LER OS PAÍSES COMO NÚMEROS COM OneHotEncoder

columnTransformer = ColumnTransformer(
    transformers=[('encoder', OneHotEncoder(), [0])],
    remainder='passthrough'
)
features = np.array(columnTransformer.fit_transform(features))
print(features)

# SUBSTITUI OS VALORES DE yes OU no USANDO LabelEncoder (nesse caso irá substituir por 0 ou 1)

labelEncoder = LabelEncoder()
classe = labelEncoder.fit_transform(classe)

# DIVIDE A BASE EM 4 PARTES PARA TREINAMENTO E TESTE

features_treinamento, features_teste, classe_treinamento, classe_teste = train_test_split(features, classe, test_size=0.2, random_state=1)

# ESTANDARDIZAÇÃO / PADRONIZAÇÃO

standardScaler = StandardScaler()

# : - TODAS AS LINHAS

features_treinamento[:, 3:] = standardScaler.fit_transform(features_treinamento [:, 3:])

features_teste[:, 3:] = standardScaler.transform(features_teste[:, 3:])




