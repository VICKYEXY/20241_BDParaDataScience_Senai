-- Atividade de index dada pelo Professor (pesquisar e criar INDEX)
CREATE INDEX idx_documento_tipoDocumento ON Cliente(documento, dataNascimento);
 
--Exempo dado pelo professor
use comercio;
CREATE NONCLUSTERED INDEX idx_endereco_uf
ON endereco (uf);
