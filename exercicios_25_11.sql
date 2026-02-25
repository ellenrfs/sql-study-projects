select * from tb_consulta where data between '2010-01-01' and '2010-06-30'

select * from tb_consulta where day (data) in ('5','10','15')


select nome, descricao, month (data_nascimento) as 'mês' , year (data_nascimento) as 'ano'from tb_animal

18 - select nome, datediff(year, data_nascimento, getdate()) as 'anos',
				datediff(MONTH, data_nascimento, getdate()) as 'mês',
				datediff(DAY, data_nascimento, GETDATE()) as 'dia'
from tb_animal

selec nome, data_nascimento, DATEADD(day, 1000, data_nascimento) as 'data_1000_dias' 
from tb_animal


select * from tb_consulta
where datediff(day, data, getdate()) < 1500

select * from tb_consulta
where datediff(day, data, getdate()) < 1500

- select * from tb_animal where data_nascimento >= DATEADD(MONTH, -24, GETDATE())
order by data_nascimento

 - select * from tb_animal where data_nascimento >= DATEADD(MONTH, -60, GETDATE())
order by data_nascimento

--20
select * from tb_animal where data_nascimento between '2006-01-01' and DATEADD(DAY, 500, '2006-01-01')

--forma 2

select * from tb_animal where data_nascimento > '2006-01-01' and data_nascimento < dateadd(day, 500, '2006-01-01')

--forma 3

SELECT * FROM TB_ANIMAL WHERE DATA_NASCIMENTO >= '2006-01-01' AND DATA_NASCIMENTO <= DATEdiff(DAY,-500,'2006-01-01')

--aula 25/11

select count (*) as 'total de animais por cliente',
numero_cliente from tb_animal
group by numero_cliente

select codigo_animal,
sum (custo) as 'total de consultas por animal'
from tb_consulta
group by codigo_animal

select localidade,
count (nome_cliente) as 'cliente por localidade' from tb_cliente
group by localidade

select localidade,
count (nome_cliente) as 'cliente por localidade'
from tb_cliente
where localidade like 'L%'
group by localidade

select localidade, count (nome_cliente) as
'clientes por localidade' from tb_cliente
where localidade like 'L%'
group by localidade
order by 2 asc

select localidade, count (nome_cliente) as
'clientes por localidade' from tb_cliente
group by localidade
having count (nome_cliente)>3 
-- having conta dentro da categoria. No exemplo acima, trouxe apenas lisboa, porque aviam mais de três elementos dentro do grupo localidade

select codigo_animal as 'animal',
max (custo) as 'custo consulta'
from tb_consulta
group by codigo_animal
having max (custo) > 75

--filtra apenas as consultas com valor acima de 75€ de 2010.
select codigo_animal as 'animal',
max (custo) as 'custo consulta'
from tb_consulta
where YEAR(data) = 2010
group by codigo_animal
having max (custo) > 75

--subcosulta

--saber qual é a data do animal mais novo
select nome, data_nascimento from tb_animal 
where data_nascimento =
	(select max (data_nascimento) from tb_animal)

--saber quantos animais estão acima do peso médio dos animais
select AVG (peso) as 'peso médio'
from tb_animal

select nome, peso from tb_animal
where peso <
	(select AVG (peso) as 'peso médio'from tb_animal)

--animais com altura superior a média

select avg (altura) as 'altura média' from tb_animal

select nome, altura from tb_animal
where altura <
		(select avg (altura) as 'altura média' from tb_animal)

--os animais mais pesados

select top (5) numero_animal from tb_animal
order by peso desc

select nome, data_nascimento, altura, peso from tb_animal where numero_animal in
		(select top (5) numero_animal from tb_animal
order by peso desc)

--os dados das raças nas quais existem
--animais com peso superior a 15

select codigo_raca_animal, raca from tb_raca
where codigo_raca_animal in
		(select codigo_raca_animal from tb_animal where peso > 15)

--media de idade menor

select avg (datediff(year, data_nascimento, getdate())) from tb_animal

select nome, data_nascimento from tb_animal
where DATEDIFF(year, data_nascimento,getdate()) <
	(select avg (datediff(year, data_nascimento, getdate())) as 'idade média' from tb_animal)	

	


select * from tb_cliente
where localidade = 'Mafra'
and nome_cliente like '%a'

--duas formas para conseguir pelo ano
select * from tb_animal
where year (data_nascimento) between '2008-01-01' and '2012-12-30'
order by nome desc

select * from tb_animal
where year (data_nascimento) between 2008 and 2012
order by nome desc

select distinct localidade from tb_veterinario

--select * from tb_veterinario

select YEAR(data), sum(custo) from tb_consulta
group by year(data)
order by YEAR(data) desc