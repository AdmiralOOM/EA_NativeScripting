# .bashrc file
export PREVIEW="--testnet-magic 2"

# GENERATE PROTOCOL PARAMETERS FOR THE ENVIRONMENT #
cardano-cli query protocol-parameters --testnet-magic 2 --out-file protocol.params

<<<<<<< HEAD
cardano-cli transaction build \
  --babbage-era \
  --testnet-magic 2 \
  --tx-in "6aad99ae015f657fa09430d25665b6ddbd757f02335a8b95f1d6d3df7467651d#0" \
  --tx-out "addr_test1qqhe2k79d0aexj0mx25gl4ku04mqmygl8ecs9nekmn0wqykjn5caavpcfrhen8wkj0c6vaz0n9a7xcp4s3g3sfqc0spseknmvw 5000000000" \
  --change-address $nami \
  --protocol-params-file protocol.params \
  --out-file payment.unsigned

cardano-cli transaction sign \
  --tx-body-file payment.unsigned \
  --signing-key-file ../wallets/batch107.skey \
  --testnet-magic 2 \
  --out-file payment.signed
=======
# SET UTXO
# UTXO1=...TxHash...#TxIx
# Found by running: cardano-cli query utxo --address $(cat src/receiver107.addr) $PREVIEW
UTXO1=1423b4171d474f78c20c5daf71d00b7f7c3fff87d374ee859b20d9af1a006c0b#1

# BUILD TRANSACTION #
# cardano-cli transaction build \
#  --babbage-era \
#  --testnet-magic 2 \
#  --tx-in "addr_test1vzc2dqn5fsadu9a63xxzxcp8c9ps5k4suvztz8fexgq00nqh262h6#0" \
#  --tx-out "addr_test1vqqz4g35263x8lzyxe2q9gmlyskca7emcak53tt7cenekpc8a9u7h"+"5000000000" \
#  --change-address "stake_test1urquvgjktlt3g3r980thhnt42lauam8d88a4efgu99zte2c3g8y55" \
#  --protocol-params-file protocol.params \
#  --out-file payment.unsigned
>>>>>>> 0039115 (text updates)

# Example build from payment108 to sender107:
# tx-in = UTXO TxHash of sender address hash + index
# tx-out = receiver address (Roberto wallet)
# change-address = sender address (Roar wallet)
# cardano-cli transaction build     --babbage-era     --tx-in $UTXO1     --tx-out "addr_test1qqas65gr9hq6qjckfse8qy9x7p8hu4z65atyc3se4xw9t76006wjwp6sxleanemn7qjk8wg9dth39ur3r8aywr4s3mxq5cnz6m"+1100000000 --change-address "addr_test1vzc2dqn5fsadu9a63xxzxcp8c9ps5k4suvztz8fexgq00nqh262h6" $PREVIEW --out-file paymentTx.unsigned
cardano-cli transaction build  --babbage-era  --tx-in "1423b4171d474f78c20c5daf71d00b7f7c3fff87d374ee859b20d9af1a006c0b#0"  --tx-out "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt"+1111101000  --change-address "addr_test1vqqz4g35263x8lzyxe2q9gmlyskca7emcak53tt7cenekpc8a9u7h"   $PREVIEW --protocol-params-file protocol.params --out-file paymentTx.unsigned

# SIGN TRANSACTION #
cardano-cli transaction sign  --tx-body-file paymentTx.unsigned  --signing-key-file /config/workspace/repo/src/receiver107.skey  --testnet-magic 2 --out-file paymentTx.signed

# SUBMIT TRANSACTION #
cardano-cli transaction submit --testnet-magic 2 --tx-file paymentTx.signed


cardano-cli transaction txid --tx-file paymentTx.signed

# CHECK TRANSACTION #
cardano-cli query utxo --address "addr_test1qpc6mrwu9cucrq4w6y69qchflvypq76a47ylvjvm2wph4szeq579yu2z8s4m4tn0a9g4gfce50p25afc24knsf6pj96sz35wnt" $PREVIEW
cardano-cli query utxo --address "addr_test1vqqz4g35263x8lzyxe2q9gmlyskca7emcak53tt7cenekpc8a9u7h" $PREVIEW