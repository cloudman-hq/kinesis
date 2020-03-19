# kinesis
kinesis stream and firehose
# kinesis stream
1. how to create kinesis steam
```
make deploy-kds

```
2. test
```
aws kinesis put-record --stream-name kds-dev-KinesisDeliveryStream-xxxx --partition-key 123456 --data yourtestdata

```

# kinesis firehose

1. how to create kinesis firehose
```
make deploy-firehose

```
2. test
```
aws firehose put-record --delivery-stream-name KDS-dev-DeliveryStream-xxxx \
--record='Data="{\"testdata\":\"yourtestdata\"}"'

```
