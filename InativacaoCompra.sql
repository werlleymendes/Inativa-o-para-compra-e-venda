UPDATE consinco.map_produto        a 
       SET b.statuscompra = 'I'
       JOIN consinco.mrl_produtoempresa b
            ON a.seqproduto = b.seqproduto
       WHERE b.estqloja          <= 0 and
             b.estqtroca         <= 0 and
             b.nroempresa        = 1  and
             b.statuscompra      = 'A'  and
             b.qtdpendpedcompra  = 0  and
             b.dtaultmovtacao    < trunc(sysdate) - 540;
             

