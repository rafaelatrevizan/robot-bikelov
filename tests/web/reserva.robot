*** Settings ***
Documentation   Pedido de reservas
...             Para que eu possa aprovar ou reprovar 
...             Sendo um anúnciante que possui anúncio cadastrados
...             Quero receber pedidos de reserva no meu dashboard

Resource        ../../resources/steps_kw.robot

Suite Setup      Logged with "eu@papito.io"
Suite Teardown   End Session
Test Teardown    End Test


*** Test Cases ***
Receber pedido de reserva
    [tags]  todo
    Dado que estou logado como "papito@gmail.com"
    E tenho anúncios cadastrados
    Quando o "joao@gmail.com" solicita uma reserva para o meu anúncio
    Então devo ver esta solicitação no meu dashboard