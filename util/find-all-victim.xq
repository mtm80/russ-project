xquery version "3.0";
declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace ru="http://ru-rhetoric.obdurodon.org/rr";
let $speeches := collection("../xml/putin") | collection("../xml/zhirinovskii")
let $victimUse := $speeches//ru:victim
return $victimUse