# AWS SSM Helper (Scala CLI App)

This is a small project I did to learn more about Scala by using the AWS Java SDK v2.

## Dependency

I've decided to extract all the AWS Helper classes into a separate project that lives in a different github repo ([aws-scala-utils](https://github.com/florianakos/aws-utils-scala)). In order to use this project, one first needs to clone the dependent project and install it to local repository by `mvn install` command in the root directory of the repository.

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
