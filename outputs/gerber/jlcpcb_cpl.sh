#!/bin/bash

cp at101w-bottom-pos.csv jlcpcb-cpl-bottom.csv
cp at101w-top-pos.csv jlcpcb-cpl-top.csv

perl -pi -e "s/Ref,Val,Package,PosX,PosY,Rot,Side/Designator,Mid X,Mid Y,Rotation,Layer/" jlcpcb-cpl*.csv
perl -pi -e 's/","[^"]*","[^"]*"/"/' jlcpcb-cpl*.csv

# manual placement fix
perl -pi -e 's/^"U3",(.*),180/"U3",\1,-180/' jlcpcb-cpl*.csv
perl -pi -e 's/^"U4",(.*),-90/"U4",\1,0/' jlcpcb-cpl*.csv
perl -pi -e 's/^"J2",(.*),0.0000/"J2",\180.0000/' jlcpcb-cpl*.csv
perl -pi -e 's/^"Y1",(.*),0.0000/"Y1",\1,180.0000/' jlcpcb-cpl*.csv
