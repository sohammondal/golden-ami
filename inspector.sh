#RANDOM=$$
dt=$(date '+%d-%m-%Y--%H-%M-%S');
stack_name=Inspector-Test-$dt



aws cloudformation create-stack \
		   --stack-name $stack_name \
                   --template-body file://Inspector.yml \
                   --capabilities CAPABILITY_IAM \
                   --parameters ParameterKey=KeyResourceGroup,ParameterValue="Inspector" \
		   		ParameterKey=ValueResourceGroup,ParameterValue="Assessment" \
				ParameterKey=AssessmentTargetNamePara,ParameterValue=inspector-assessment-target-$dt \
				ParameterKey=AssessmentTemplateNamePara,ParameterValue=inspector-assessment-template-$dt \
				ParameterKey=TopicNameSES,ParameterValue=SNS2TriggerLambda2-$dt \
				ParameterKey=InspectorDuration,ParameterValue=400
				

aws cloudformation wait stack-create-complete --stack-name $stack_name
