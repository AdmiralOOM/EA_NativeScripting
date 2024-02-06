cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "8e0891651ee3e77cbf439be9e763adbf6c1b48285ccd20d7b14a748eda3ebc7e#0" \
  --tx-in "4d85ed8387f8ed45dae4a7d0a2be5945238b69d9785d54c6882b28794e470507#0" \
  --tx-in "306bbe60d201dc79369783958fa244e6c142946ef91f10174eabd37c12cc28e2#0" \
  --tx-in "1de14ad11c29972fb25675c51ed33c7112ecf0ea56b957dd86d5a9396847af26#3" \
  --tx-out "addr_test1qqas65gr9hq6qjckfse8qy9x7p8hu4z65atyc3se4xw9t76006wjwp6sxleanemn7qjk8wg9dth39ur3r8aywr4s3mxq5cnz6m"+"100000000" \
  --change-address "addr_test1vqqz4g35263x8lzyxe2q9gmlyskca7emcak53tt7cenekpc8a9u7h" \
  --protocol-params-file protocol.params \
  --out-file multisig.unsigned

cardano-cli transaction sign \
    --tx-body-file multisig.unsigned \
    --signing-key-file /config/workspace/repo/src/wallet/receiver107.skey \
    --signing-key-file /config/workspace/repo/src/wallet/payment108.skey \
    --testnet-magic 2 \
    --out-file multisig.signed

 cardano-cli transaction submit \
    --testnet-magic 2 \
    --tx-file multisig.signed
