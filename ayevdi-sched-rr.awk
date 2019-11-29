BEGIN {
        start=0;
        nodes=0;
        cntr=0;
        print "Using strobefile " strobefile
        system("mkdir -p $(dirname " strobefile ")")
        system("touch " strobefile)
        getline strobe < strobefile
        print "Read strobe value " strobe
        strobe=strobe+1;
}
/.*/ {
        if (start==0){
                nodes=$0;
                start=1;
                #The first input line has node count
                #hence the actual strobe targets will
                #be at strobe + 1
                if (strobe>nodes){
                        strobe=1;
                }
        }
        cntr++;
        #print nodes,cntr,strobe
        if (cntr==(strobe+1)){
                target=$0;
                print strobe > strobefile
                print target
                print "policy: rr target " target
                print "target "target" on strobe " strobe
        }
}
