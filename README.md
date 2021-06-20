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
 docker-compose iris iris session iris
 USER>set file="/irisdev/app/lorem.txt" open file:"RS":1 else  write "no file",! quit
 USER>open 2 for i=1:1 u file read line quit:line=""  use 2 write line,!
 USER>close 2 zwrite ^SPOOL
 USER>
```
Now you can see your SPOOLed text either from SMP or directly from your session   
```
USER>do $system.SQL.Shell()
SQL Command Line Shell
----------------------------------------------------
The command prefix is currently set to: <<nothing>>.
Enter <command>, 'q' to quit, '?' for help.
[SQL]USER>>SELECT TOP 12 ID,* FROM SPOOL
- - - - see result ----
[SQL]USER>>quit
USER>>
 ```
### Result
- ![](https://github.com/rcemper/SPOOL-mapping-ZPM/blob/master/spool.jpg?raw=true)

[Article in DC](https://community.intersystems.com/post/spool-sql-table)
