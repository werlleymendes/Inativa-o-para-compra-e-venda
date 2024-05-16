UPDATE consinco.mrl_produtoempresa
       SET b.statuscompra = 'I'
       WHERE b.estqloja          <= 0 and
             b.estqtroca         <= 0 and
             b.nroempresa        = &empresa  and
             b.statuscompra      = 'A'  and
             b.qtdpendpedcompra  = 0  and
             b.dtaultmovtacao    < trunc(sysdate) - 540;

