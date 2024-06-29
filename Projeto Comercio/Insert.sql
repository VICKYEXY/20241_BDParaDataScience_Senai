USE comercio;

INSERT INTO cliente (nome,nomeSocial,genero,dataNascimento,documento,tipoDocumento)
			VALUES ('tio Patinhas', 'n/a', 'masculino', '1950-03-03','123.456.789-98','CPF');
			

			INSERT INTO cliente(nome,genero,dataNascimento,documento,tipoDocumento)
						VALUES('Docinho','Feminino','2000-12-31','987-654-321-89','CPF');

			INSERT INTO cliente(nome,nomeSocial,genero,dataNascimento,documento,tipoDocumento)
						VALUES ('Lindinha','n\a','Feminino', '2000-02-06','147,258,369-87', 'CPF'),
							('Florzinha','n\a','feminino','2000-11-24','369.258.147-65','CPF'),
							('Silvestre Star longe','Stalone','Masculino','1960-05-23','381.241.156-23','CPF'),
							('Aroldo Chuxu e as nega','n\a','Masculino','1961-03-02','249.359.167-65','CPF');

			INSERT INTO cliente(nome,nomeSocial,genero,dataNascimento,documento,tipoDocumento)
						VALUES ('Zezé','n\a','masculino', '2024-05-03','345.897.543.88', 'CPF'),
							('Andressa','n\a','feminino','2001-02-06','998.732.612-89','CPF'),
							('Amarildo','n\a','Masculino','1961-03-01','678.257.862-76','CPF'),
							('Alessandro','n\a','Masculino','2005.12.08','249.359.167-65','CPF'),
							('Gustavo','Xalalá','LGBT','2007.05.11','512.976.476.98','CPF');			                 

			SELECT*FROM cliente;
