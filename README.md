# deployFabric

## 部署/deploy目录下

### 启动排序节点

```docker-compose -f docker-orderer.yaml up -d```

### 启动Peer节点

```docker-compose -f docker-peer.yaml up -d```

### 启动cli客户端

```docker exec -it cli bash```

### 在启动的cli命令行，创建一个channel

```peer channel create -o orderer.example.com:7050 -c mychannel -t 50s -f ./channel-artifacts/channel.tx ```

### peer加入channel

``` peer channel join -b mychannel.block```

### 安装智能合约

```peer chaincode install -n mycc -p github.com/hyperledger/fabric/network001/chaincode/go -v 1.0```

### 实例化合约

```peer chaincode instantiate -o orderer.example.com:7050 -C mychannel -n mycc -v 1.0 -c '{"Args":["init","a","100","b","200"]}' -P "OR('Org1MSP.member')"```

