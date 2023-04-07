import sys

A=[]
B=[]
opcode=[]
Y=0

with open(sys.argv[1]) as f:
    for line in f:
        nums = [bin(n) for n in line.split()]
        opcode.append(nums[0])
        A.append(nums[1])
        B.append(nums[2])
        Y.append(nums[3])

    for i in range(len(opcode)):
        if opcode[i]==0:
            

        elif opcode[i]==1: 

        elif opcode[i]==2:

        elif opcode[i]==3:

        elif opcode[i]==4:

        elif opcode[i]==5:

        elif opcode[i]==6:

        elif opcode[i]==7:

        elif opcode[i]==8:
        
        elif opcode[i]==9:

        elif opcode[i]==10:
        
        elif opcode[i]==11:

        elif opcode[i]==12:

        elif opcode[i]==13:

        elif opcode[i]==14:

        elif opcode[i]==15:





        if sum == out[i]:
            print("✅ Line ",i+1," ok ")
        else:
            print("❌ Line ",i+1," ERROR")
            error=1

if error==1 :
    print("The test failed!")
else:
    print("The test was succesful!")
