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

__SELECT TOP 12 ID,* FROM SPOOL WHERE Document=3__  
https://github.com/rcemper/SPOOL-mapping-ZPM/blob/master/spool.jpg
~~~

|   ID  | Doc |	Line | Text 
--------------------------------------------------
| 3||1  |  3  |   1  | Lorem ipsum dolor sit amet, consectetuer adipiscing
| 3||2  |  3  |   2  | elit, sed diam nonummy nibh euismod tincidunt ut laoreet
| 3||3  |  3  |   3  | dolore magna aliquam erat volutpat. Ut wisi enim ad minim
| 3||4  |  3  |   4  | veniam, quis nostrud exercitation ulliam corper suscipit lobortis
| 3||5  |  3  |   5  | nisl ut aliquip ex ea commodo consequat.
| 3||6  |  3  |   6  | Duis autem veleum iriure dolor in hendrerit in vulputate
| 3||7  |  3  |   7  | velit esse molestie consequat, vel willum lunombro dolore
| 3||8  |  3  |   8  | eu feugiat nulla facilisis
| 3||9  |  3  |   9  | at vero eros et accumsan
| 3||10 |  3  |  10  | et iusto odio dignissim qui blandit praesent
| 3||11 |  3  |  11  | luptatum zzril delenit augue duis dolore te feugait nulla
| 3||12 |  3  |  12  | facilisi. Li Europan lingues es membres
~~~

