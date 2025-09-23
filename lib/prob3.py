def solve(n):
    i = 2
    largest = 0
    init_n = n
    while i * i <= init_n:
        if n % i == 0:
            while n % i == 0:
                n //= i
            largest = i
        i += 1
    
    if largest == 0:
        largest = n
    
    return largest
