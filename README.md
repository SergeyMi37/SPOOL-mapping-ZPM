## Spool-mapping
It is a classic Global Mapping exercise presenting ^SPOOL as Class / Table

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

Details: [The Spool Device](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GIOD_spool)

### Prerequisites  
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.   
### Installation   
Clone/git pull the repo into any local directory  
```
 git clone https://github.com/rcemper/SPOOL-demo-ZPM.git   
```
Open the terminal in this directory create teh container and run it:   
```
 docker-compose up -d
```
### How to use it:   

Open a session in your container   
```
 docker-compose exec iris iris session iris -U IRISAPP
 IRISAPP>set file="/irisdev/app/lorem.txt" open file:"RS":1 else  write "no file",! quit
 IRISAPP>open 2 for i=1:1 u file read line quit:line=""  use 2 write line,!
 IRISAPP>close 2 zwrite ^SPOOL
 IRISAPP>
```
Now you can see your SPOOLed text either from SMP or directly from your session   
```
IRISAPP>do $system.SQL.Shell()
SQL Command Line Shell
----------------------------------------------------
The command prefix is currently set to: <<nothing>>.
Enter <command>, 'q' to quit, '?' for help.
[SQL]IRISAPP>>SELECT TOP 12 ID,* FROM SPOOL
1.      SELECT TOP 12 ID,* FROM SPOOL

ID      Document        LineNumber      Text
1||1    1       1       Lorem ipsum dolor sit amet, consectetuer adipiscing
1||2    1       2       elit, sed diam nonummy nibh euismod tincidunt ut laoreet
1||3    1       3       dolore magna aliquam erat volutpat. Ut wisi enim ad minim
1||4    1       4       veniam, quis nostrud exercitation ulliam corper suscipit lobortis
1||5    1       5       nisl ut aliquip ex ea commodo consequat.
1||6    1       6       Duis autem veleum iriure dolor in hendrerit in vulputate
1||7    1       7       velit esse molestie consequat, vel willum lunombro dolore
1||8    1       8       eu feugiat nulla facilisis
1||9    1       9       at vero eros et accumsan
1||10   1       10      et iusto odio dignissim qui blandit praesent
1||11   1       11      luptatum zzril delenit augue duis dolore te feugait nulla
1||12   1       12      facilisi. Li Europan lingues es membres

12 Rows(s) Affected
statement prepare time(s)/globals/cmds/disk: 0.0732s/37737/175514/0ms
          execute time(s)/globals/cmds/disk: 0.0008s/13/1786/0ms
                          cached query class: %sqlcq.IRISAPP.cls2
---------------------------------------------------------------------------
[SQL]IRISAPP>>quit
IRISAPP>
 ```
### Result in SMP
- ![](https://github.com/rcemper/SPOOL-mapping-ZPM/blob/master/spool.jpg?raw=true)

[Article in DC](https://community.intersystems.com/post/spool-sql-table)
