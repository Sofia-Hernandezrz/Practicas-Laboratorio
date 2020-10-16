function Ver-ReglasBloqueo{
    if(Get-NetFirewallRule -Action Block -Enabled True -ErrorAction SilentlyContinue){
        $reglas = Get-NetFirewallRule -Action Block -Enabled True
        Foreach($regla in $reglas){
            Write-Host "ID:" $regla.name
            Write-Host "Nombre:" $regla.DisplayName
            Write-Host "Estado:" $regla.Enabled
            Write-Host "Dirección:" $regla.Direction
            Write-host "Acción:" $regla.Action
            "`n"
        }
    } else{
        Write-Host "No hay reglas definidas aún"
    }
}
function Agregar-ReglasBloqueo{ 
	$puerto = Read-Host -Prompt "Cuál puerto quieres bloquear?" 
	#La siguiente es una sola línea, no tiene saltos de línea
	$null = New-NetFirewallRule -DisplayName "Puerto-Entrada-$puerto" -Profile "Public" -Direction Inbound -Action Block -Protocol TCP -LocalPort $puerto 
}

function Eliminar-ReglasBloqueo{ 
	$reglas = Get-NetFirewallRule -Action Block -Enabled True 
	Write-Host "Reglas actuales" 
	foreach($regla in $reglas){ 
		Write-Host "Regla:" $regla.DisplayName 
		Write-Host "Perfil:" $regla.Profile 
		Write-Host "ID:" $regla.Name 
		$opc = Read-Host -Prompt "Deseas eliminar esta regla [Y] Si [N] No" 
		if($opc -eq "Y"){ 
			Remove-NetFirewallRule -ID $regla.name 
			#break 
		} 
	} 
}
Write-Host
    "1. Ver reglas de bloqueo"
    "2. Agregar Reglas de Bloqueo"
    "3. Eliminar reglas de bloqueo"
    "4. Salir"
    [int]$opcion = Read-Host -Prompt "Elige una opcion (numero) "

switch ($opcion){

    1{Ver-ReglasBloqueo}
    2{Agregar-ReglasBloqueo}
    3{Eliminar-ReglasBloqueo}
    default {
        Write-Host "Opcion no valida"
        }
    }
while ($opcion -ne 4){
break
}