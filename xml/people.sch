<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:ns prefix="ru" uri="http://ru-rhetoric.obdurodon.org/rr"/>
    <sch:ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
    <sch:pattern>
        <sch:rule context="u">
            <sch:assert test="@resp = //tei:titleStmt//tei:persName/@ref">Error</sch:assert>
        </sch:rule>
        <sch:rule context="ru:actorDesc">
            
        </sch:rule>
    </sch:pattern>
</sch:schema>