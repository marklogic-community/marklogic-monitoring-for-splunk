xquery version "1.0-ml";
declare namespace html = "http://www.w3.org/1999/xhtml";

declare function local:column($val){
  if (contains($val, ',') or contains($val, '"'))
  then '"'||replace($val, '"', '""')||'"'
  else $val
};

declare function local:cell($val) {
  normalize-space( string-join( ($val, ""), " " ) )
};

string-join(
  (
    "feature,feature_description",
    let $feature-doc := xdmp:http-get("http://docs.marklogic.com/guide/messages/intro")
    let $rows := xdmp:unquote($feature-doc[2])/html:html/html:body/*//html:div[html:p/html:a/@id="id_pgfId-1059358"]/html:table[@class="api_generic_table"]/html:tr[html:td]
    return (
      for $row in $rows
      let $feature := local:cell($row/html:td[1]/string())
      let $description := local:cell($row/html:td[2]/string())
      order by $feature
      return
        string-join( ($feature, $description) ! local:column(.), "," )
    )
  ), "&#10;")