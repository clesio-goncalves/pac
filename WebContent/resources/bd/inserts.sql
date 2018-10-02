insert into Perfil (id, nome)
values (1, 'Administrador');

insert into Perfil (id, nome)
values (2, 'Demandante');

insert into Perfil (id, nome)
values (3, 'Gerenciador');

insert into Perfil (id, nome)
values (4, 'Coordenador');

insert into Setor (id, nome)
values (1, 'TI');

insert into Setor (id, nome)
values (2, 'DAP');

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (1, 'Instituto Federal do Piaui - Campus Paulistana', 'Clésio de Araújo Gonçalves', '(89) 3487-2703', 2216133, 'clesio.goncalves@ifpi.edu.br','$2a$10$bRHXvb97c2b4avC31ISmF.4xZkCgUsVMS./xsWvDL83OE8WIVpxX6', 1, 1, 1);

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (2, 'Instituto Federal do Piaui - Campus Paulistana', 'WELKSON PINHEIRO DO NASCIMENTO', '(89) 3487-2702', 2151590, 'welkson.pinheiro@ifpi.edu.br','$2a$10$ElhNzm3E7ilvzP79Lg0Hm.3z9rp5FfvxfAZnw30B4Nhz9uHT8E.hG', 1, 3, 2);

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (3, 'Instituto Federal do Piaui - Campus Paulistana', 'DENILSON DA COSTA CAMINHA', '(89) 3487-2715', 2264079, 'denilsoncaminh@ifpi.edu.br','$2a$10$VhWBb8ZgNICk83lyj1MEE.ajOGMLGB9nZXmPDvMJkjOFCpZ7e2AUC', 1, 3, 2);