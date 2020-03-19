
export OrgName         ?= zen
export Environment		?= dev
FIREHOSE_STACK_NAME = firehose-${Environment}
KDS_STACK_NAME = kds-${Environment}

deploy-firehose:
	@echo "deploy kds..."
	@aws cloudformation deploy \
	--stack-name $(FIREHOSE_STACK_NAME) \
	--template-file kinesis-firehose.yaml \
	--parameter-overrides \
		OrgName=${OrgName} \
		Environment=${Environment} \
	--capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--no-fail-on-empty-changeset

delete-firehose:
	@aws s3 rm s3://${OrgName}-${Environment}-kds --recursive
	@aws cloudformation delete-stack \
	--stack-name ${FIREHOSE_STACK_NAME}

deploy-kds:
	@echo "deploy kds..."
	@aws cloudformation deploy \
	--stack-name $(KDS_STACK_NAME) \
	--template-file kinesis-stream.yaml \
	--parameter-overrides \
		OrgName=${OrgName} \
		Environment=${Environment} \
	--capabilities CAPABILITY_NAMED_IAM CAPABILITY_IAM CAPABILITY_AUTO_EXPAND \
	--no-fail-on-empty-changeset