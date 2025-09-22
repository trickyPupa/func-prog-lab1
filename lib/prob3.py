def is_prime(n):
    if n < 2:
        return False
    i = 2
    while i * i <= n:
        if n % i == 0:
            return False
        i += 1
    return True


def solve(n):
    i = 2
    largest = 0
    init_n = n
    while i * i <= init_n:
        if n % i == 0:
            while n % i == 0:
                n //= i
            if is_prime(i):
                largest = i
        i += 1
    
    if largest == 0:
        largest = n
    
    return largest
