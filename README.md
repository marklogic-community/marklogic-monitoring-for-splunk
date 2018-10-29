# MarkLogic Monitoring App for Splunk

MarkLogic Monitoring app for Splunk provides configurations and dashboards intended to make
monitoring and analyzing MarkLogic Error, Access, and Audit logs in Splunk easier.

![Monitoring dashboard](src/main/resources/appserver/static/screenshot.png "Monitoring dashboard")


## Installation

Install this app the same way you would install any Splunk app:
- automatically from [SplunkBase](https://splunkbase.splunk.com/app/TODO)(**TODO update link if/when added to Splunkbase**) 
through *Browse more apps*
- manually: download the *marklogic-monitoring.spl* file and install it in your Splunk instance

## Building

To build the MarkLogic Monitoring app from source, clone the Github repository:
    
    git clone https://project.marklogic.com/repo/scm/intel/splunk-marklogic-monitoring.git

and run this command from the top-level folder:

    ./gradlew build -x appInspect

In order to validate the application using the Splunk [AppInspector](http://dev.splunk.com/view/appinspect/SP-CAAAFAR), you will need to specify your Splunk credentials. You can provide them as commandline switches:

    gradlew build -PappInspectorUsername=myUsername -PappInspectorPassword=myPassword

or you can add the properties to your ~/.gradle/gradle.properties

    appInspectorUsername=myUsername
    appInspectorPassword=myPassword
    
and then you can run the build with validation:

    ./gradlew build    

## Questions
Contact **Mads Hansen** [mads.hansen@marklogic.com](mailto:mads.hansen@marklogic.com)

## License

The MarkLogic Monitoring app is licensed under the Apache License 2.0. Details can be found in the [LICENSE](LICENSE) file.