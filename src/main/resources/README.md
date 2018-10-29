# MarkLogic Monitoring App

MarkLogic Monitoring app for Splunk provides insights into your MarkLogic cluster. 
The app includes pre-built dashboards that deliver real-time visibility into Error, Access, and Audit log events 
 that facilitate monitoring and analysis of MarkLogic logs.

The app includes:
- Monitoring dashboard providing an overview of cluster activity and highlighting significant error events
- Log file dashboards with filters for Error, Access, and Audit log fields
- Pre-configured soucetypes and fields for MarkLogic Error, Access, and Audit log messages
- Lookups configured with MarkLogic features, error codes, and log levels

## Configuration

The MarkLogic Monitoring app has *source* and *sourcetype* configurations with field extractions for the MarkLogic Error, Access, and Audit logs.

[Forward your MarkLogic logs to Splunk](http://docs.splunk.com/Documentation/Forwarder/latest/Forwarder/HowtoforwarddatatoSplunkEnterprise), 
and consider whether you want to [create a separate index](http://docs.splunk.com/Documentation/Splunk/latest/Indexer/Setupmultipleindexes) for MarkLogic log events.

#### Inputs
Below are example stanzas that can be applied to your *inputs.conf* in order to monitor MarkLogic log events and send to a *marklogic* Splunk index.

    #### Linux path for MarkLogic logs
    [monitor:///var/opt/MarkLogic/Logs]
    disabled = 0
    whitelist = .*Log\.txt$
    #index = marklogic
    
    #### Mac OS X path for MarkLogic logs
    [monitor://*/MarkLogic/Data/Logs]
    disabled = 0
    whitelist = .*Log\.txt$
    #index = marklogic
    
    #### Windows path for MarkLogic logs
    [monitor://*\MarkLogic\Data\Logs]
    disabled = 0
    whitelist = .*Log\.txt$
    #index = marklogic

### Macros
The MarkLogic monitoring dashboard queries make use of *macros* in order to construct base queries that target 
MarkLogic log events from the MarkLogic sourcetypes for Error, Access, and Audit logs

- *marklogic_index* - search criteria limited to `(index=main OR index=marklogic)`
- *marklogic_access* - restricts searches to the MarkLogic *_AccessLog.txt events
- *marklogic_audit* - restricts searches to the MarkLogic AuditLog.txt events
- *marklogic_error* - restricts searches to the *ErrorLog.txt events

You can change these by modifying the *marklogic*, *marklogic_index*, *marklogic_error*, *marklogic_access*, 
and *marklogic_audit* macros under *Settings > Advanced search > Search macros*.

## Questions
Contact **Mads Hansen** [mads.hansen@marklogic.com](mailto:mads.hansen@marklogic.com)

## License

The MarkLogic Monitoring app is licensed under the Apache License 2.0. Details can be found in the file [LICENSE](LICENSE) file.