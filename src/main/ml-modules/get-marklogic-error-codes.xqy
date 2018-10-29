xquery version "1.0-ml";

declare namespace html = "http://www.w3.org/1999/xhtml";

declare function local:column($val){
  if (contains($val, ',') or contains($val, '"'))
  then '"' || replace($val, '"', '""') ! replace(., ",", ";") || '"'
  else $val
};

declare function local:cell($val) {
  normalize-space( string-join( ($val, ""), " " ) )
};

declare variable $FEATURES external;

string-join(
    (
      "error_code,feature,error_description,error_cause,error_response,error_url",

      for $feature in tokenize($FEATURES, ",")
      let $error-doc := xdmp:http-get("http://docs.marklogic.com/guide/messages/"||$feature||"-en?print=yes")
      let $content := xdmp:unquote($error-doc[2])/html:html/html:body/*/*/html:div[@class="message"]
      return (
        for $message in $content
        let $code := $message/html:h3/html:a/string()
        let $link := $message/html:h3/html:a/@href/string()
        let $description := local:cell($message/html:div[html:h4="Message Text"]/html:p/string())
        let $cause := local:cell($message/html:div[html:h4="Cause"]/html:p/string())
        let $response := local:cell($message/html:div[html:h4="Response"]/html:p/string())
        order by $code
        return
          string-join(
            ($code, $feature, $description, $cause, $response, "https://docs.marklogic.com"||$link) ! local:column(.),
            "," )
          )
    ), "&#10;")