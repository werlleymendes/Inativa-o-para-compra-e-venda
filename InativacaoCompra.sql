UPDATE consinco.mrl_produtoempresa
       SET b.statuscompra = 'I'
       FROM consinco.mrl_produtoempresa b
       JOIN consinco.map_produto        a       
            ON a.seqproduto = b.seqproduto
       WHERE b.estqloja          <= 0 and
             b.estqtroca         <= 0 and
             b.nroempresa        = &empresa  and
             b.statuscompra      = 'A'  and
             b.qtdpendpedcompra  = 0  and
             b.dtaultmovtacao    < trunc(sysdate) - 540;
             

