import sys

n=4
k=4

activations_raw=[]
weights_raw=[]
bias=[]
result=[]
error = 0



with open(sys.argv[1]) as f:
    for line in f:
        bits = line.split()
        activations_raw.append(bits[0])
        weights_raw.append(bits[1])

        signed_bias = int(bits[2],2)
        if bits[2][0]=='1':
            signed_bias -= 2 ** len(bits[2])
        bias.append(signed_bias)

        result.append(int(bits[3],2))

    for i in range(len(result)):

        weights = [weights_raw[i][j:j+n] for j in range(0, len(weights_raw[i]), n)]
        activations = [activations_raw[i][j:j+k] for j in range(0, len(activations_raw[i]), k)]

        total_sum = 0
        for z in range(len(weights)):

            weight = int(weights[z], 2)
            if weights[z][0] == '1':
                weight -= 2 ** len(weights[z])

            activation = int(activations[z], 2)
            if activations[z][0] == '1':
                activation -= 2 ** len(activations[z])

            multiplication = activation * weight
            total_sum += multiplication

        error=1

        if total_sum + bias[i]>=0:
            if (result[i] == total_sum + bias[i]) :
                error = 0
            else:
                print("❌ Line ",i+1," ERROR :", "result =",result[i] , ", should be", total_sum+bias[i])
        else:
            if result[i]==0: 
                error = 0
            else:
                print("❌ Line ",i+1," ERROR :", "result =",result[i] , ", should be 0")

if error==1 :
    print("❌ The test failed!")
else:
    print("✅ The test was succesful!. Μπράβο μωρή Φιλενάδα <3")