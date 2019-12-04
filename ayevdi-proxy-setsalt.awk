# Copyright (C) 2019 Abhishek Choudhary
# Released under GNU GPL v2 license

BEGIN        {
               srand(seed); 
               ready=0; 
               over=0;
             }

# Presumption warning: This script presumes that there will be only one module block referenced
/\/IfModule/ {
               for (i=10000; i<=65000; i++)
               {
                 r= 3999 * (1+rand());
                 printf "\t <Location /ay%06x1n%06x>\n\t\tProxyPass http://127.0.0.1:%d/\n\t</Location>\n",
                   0xeedfba - i*2-r, 
                   0xfdebca - i*2+r, i;
               }
                 print $0;
                 next;
               }

/.*/         {
               print $0;
             }
             
