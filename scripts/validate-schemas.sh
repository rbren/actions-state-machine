#! /bin/bash

DATA_DIR="./data"

for typeDir in $DATA_DIR/*; do
  type=${typeDir#"$DATA_DIR/"}
  echo $type
  if [[ $type == "schema" ]]; then
    continue
  fi
  for datumDir in $typeDir/*; do
    datum=${datumDir#"$typeDir/"}
    echo -e "  $datum"
    ajv validate -s data/schema/$type/data.yaml -d data/$type/$datum/data.yaml
  done
done
