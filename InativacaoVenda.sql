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










