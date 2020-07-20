/// local mapping of ^SPOOL global
Class User.SPOOL Extends %Persistent [ Final, SqlRowIdPrivate, StorageStrategy = SpoolSQL ]
{
Property Document As %Integer [ ReadOnly ];
Property LineNumber As %Integer [ ReadOnly ];
Property Text As %String(MAXLEN = "") [ ReadOnly ];
Index idx On (Document, LineNumber) [ IdKey ];

Storage SpoolSQL
{
<SQLMap name="Spool">
 <Data name="Text">
  <Delimiter>$c(13)_$c(10)</Delimiter>
  <Piece>1</Piece>
  </Data>
 <Global>^SPOOL</Global>
 <Subscript name="1">
  <Expression>{Document}</Expression>
  </Subscript>
 <Subscript name="2">
  <Expression>{LineNumber}</Expression>
  </Subscript>
 <Type>data</Type>
</SQLMap>
 <StreamLocation>^SPOOLS</StreamLocation>
<Type>%Library.CacheSQLStorage</Type>
}
}
