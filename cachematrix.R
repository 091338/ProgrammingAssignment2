## Put comments here that give an overall description of what your functions do
## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) { #list of functions to create and store both the initial and, later, the reveresed matrix 

	#List of functions that caches the inverse of a matrix.
	m <- NULL #initialized to null soon to be previous matrix
	set <- function(y) {
		x <<- y #sets the matrix that came as formal argument to the newly inversed matrix
		m <<- NULL #resets the previous inversed matrix back to null
	}
	get <- function() x #gets the matrix
	setInversed <- function(inversed) m <<-inversed #sets the m to the latest inveresed matrix 
	getInversed <- function() m #returns the latest inversed matrix
	list(set = set, get = get, setInversed = setInversed, getInversed = getInversed) #returns the restult as a functions list
 
}


## Return a matrix that is the inverse of 'x'
	cacheSolve <- function(x, ...) {
		m <- x$getInversed() #from the function list - we call getInversed and store it's value in m
		if (!is.null(m)) { #subsequently, if m is not null, that is, it has already inversed matrix
			print("getting cached data") #we just print to user that we are using cached data
			return(m) #and return that data
		}
	m <- solve(x$get()) #we call R integrated function solve that takes matrix as an argument - in this case, matrix we get from x via x$get()
	x$setInversed(m) #then, we set inveretd matrix with m we got in previous step
	m #and finnaly, we return m
}