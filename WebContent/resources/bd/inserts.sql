insert into Perfil (id, nome)
values (1, 'Administrador');

insert into Perfil (id, nome)
values (2, 'Demandante');

insert into Perfil (id, nome)
values (3, 'Gerenciador');

insert into Setor (id, nome)
values (1, 'TI');

insert into Setor (id, nome)
values (2, 'DAP');

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (1, 'Instituto Federal do Piaui - Campus Paulistana', 'Clésio de Araújo Gonçalves', '(89) 99907-0830', 2216133, 'clesio@clesio.com','$2a$10$bRHXvb97c2b4avC31ISmF.4xZkCgUsVMS./xsWvDL83OE8WIVpxX6', 1, 1, 1);

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (2, 'Instituto Federal do Piaui - Campus Paulistana', 'Clésio de Araújo Gonçalves', '(89) 99907-0830', 2216134, 'clesio2@clesio.com','$2a$10$bRHXvb97c2b4avC31ISmF.4xZkCgUsVMS./xsWvDL83OE8WIVpxX6', 1, 2, 1);

insert into Usuario(id, orgao, nome, telefone, siape, email, senha, ativo, perfil_id, setor_id)
values (3, 'Instituto Federal do Piaui - Campus Paulistana', 'Clésio de Araújo Gonçalves', '(89) 99907-0830', 2216135, 'clesio3@clesio.com','$2a$10$bRHXvb97c2b4avC31ISmF.4xZkCgUsVMS./xsWvDL83OE8WIVpxX6', 1, 3, 1);

select g.id, g.nome, 
(select count(*) from Item as i where i.grupo_id = g.id) as 'quantidade_itens' from Grupo as g;
