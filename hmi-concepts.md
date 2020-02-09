
AyeHMI :
It is a AyeUI based interface for acessing AyeVDI secured with AyeSEC 

Description :
AyeUI :

It contains 4 layers The wwindows layer, the outer layer, middle layer and inner layer 

Windows layer is the HMI that consists of other layers in it.
### Outer layer : 
Outer layer interfaces for the containers of AyeVDI.
               Type of the container delivered will be based on  the type of AyeVDI choosed or the scenario specific 
               
               (TBD : Need to confirm on the naming convention used :
               Note : Type of container<--Type of Image <-- Scenario/ Usecase specific (for AyeLearn lessons, Or EMR Use, For Coll AI etcc...) <--- HEJLP)
               
Number of containers added per HMI can be decided based on resources available ( Number of nodes, memory, processing speed, number of CPUs etc..)

### Middle Layer
 Once the container is choosen the middle layer appears, it has th following features delivered :
 1) Console : 
   on clicking (activating) the console it directs to the third level which contains terminal (Shell), GUI, WebApp 
    (Explained in detailed in the next paragraphs
    
 2) Explorer : 
    Currently we have Ayedesk as the explorer available, comming versions will bring other type of explorers.
    Users can save their work in their respective explorer accounts
    
  3) IDE (Integrated development environment)
  #TODO : Explain IDE
  
  4) ValidCV :
  
  5) Share : 
      This feature is used for sharing the HMI/Console/Teminal/Gui or any other processes or features across various platforms
        #TBD : Analyse the technical feasibility of sharing different features, at different layer, no.of that can times shared etc.. and what feasible platforms
  6) Meet :
   Meet used for video conferencing, meetings, webinars, recordings etc...
7)Apps :
  This will provide various applications according the user requirment/package. 
  Currently available applications include :
  Healthcare  : EMR / PHR / EHR with FHIR 
                 Types :
                 1 )JIT (Just in Time ) use :
                       This type of use is for one time use, 
                 2 ) Persistant use : For persistant and continous use
                 
      Voip Services
                 
  8) Labs :
       AyeVDI provides a unique feature of acessing physical labs using online platforms.
       The lab backend lab is integrated to online platform using IoT, this becomes useful for AyeLeaarn course aspirants to have handson experience of the physical lab online
  9) TnC : Terms and Conditions
          
                       
                                            
 
     
               
