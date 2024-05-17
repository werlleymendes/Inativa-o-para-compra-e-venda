UPDATE consinco.mrl_prodempseg a
       SET a.statusvenda = 'I'
       WHERE a.statusvenda = 'A'          and
             a.nroempresa  = &empresa     and
             a.nrosegmento = &segmento    and
             trunc(a.dtahoraltstatusvda) < trunc(sysdate) - 540
             and a.seqproduto EXISTS(
                 SELECT a.seqproduto FROM consinco.mrl_produtoempresa a
                   WHERE b.estqloja          <= 0 and
                         b.estqtroca         <= 0 and
                         b.nroempresa        = &empresa  and
                         b.statuscompra      = 'A'  and
                         b.qtdpendpedcompra  = 0  and
                         b.dtaultmovtacao    < trunc(sysdate) - 540
                                             );




CREATE VIEW PRODUTOS_SEM_GIRO
       AS SELECT b.seqproduto, a.desccompleta, b.nroempresa, b.dtaultmovtacao
       FROM consinco.mrl_produtoempresa b
       JOIN consinco.map_produto a
       ON a.seqproduto = b.seqproduto
                   WHERE b.estqloja          <= 0 and
                         b.estqtroca         <= 0 and
                         b.statuscompra      = 'A'  and
                         b.qtdpendpedcompra  = 0  and
                         b.dtaultmovtacao    < trunc(sysdate) - 540;


SELECT * FROM produtos_sem_giro;


