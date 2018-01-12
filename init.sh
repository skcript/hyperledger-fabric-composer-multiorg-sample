# ./byfn.sh -m up -s couchdb -a

composer card create -p connection-org1-only.json -u PeerAdmin -c crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/33ce164b055e045d5b8c9eed662ee6bafab7e3e3dc52bc0622a391ec7471b7b1_sk -r PeerAdmin -r ChannelAdmin
composer card import -f PeerAdmin@byfn-network-org1-only.card

composer card create -p connection-org1.json -u PeerAdmin -c crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/signcerts/Admin@org1.example.com-cert.pem -k crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp/keystore/33ce164b055e045d5b8c9eed662ee6bafab7e3e3dc52bc0622a391ec7471b7b1_sk -r PeerAdmin -r ChannelAdmin
composer card import -f PeerAdmin@byfn-network-org1.card

composer card create -p connection-org2-only.json -u PeerAdmin -c crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem -k crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/1499c415576378a08e02861ca029e50793fdd6d2a36a0317b6ba3d6da37b2072_sk -r PeerAdmin -r ChannelAdmin
composer card import -f PeerAdmin@byfn-network-org2-only.card

composer card create -p connection-org2.json -u PeerAdmin -c crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/signcerts/Admin@org2.example.com-cert.pem -k crypto-config/peerOrganizations/org2.example.com/users/Admin@org2.example.com/msp/keystore/1499c415576378a08e02861ca029e50793fdd6d2a36a0317b6ba3d6da37b2072_sk -r PeerAdmin -r ChannelAdmin
composer card import -f PeerAdmin@byfn-network-org2.card

composer runtime install -c PeerAdmin@byfn-network-org1-only -n trucerts-network

composer runtime install -c PeerAdmin@byfn-network-org2-only -n trucerts-network

composer network start -c PeerAdmin@byfn-network-org1 -a trucerts-network@0.0.1.bna -o endorsementPolicyFile=endorsement-policy.json -A alice -C alice/admin-pub.pem -A bob -C bob/admin-pub.pem

composer card create -p connection-org1.json -u alice -n trucerts-network -c alice/admin-pub.pem -k alice/admin-priv.pem

composer card import -f alice@trucerts-network.card

composer network ping -c alice@trucerts-network




composer card create -p connection-org2.json -u bob -n trucerts-network -c bob/admin-pub.pem -k bob/admin-priv.pem
composer card import -f bob@trucerts-network.card
composer network ping -c bob@trucerts-network
