
cd QBFT-Network/Node-0/

export ADDRESS=$(grep -o '"address": *"[^"]*"' ./data/keystore/accountKeystore | grep -o '"[^"]*"$' | sed 's/"//g') export PRIVATE_CONFIG=ignore
 ../../quorum-master/build/bin/geth --datadir data  --networkid 1337 --nodiscover --verbosity 5  --syncmode full --istanbul.blockperiod 5 --miner.threads 1 --miner.gasprice 0 --emitcheckpoints   --http --http.addr 127.0.0.1  --http.corsdomain "*" --http.port 8545  --http.corsdomain "*" --http.vhosts "*"  --ws --ws.addr 127.0.0.1 --ws.port 32000 --ws.origins "*" --http.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul  --ws.api admin,eth,debug,miner,net,txpool,personal,web3,istanbul --rpc --rpcaddr 127.0.0.1  --rpcport 8545 --rpcapi 'personal,db,eth,net,web3,txpool,miner,admin,clique,http' --allow-insecure-unlock   --unlock ${ADDRESS} --password ./data/keystore/accountPassword  --port 30301 --mine --ipcdisable &
cd 
sleep 10

export GETH="http://127.0.0.1:8545"

#Blockchain Exporter binary
#The binary listens to the 8545 port and publishes the blockchain metadata to Prometheus
./app-amd64-linux
