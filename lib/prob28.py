def diagonal_sum(n):
    if n == 1:
        return 1
    
    total = 1
    for i in range(3, n + 1, 2):
        corners = [
            i*i,
            i*i - (i - 1),
            i*i - 2 * (i - 1),
            i*i - 3 * (i - 1)
        ]
        total += sum(corners)
    
    return total
