cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "bba796dec6f1b7899078cb53103a9251cee41c08208cdace92a355760f6776be#1" \
  --change-address "addr_test1vqqz4g35263x8lzyxe2q9gmlyskca7emcak53tt7cenekpc8a9u7h" \
  --metadata-json-file myData.json \
  --protocol-params-file protocol.params \
  --out-file metadataTx.unsigned

cardano-cli transaction sign \
  --tx-body-file metadataTx.unsigned \
  --signing-key-file /config/workspace/repo/src/wallet/receiver107.skey \
  --testnet-magic 2 \
  --out-file metadataTx.signed

 cardano-cli transaction submit \
  --testnet-magic 2 \
  --tx-file metadataTx.signed