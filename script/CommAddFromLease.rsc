:local commDHCP;
:local IPaddress;
:local countIPdhcp [/ip dhcp-server lease print count-only];
:local countAddressList [/ip firewall address-list print count-only];

:for i from=0 to=($countIPdhcp-1) do={

   :set commDHCP [/ip dhcp-server lease get value-name=comment number=$i]; :put $commDHCP;
   :set IPaddress [/ip dhcp-server lease get value-name=address number=$i]; :put $IPaddress;

   :for ii from=0 to=($countAddressList-1) do={
      :if ([/ip firewall address-list get value-name=address number=$ii]=$IPaddress) do={
         [/ip firewall address-list set comment=$commDHCP number=$ii];
      };            

   };

};

#       [/ip firewall address-list set comment=$commDHCP number=[/ip firewall address-list find address=$IPaddress]];
