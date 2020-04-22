#FoongAnn_Loo_loofoong_1004988659
#Preeti_Kumari_kumarip3_1005057395

set PROD;
set RM;
set MAC;
set WARE;

# parameters
param price{i in PROD};
param qty{i in PROD,j in RM} default 0;
param cost{j in RM};
param availQty{j in RM};
param duration{i in PROD,k in MAC} default 0;
param opcost{k in MAC};
param demand{i in PROD};
param capacity{m in WARE};

# variable declaration
var x {i in PROD} integer >=0;

# obj func
maximize profit: sum{i in PROD}((price[i] - sum{j in RM}(qty[i,j]*cost[j]) - 1/60* sum{k in MAC}(duration[i,k]*opcost[k]))*x[i]) - 
10*sum{i in PROD} (demand[i]- x[i])- 25*sum{i in PROD, k in MAC}duration[i,k];

# constraint
subject to maxDuration{k in MAC}: sum{i in PROD}duration[i,k]<=20160; #20160= 12*28*60
subject to maxCapacity: sum{i in PROD} x[i]<= sum{m in WARE} capacity[m];
subject to availRM{j in RM}: sum{i in PROD} qty[i,j]<=availQty[j];
subject to budgetRM: sum{i in PROD, j in RM} qty[i,j]*cost[j]<= 7000000;
subject to maxDemand{i in PROD}: x[i]<=demand[i];




