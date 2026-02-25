-- avaliação

-- 1 Nome de cliente com menos de 8 caracteres

select nome_cliente from tb_cliente
where LEN (nome_cliente) < 8

-- 2 Peso do animal menor que a média

select avg(peso) from tb_animal

select * from tb_animal where peso < (select avg(peso) from tb_animal)

-- 3 todos os animais categorizados por peso

select *,
case
when peso <= 2 then 'Magro'
When peso <= 10 then 'Médio'
When peso > 10 then 'Gordo'
end as 'Run Time'
from tb_animal

-- 4 todos os clientes com o valor total da consulta superior a 1000€

select tb_cliente.nome_cliente, SUM (tb_consulta.custo) as 'soma dos custos' 
FROM tb_cliente inner join
				tb_animal ON tb_cliente.numero_cliente = tb_animal.numero_cliente INNER JOIN
				tb_consulta ON tb_animal.numero_animal = tb_consulta.codigo_animal

group by tb_cliente.nome_cliente
having SUM (tb_consulta.custo)> 1000;


-- 5 todos os veterinarios com consulta entre 2012 e 2017

SELECT        tb_veterinario.nome, year (tb_consulta.data) as 'ano_consulta'
FROM            tb_consulta INNER JOIN
                         tb_veterinario ON tb_consulta.codigo_veterinario = tb_veterinario.codigo_veterinario
Where year (tb_consulta.data) between 2012 and 2017
group by tb_veterinario.nome, year (tb_consulta.data)

--6 localidade de todos os cliente com final código postal 2,3 ou 4

select codigo_postal from tb_cliente

select nome_cliente, localidade, codigo_postal from tb_cliente
where codigo_postal like '%2' OR
	  codigo_postal like '%3' OR
	  codigo_postal like '%4'

--7 localidades sem repetições

select distinct localidade from tb_cliente

-- 8 total de cliente por localidade com consulta entre 2018 e 2022

SELECT        tb_cliente.nome_cliente, year (tb_consulta.data) as 'ano_consulta'
FROM            tb_cliente inner join
				tb_animal ON tb_cliente.numero_cliente = tb_animal.numero_cliente INNER JOIN
				tb_consulta ON tb_animal.numero_animal = tb_consulta.codigo_animal
Where year (tb_consulta.data) between 2018 and 2022
group by tb_cliente.nome_cliente, year (tb_consulta.data)

--9 campos da tabela animal ordenados de forma ascendente e descendente

select * from tb_animal
order by peso desc,
         altura asc;

-- 10 lista de consulta dos últimos 300 dias

select * from tb_consulta 
WHERE data > DATEADD(DAY, -3000, GETDATE())

--11 consultas que acontreceram no primeiro trimestre de qualquer ano

select * from tb_consulta
WHERE MONTH (data) in (1,2,3)

-- 12 custo da consulta + IVA
select data, custo, custo * 0.23 as 'total'
FROM tb_consulta
order by total asc

--13 Todos os campos da tabela consutla com custo maior que a média

select * from tb_consulta
where custo > (select avg (custo) from tb_consulta)

--14 data e custo de consultas dos primeiros quinze dias

select * from tb_consulta
WHERE day (data) in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)

--15 todos os campos com peso maior que 20 e altura maio ou igual a 1

select * from tb_animal
WHERE peso > 20 and altura >=1 
order by altura asc

-- 16 data e custo iferior a 50

select data, custo from tb_consulta
WHERE custo < 50

--17 campos com localidade L, nome não começa com a e código postal termina em 789

select * from tb_cliente
WHERE localidade like 'L%a' and
	  nome_cliente not like 'A%' and
	  codigo_postal like '%789'

--18 todos os campos da tabela veterinarios com localidade S..a

select * from tb_veterinario
WHERE localidade like 'S%a'

--19 campos cujo veterianos tem 5 letras no nome

select * from tb_veterinario
where LEN (nome) = 5

--20 clientes com localidade = veterinário

select nome_cliente, localidade from tb_cliente
intersect
select nome, localidade from tb_veterinario









			


