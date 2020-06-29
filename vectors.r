#creating a vector:
    x = c(1,2,3)

    gender = c("male", "female")

    #obs: vector do not support values of different types.

#sequences:
    print(2:8) #2:8 === 2 3 4 5 6 7 8

    seq(from=2, to=8, by=1) #this requence goes from 2 to 8, one by one.

#repeting numbers, strings and sequences:

    rep(1, times=5) #returns 5 instances of the number 1
    
    rep("Hello", times=3)
    
    rep(2:6, times=3)
    
    rep(seq(from=1, to=3, by=1), times=2)
    
    rep(c("hello", "world"), times=2)

#operations on vectors:
    a = 1:5
    b = c(6,7,8,9,10)

    #add/subtract 10 (to/from) every element in a vector:
    a = a + 10
    b = b - 10

    #multiply/divide by 10 every element in a vector:
    a = a * 10
    b = b / 10

    #if two vectors are of the same length, we are able to add/sub/mult/div corresponding elements:
    c = a + b # this will return a vetor which elements are the sum of corresponding elements in 'a' and 'b'. 

    #accessing a specific element within a vector:
    print(a[4]) #this will return the 4th element in a.

    #accessing all elements but the one which index is specified after a -(minus) sign:
    print(a[4]) #returns all elements but the 4th one.

    #accessing a range of elements:
    print(a[1:3]) #returns the 1st, the 2nd and the 3rd elements.

    print(a[c(1,5)]) #returns the 1st and the 5th elements.

    print(a[-c(2,4]) #returns all the element but the 2nd and the 4th ones.

    print(a[a<=3]) #returns all element, within a, that are less or equal to 3.