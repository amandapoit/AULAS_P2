

-- INSERT INTO tb_teste_trigger
-- (texto) VALUES ('testando trigger');

-- CREATE OR REPLACE TRIGGER tg_depois_do_insert2
-- AFTER INSERT ON tb_teste_trigger
-- FOR EACH STATEMENT
-- EXECUTE PROCEDURE fn_depois_de_um_insert();

-- CREATE OR REPLACE TRIGGER tg_antes_do_insert2
-- BEFORE INSERT ON tb_teste_trigger
-- FOR EACH STATEMENT
-- EXECUTE PROCEDURE fn_antes_de_um_insert();

-- INSERT INTO tb_teste_trigger
-- (texto) VALUES ('testando trigger');

-- CREATE OR REPLACE TRIGGER tg_depois_do_insert
-- AFTER INSERT ON tb_teste_trigger
-- FOR STATEMENT
-- EXECUTE FUNCTION fn_depois_de_um_insert();

-- CREATE OR REPLACE FUNCTION fn_depois_de_um_insert()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     RAISE NOTICE 'Trigger foi chamado depois do INSERT!';
--     RETURN NULL; --mais sobre isso em breve
-- END;
-- $$

-- INSERT INTO tb_teste_trigger(texto)
-- VALUES('testando trigger');

-- CREATE OR REPLACE TRIGGER tg_antes_do_insert
-- BEFORE INSERT ON tb_teste_trigger
-- FOR EACH STATEMENT
-- -- aqui você pode falar FUNCTION OU PROCEDURE (mas não ROUTINE)
-- EXECUTE PROCEDURE fn_antes_de_um_insert();

-- CREATE OR REPLACE FUNCTION fn_antes_de_um_insert()
-- RETURNS TRIGGER
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     RAISE NOTICE 'Trigger foi chamado antes do INSERT!';
--     RETURN NULL; --mais sobre isso em breve...
-- END;
-- $$

-- CREATE TABLE tb_teste_trigger(
--     cod_teste_trigger SERIAL PRIMARY KEY,
--     texto VARCHAR(200)
-- );