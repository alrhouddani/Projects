# try and except

nums = [0, 1, 2, 3]

try:
    print(sum(nums))

except:
    print('Cannot print the sum! Your variables are not numbers.')


# finally
nums = ['x', 'y', 'z']

try:
    print(sum(nums))

except:
    print('Cannot print the sum! Your variables are not numbers.')

finally:
    print('Hope you got the result you want!')

nums = [5, 2, 3, 10]
s = nums.__len__()
# or
s1 = len(nums)
print(s)
print(s1)
