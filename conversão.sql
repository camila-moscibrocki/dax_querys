Duração = 
// Formatação de duração
// * entra um valor em segundos, retorna no formato: "hh:mm:ss"
//
// Começamos com o tempo de duração em segundos
VAR Duration = [Tempo gasto em espera]
// 1 hora tem 3,600 segundos
VAR Hours =
    INT ( Duration / 3600)
// 1 minuto tem 60 segundos
VAR Minutes =
    INT ( MOD( Duration - ( Hours * 3600 ),3600 ) / 60)
// Os segundos restantes são o restante dos segundos dividido por 60 após a subtração das horas
VAR Seconds =
    ROUNDUP(MOD ( MOD( Duration - ( Hours * 3600 ),3600 ), 60 ),0) // We round up here to get a whole number
// Essas variáveis ​​intermediárias garantem que temos zeros à esquerda concatenados em dígitos únicos
// Horas com zeros à esquerda
VAR H =
    IF ( LEN ( Hours ) = 1, 
        CONCATENATE ( "0", Hours ),
        CONCATENATE ( "", Hours )
      )
// Minutos com zeros à esquerda
VAR M =
    IF (
        LEN ( Minutes ) = 1,
        CONCATENATE ( "0", Minutes ),
        CONCATENATE ( "", Minutes )
    )
// Segundos com zeros à esquerda
VAR S =
    IF (
        LEN ( Seconds ) = 1,
        CONCATENATE ( "0", Seconds ),
        CONCATENATE ( "", Seconds )
    )
// Agora retorna horas, minutos e segundos com zeros à esquerda no formato adequado "hh:mm:ss"
RETURN
    CONCATENATE (
        H,
        CONCATENATE ( ":", CONCATENATE ( M, CONCATENATE ( ":", S ) ) )
    )