 ~~~
 This is a coding example working on IRIS 2020.1 and on Caché 2018.1.3 
 It will not be kept in sync with new versions      
 It is also NOT serviced by InterSystems Support !   
~~~ 

# Spool-mapping
It is a classic Global Mapping ecercise presenting ^SPOOL as Class / Table

### Background
Device #2 named SPOOL dates back to the predecessors of Caché and IRIS  
It was the first __"%Stream"__ like option to buffer output before printing.  
It is also the first and till today the most simplest way of output redirection.   

### Solution
This is also an example of a mapped Global.   
__USE 2__ redirects the output into the Global ^SPOOL  

You can read the global manually or with some ancient utilities  
or use this mapping to access it as class or a SQL table.  

### The structure of Spool
- the global __^SPOOL__ is local to your namespace  
- fist subsccript is a UNIQUE Document_ID  
- second subsctipt is a line number UNIQUE to the document.  
- both together form the IDkey  

Details: __The Spool Device__   
https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GIOD_spool  

### Example 
- ![](https://github.com/rcemper/SPOOL-mapping-ZPM/blob/master/spool.jpg)

[Article in DC](https://community.intersystems.com/post/spool-sql-table)
