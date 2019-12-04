# Copyright (C) 2019 Abhishek Choudhary
# Released under GNU GPL v2 license

BEGIN        {
               srand(seed); 
#              ready=0; 
#              over=0;
             }

# Presumption warning: This script presumes that there will be only one module block referenced
# TODO: Add more contextual parsing
/\/IfModule/ {
               for (i=10000; i<=65000; i++)
               {
                 r= 0x11ffff * (1+rand());
                 printf "\t <Location /ay%06x1n%06x>\n\t\tProxyPass http://127.0.0.1:%d/\n\t</Location>\n",
                   0xeedfba - i*179-r, 
                   0xfdebca - i*179+r, i;
               }
                 print $0;
                 next;
               }

/.*/         {
               print $0;
             }

#validate:
#| grep Location | cut -d'/' -f2 | cut -d'>' -f1 | grep -v Location | sed 's/ay/0x/g;s/1n/ 0x/g' | awk '{a=0xeedfba - strtonum($1); b=0xfdebca - strtonum($2); r=(b-a-1)/2; x=(a+r)/179; print $0, a,b,r,x}' | less
#pipe through above filter to recreate port numbers in rightmost column
