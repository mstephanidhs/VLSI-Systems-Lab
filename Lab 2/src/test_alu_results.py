import sys

A=[]
B=[]
opcode=[]
Y=[]

operation = {
    0: "A-B                                 :-:",
    1: "A+B                                 :-:",
    2: "A-1                                 :-:",
    3: "A+1                                 :-:",
    4: "|A|                                 :-:",
    5: "not A                               :-:",
    6: "A and B                             :-:",
    7: "A or B                              :-:",
    8: "A ^ B                               :-:",
    9: "A <<< B                             :-:",
    10:"A >>> B                             :-:",
    11:"A >> B                              :-:",
    12:"A left Circular shift by B Bits     :-:",
    13:"A right Circular shift by B Bits    :-:",
    14:"0                                   :-:",
    15:"1                                   :-:"
}

with open(sys.argv[1]) as f:
    for line in f:
        nums = [int(n) for n in line.split()]
        opcode.append(nums[0])
        A.append(nums[1])
        B.append(nums[2])
        Y.append(nums[3])

    for i in range(len(opcode)):
        if opcode[i]==0:
            expected = A[i]-B[i]


        elif opcode[i]==1: 
            expected = A[i]+B[i]

        elif opcode[i]==2:
            expected = A[i]-1

        elif opcode[i]==3:
            expected = A[i]+1

        elif opcode[i]==4:
            if (A[i]<0) : expected = -A[i]
            else : expected = A[i]

        elif opcode[i]==5:
            expected = ~A[i]

        elif opcode[i]==6:
            expected = A[i] & B[i]

        elif opcode[i]==7:
            expected = A[i] | B[i]

        elif opcode[i]==8:
            expected = A[i] ^ B[i]

        
        elif opcode[i]==9:
            expected = A[i] << B[i]

        elif opcode[i]==10:
            expected = A[i] >> B[i]
        
        elif opcode[i]==11:
            expected = A[i] >> B[i]

            

        elif opcode[i]==12:
            lala=1

        elif opcode[i]==13:
            lala=1

        elif opcode[i]==14:
            expected = 0

        elif opcode[i]==15:
            expected = 1





        if expected == Y[i]:
            print("✅ Line ",i+1," OK    :", "Operation", operation[opcode[i]]," A: ",A[i]," B: ",B[i], " Y: ", Y[i])
        else:
            print("❌ Line ",i+1," ERROR :", "Operation", operation[opcode[i]]," A: ",A[i]," B: ",B[i], " Y: ", Y[i])
            error=1

if error==1 :
    print("The test failed!")
else:
    print("The test was succesful!. Μπράβο μωρή Φιλενάδα <3")