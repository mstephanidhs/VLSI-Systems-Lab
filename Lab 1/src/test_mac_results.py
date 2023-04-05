import sys

a=[]
b=[]
out=[]
sum=0

with open(sys.argv[1]) as f:
    for line in f:
        nums = [int(n) for n in line.split()]
        a.append(nums[0])
        b.append(nums[1])
        out.append(nums[2])

    for i in range(len(out)):
        sum = sum + a[i] * b[i]

        if sum ==out[i]:
            print("✅ Line ",i+1," ok ")
        else:
            print("❌ Line ",i+1," ERROR")
            error=1

if error==1 :
    print("The test failed!")
else:
    print("The test was succesful!")
