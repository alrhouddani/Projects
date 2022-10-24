USE expenses
SELECT *
FROM livng_cost
Where person REGEXP 'k' # Where person REGEXP '^a'
    # Where person REGEXP 'h$'
    # Where person REGEXP '[a]h'
    # Where person REGEXP 'h|k'
    #^ starts with
    #$ Ends with
    #| Contains this or | This
    # []