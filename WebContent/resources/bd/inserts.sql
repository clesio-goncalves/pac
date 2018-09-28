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
