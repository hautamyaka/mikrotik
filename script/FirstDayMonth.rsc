# Скрипт запускается ежедневно после 12 ночи и если наступает первое число месяца, отключает интерфейсы.

:local a [/sys clock get date];
:put $a;
:local firstDigit [pick $a 4 5];
:local secondDigit [pick $a 5 6];
:put "First digit = $firstDigit";
:put "Second digit = $secondDigit";
:local b ([pick $a 4]+[pick $a 5]);
:put "Summa = $b";

:if ($firstDigit=0) do={
   :if ($b=1) do={
      :put "Disable interfaces";
      /interface bridge disable br-office;
      /interface bridge disable br-guest;
   } else={
      :put "Interfaces is work";
   };
} else={
   :put "First digit don't equal zerro";
};
