import sys
import math

x=[]
y=[]
result=[]
error = 0



with open(sys.argv[1]) as f:
    for line in f:
        nums = [int(n) for n in line.split()]
        x.append(nums[0])
        y.append(nums[1])
        result.append(nums[2])

    for i in range(len(x)):
        if result[i] != math.gcd(x[i],y[i]):
            error = 1
            print("❌ Line ",i+1," ERROR :", "X =", x[i], " and Y =",y[i], "have gcd = ", result[i], ", should be",math.gcd(x[i],y[i]))

if error==1 :
    print("❌ The test failed!")
else:
    print("✅ The test was succesful!. Μπράβο μωρή Φιλενάδα <3")