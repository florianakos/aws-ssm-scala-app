# aws-ssm-cli-app

This is a small project I did to learn more about Scala by using the AWS Java SDK v2 to interact with AWS Systems Manager to execute automation documents. It uses a custom scala library I've written ([link](https://github.com/florianakos/aws-utils-scala)) which is a direct dependency of this project (and is not published to any public maven repository). In order to run this project one first needs to clone that repo and do a `mvn install` to have it available for import in this project.

## Build & Run

The program can be compiled into a JAR with `mvn package` and then run via `java -jar ./target/scala-cli-app-1.0.0.jar [FLAGS]`. The **FLAGS** needed are:

* the SSM Document name via `--documentname=<SSM_DOCUMENT_NAME>` flag
* additional flags needed for the SSM Document as Input Parameters, in format `<param1=value1> <param2=value2> ...`

The AWS Credentials are loaded based on the AWS Profiles configured on the local machine at `~/.aws/credentials` and this can be configured by changing the value set in **src/main/resources/application.conf**.

## Example Usage:

One the JAR is built it can be run this way:

```
$ java -jar ./target/scala-cli-app-1.0.0.jar  --document=AWS-StopEC2Instance InstanceId=i-123456789abcd AutomationAssumeRole=arn:aw:iam::{{global:ACCOUNT_ID}}:role/AutomationServiceRole
```

The two parameters **InstanceId** and **AutomationAssumeRole** are necessary inputs to the SSM Document **AWS-StopEC2Instance**.
