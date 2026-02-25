--exercícios 19 de novembro aula #1--


select * from tb_cliente

select nome_cliente, email from tb_cliente

select numero_cliente, nome_cliente, morada, codigo_postal, localidade, telefone, telemovel, email,nif from tb_cliente

SELECT nome_cliente, nif, telemovel, localidade from tb_cliente where localidade = 'Lisboa'

select * from tb_cliente where numero_cliente = 1
select * from tb_cliente where numero_cliente < 5
select * from tb_cliente where numero_cliente >= 10
select * from tb_cliente where localidade <> 'Lisboa'

select * from tb_cliente where numero_cliente > 5 AND numero_cliente < 10 

select * from tb_cliente where numero_cliente > 10 AND localidade != 'Lisboa'

select * from tb_cliente where NOT localidade = 'Lisboa'

select * from tb_cliente where localidade = 'Loures' OR
localidade = 'Mafra' OR
localidade = 'Odivelas'

select * from tb_cliente where numero_cliente between 5 and 10

select * from tb_cliente where numero_cliente between 8 and 10 OR numero_cliente between 12 and 14

select * from tb_cliente where numero_cliente not between 3 and 18

select * from tb_cliente where localidade in('Mafra', 'Sintra', 'Loures') 

select * from tb_cliente where localidade not in ('Mafra', 'Sintra', 'Loures') 

select * from tb_cliente where localidade not in ('Mafra', 'Sintra', 'Loures') and morada in ('rua A', 'Rua T')

select * from tb_cliente where localidade like 'Mafra'

select * from tb_cliente where localidade like 'L%'

select * from tb_cliente where nome_cliente like '_u_o'

select * from tb_cliente where localidade like '%ra'

select * from tb_cliente where localidade like 'S%ra'

select * from tb_cliente where nome_cliente like '_u_o' and localidade like 'L%'

select * from tb_cliente where localidade not like 'L%'

select numero_cliente, nome_cliente from tb_cliente order by nome_cliente asc

select numero_cliente, localidade, nome_cliente from tb_cliente order by localidade ASC, nome_cliente ASC

select numero_cliente, localidade, nome_cliente, nif from tb_cliente order by localidade desc, nif desc


select data, custo from tb_consulta order by data asc

select data, custo, cast(custo * 0.23 as numeric (6,2)) as 'IVA' from tb_consulta

select data, custo, custo *0.23 as 'IVA', custo *1.23 as 'custo + IVA' from tb_consulta

select data, custo, custo * 0.23 as 'IVA', custo *1.23 as 'custo + IVA' from tb_consulta order by 2 asc

select data, custo, custo * 0.23 as 'IVA', 
custo *1.23 as 'custo + IVA' from tb_consulta 
where data < '2011-1-1'
order by 2 asc

select distinct localidade from tb_cliente

select localidade, nome_cliente
from tb_cliente
where localidade like 'L%a'
and (codigo_postal like '1234-_2_'
	or codigo_postal like '27__%')
	order by localidade asc, 2 desc


