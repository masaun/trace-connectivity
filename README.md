# Trace Connectivity

***

## 【Introduction of Trace Connectivity】
- Trace Connectivity is DApp for controling right of provider depend on status of providing connectivity to school automatically by using smart contract.
(Connectivity mean upload speed and donwload speed of internet)


&nbsp;


***

## 【How does smart contract work in this DApp?】
1. School define stardard value of connectivity (upload speed and download speed).
  (For exapmle, 3,0G)

2. School assign ISP which has right of providing connectivity.

3. Monitoring connectivity currently in page of school connectivity ( `http://127.0.0.1:3000/school_connectivity` ).

4. In case connectivity (upload speed or download speed) currently is less than defined standard value of connectivity, it is transferred right of providing connectivity from current ISP to another ISP through smart contract.


&nbsp;


***

##【Setup】

### Setup private network by using Ganache
1. Download Ganache from link below
https://www.trufflesuite.com/ganache  


2. Execute Ganache   

&nbsp;



### Setup wallet by using Metamask
1. Add MetaMask to browser (Chrome or FireFox or Opera or Brave)    
https://metamask.io/  


2. Adjust appropriate newwork below 
```
http://127.0.0.1:7545

```

&nbsp;


### Setup backend
1. Deploy contracts to private network of Ganache
```
(root directory)

$ npm run migrate
```

&nbsp;


### Setup frontend
1. Execute command below in root directory.
```

$ npm run client
```

2. Access to browser by using link 
```
http://127.0.0.1:3000
```

&nbsp;

***


## 【Work flow】
1. Access to `http://127.0.0.1:3000/isp_donor_registry` and register information of ISP or Donor.

2. Access to `http://127.0.0.1:3000/fund` and donate (fund) ETH.

3. Access to `http://127.0.0.1:3000/school_registry` and register information of school.

4. Access to `http://127.0.0.1:3000/school_connectivity` and watch status of connectivity of being selected school
- But, implemention of this page is in progress to integrate processing of getting real-time data of connectivity yet.
- So that if you check transaction when get real-time data of school connectivity, you access to `http://127.0.0.1:3000/school_registry` and push button of "Get Real-Time Data".
- This is dashboard for monitoring connectivity below. (Only frontend. Integration of real-time data is in progress yet)
![スクリーンショット 2019-08-14 16 06 25](https://user-images.githubusercontent.com/19357502/63027682-acd87f80-bead-11e9-99eb-a952f3ad4acc.png)
![スクリーンショット 2019-08-14 16 07 18](https://user-images.githubusercontent.com/19357502/63027683-ad711600-bead-11e9-9a0a-43b0ed61a205.png)



