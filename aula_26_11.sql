SELECT        tb_raca.raca, tb_tipo_animal.tipo_animal
FROM            tb_raca right outer JOIN
                         tb_tipo_animal ON tb_raca.codigo_tipo_animal = tb_tipo_animal.codigo_tipo_animal

--listar os animais

SELECT        tb_animal.nome, count (tb_consulta.numero_consulta)
FROM            tb_animal INNER JOIN
                         tb_consulta ON tb_animal.numero_animal = tb_consulta.codigo_animal
group by tb_animal.nome
having count (tb_consulta.numero_consulta) <=2

--listar soma de valor por veterinário

SELECT        sum (tb_consulta.custo), tb_veterinario.nome
FROM            tb_consulta INNER JOIN
                         tb_veterinario ON tb_consulta.codigo_veterinario = tb_veterinario.codigo_veterinario

group by tb_veterinario.nome


--media do valor da consulta por animal

SELECT        tb_animal.nome, avg (tb_consulta.custo)
FROM            tb_animal INNER JOIN
                         tb_consulta ON tb_animal.numero_animal = tb_consulta.codigo_animal

group by tb_animal.nome

-- lista de valor medio das consultas de cães

SELECT        tb_animal.nome, avg (tb_consulta.custo)
FROM            tb_animal INNER JOIN
                         tb_consulta ON tb_animal.numero_animal = tb_consulta.codigo_animal INNER JOIN
                         tb_raca ON tb_animal.codigo_raca_animal = tb_raca.codigo_raca_animal INNER JOIN
                         tb_tipo_animal ON tb_raca.codigo_tipo_animal = tb_tipo_animal.codigo_tipo_animal
where tb_tipo_animal.tipo_animal = 'Cão'
group by tb_animal.nome



-- lista de n de animais por cliente
SELECT        count (tb_animal.numero_animal), tb_cliente.nome_cliente
FROM            tb_animal INNER JOIN
                         tb_cliente ON tb_animal.numero_cliente = tb_cliente.numero_cliente
group by tb_cliente.nome_cliente

--listar animais por cliente com clientes que possuem 2 ou mais animais
select tb_cliente.nome_cliente, count (tb_animal.numero_animal)
from tb_animal inner join
				tb_cliente on tb_animal.numero_cliente = tb_cliente.numero_cliente
group by tb_cliente.nome_cliente
having count (tb_animal.numero_animal) >= 2

-- listar n de racas por tipo de animal

select tipo_animal, count (tb_raca.raca)
from tb_raca right outer join
			tb_tipo_animal on tb_raca.codigo_tipo_animal = tb_tipo_animal.codigo_tipo_animal
group by tb_tipo_animal.tipo_animal


