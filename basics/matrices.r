#creating a matrix:

    mat = matrix(c(1,2,3,4,5,6,7,8,9), nrow=3, byrow=TRUE)
        #c() specifies all the elements.
        #nrow specifies how many rows exist in the matrix.
        #byrow indicates whether the elements will be put following the row direction.
        
        #obs: obviously the number of elements should be divisible by the number of rows to form a proper matrix. 

    #creating a row matrix:
        rmat = rbind(c(12,33,44));  #[12, 33, 33]

    #creating a column matrix:
        cmat = cbind(c(3,5,2)); #[3] 
                                #[5]
                                #[2]
#operations:

    #accessing the matrix:

        mat[1, 3] #element present in the first row and third column.

        mat[c(1, 3), 2] #elements in 1st and 3rd rows that are also in the second column. (returns a vector)

        mat[2,] #all elements in row 2.

        mat[, 3] #all elements in column 3.

    #as well as we did in vector we can apply a addition/subtraction/multiplication/division in all elements of the matrix at once:
    mat + 10;
    mat - 15;
    mat * 100;
    mat / 50;

    #return the matrix dimention:
    dim(mat);


#others:

    #create a identity matrix of size n:
        diag(n);

    #returns the transpose of a matrix:
        t(mat);