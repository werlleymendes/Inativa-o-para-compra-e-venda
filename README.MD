# Inativação de produtos para compra e venda

1. Foi solicitado a inativação para compra e venda de produtos com mais de 1 ano e meio sem movimentações.

1. A execução será feita em duas querys, uma que altera a tabela mrl_produtoempresa(inativa para compra), outra que altera a tabela mrl_prodempseg(Inativa para a venda).

1. Após a execução inicial será feito a criação de um job no Oracle PL/SQL para que seja executado mensalmente essa rotina.

