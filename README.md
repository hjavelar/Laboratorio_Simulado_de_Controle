# Laboratorio_Simulado_de_Controle
Projeto de Ensino "Simulador multiplataforma de sistemas do Laboratório de Controle"
Simulação de sistemas do Laboratório de Controle
hjavelar.cefetmg@gmail.com

Plataforma de desenvolvimento do projeto: Godot_v3.2.1-stable_win64   Disponível em: <https://godotengine.org/>

Objetivo: 
- permitir a simulação dos sistemas (ou plantas) existentes no Laboratório de Controle em diversas plataformas,
inclusive celulares, permitindo que alunos e pesquisadores possam conhecer e estudar, mesmo que virtualmente, 
as plantas do laboratório.

Sistemas existentes:
- Controle de Nível:
  Constituído de um reservatório de água, bomba d'água, controlador, conversor corrente para pressão (I/P), 
  válvula de controle pneumática, tanque graduado, sensor de pressão para medição do nível. 
- Controle de Vazão:
  Constituído de um reservatório de água, bomba d'água, controlador, conversor corrente para pressão (I/P), 
  válvula de controle pneumática, rotâmetro, turbina para medição da vazão. 
- Controle de Pressão:
  Constituído de um reservatório de ar, controlador, conversor corrente para pressão (I/P), 
  válvula de controle pneumática, cilindro principal, medidor de pressão do cilindro, sensor de pressão da válvula. 
- Controle de Temperatura:
  Constituído de um reservatório de água, bomba d'água, controlador, rotâmetro, reservatório para água aquecida, 
  resistência para aquecimento, sensores de temperatura. 

Observações: 
- em todos os sistemas com reservatório de água, esta é recirculante.
- todos os sistemas com válvula de controle pneumática são conectados a um manifold, por meio de registros manuais individuais, o qual é alimentado por um compressor de ar externo ao laboratório.
