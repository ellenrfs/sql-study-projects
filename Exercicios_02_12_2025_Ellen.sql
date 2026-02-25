--Q 23

select count(numero_animal) from tb_animal

--Q 24

select count(numero_cliente) from tb_cliente
where localidade in ('Lisboa', 'Mafra')

--Q 25

select avg(custo) from tb_consulta

--Q 27

select AVG(DATEDIFF(day, data_nascimento, getdate())) as 'média de idade em dias'
from tb_animal

--Q 28

select data_nascimento, peso from tb_animal
where peso =(select MAX(peso) from tb_animal);

--Q 29

select top 1 data from tb_consulta
order by data desc

--Q 30

select min (custo) as 'Min consulta', max (custo) as 'Max Consulta' from tb_consulta

--Q 31

select tb_raca.raca, tb_tipo_animal.tipo_animal
from tb_raca inner join 
				tb_tipo_animal on tb_raca.codigo_tipo_animal = tb_tipo_animal.codigo_tipo_animal

--Q 32
select raca, count(*) as quantidade
from tb_raca inner join tb_animal on tb_raca.[codigo_raca_animal] = tb_animal.[codigo_raca_animal]
group by raca
order by quantidade desc

--Q 33

select avg (tb_consulta.custo), tb_animal.numero_animal
from tb_consulta inner join tb_animal on tb_consulta.[codigo_animal] = tb_animal.[numero_animal]
group by tb_animal.numero_animal


--select * from tb_animal
--select * from tb_cliente
--select * from tb_consulta

--Q 34

select sum (tb_consulta.custo), tb_veterinario.codigo_veterinario
from tb_consulta inner join tb_veterinario on tb_consulta.[codigo_veterinario] = tb_veterinario.[codigo_veterinario]
group by tb_veterinario.[codigo_veterinario]

-- Q35

select localidade, count (*) as quantidade from tb_cliente
group by localidade
having count(localidade) >= 4;

--36
