#importing data (.csv, .txt(tab delimited) files) into R + Working with a set of data.

    #importing data from a .csv file: (reads a file in table format and creates a table.)
        data = read.csv(file.choose(), header=TRUE)
            #1st arg: path to the file. (or, we can call a method that pops up a windows for us to search for the file).
            #2nd arg: indicate whether the first row of our file is a header.

    #importing data from a generic file that has data organized in table format:
        data = read.table(file.choose(), header=TRUE, sep=",")
            #3nd arg: indicates what separates the data inside the file.(in this ex, we're dealing with comma separated values [.csv file] thus the sep arg is ',')


    #importing data from a .txt file: (where data is tab delimited and formatted like a table)
        data = read.delim(file.choose(), header=TRUE)
    
    #this file is formated like a table and is tab delimited:
        data = read.table(file.choose(), header=TRUE, sep="\t")

    #to show a graphic table with the data in it you can:
        View(data)