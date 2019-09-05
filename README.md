# Logistic-Regression
Learning documentation for logistic regression

# Logistic Regression	🤖 🤩
I. Classification	
- Email
- Online transaction ( fraudulent) yes or no?
- Tumor
- Credit risk

# Types
- Binary Classification
- Multiclass classification

## Binary Classification :
y∈ {0,1}
## Multiclass Classification:
y∈{0,1,2,3}

# Ways of Applying  classification
- Linear Regression
- Logistic regression

## Linear Regression :
Assign threshold value using linear regression h(x) = θtx , which will be used as a classifier.

## Logistic Regression
Want 0<=h(x)<=1 , so
Assign sigmoid function to classify the data point and optimising it .
h(x) = g(θtx) = 1/1+e-(θtx)
Here h(x) is estimated probability that y =1 on input x
 h(x) = p(y=1|x;θ) 
p(A) + P(B) = 1
Here, p(y=1|x;θ) + p(y=0|x;θ) = 1
So, p(y=0|x;θ) = 1 -  p(y=1|x;θ)

## Decision Boundary 
Let’s predict y =1 if h(x) >= 0.5
And y = 0 if h(x) < 0.5
For y =1,
Since h(x) =g(z) , so —> g(z) >=0.5 when z>=0
hence, θtx >=0
Let’s consider an example with dataset has 2 training variable x1, x2

h(x) = g (θ0+θ1x1+θ2x2)
And let’s consider we are finding 
—>Parameter as [-3 ;1;1]
Hence, to predict y = 1 , g(z) should be 
>= 0.5 , for that z should be >=0 
(note , here z  = θ0+θ1x1+θ2x2)
so, θ0+θ1x1+θ2x2 >=0
-3+x1+x2 >=0
 x1+x2 >= 3  ( which means y = 1 whenever the datapoint resides in the is area)
In another words , g(z)>= 0.5 when x1+x2 >= 3
Hence the boundary line which separates 2 different probability of event x1+x2 = 3

## How to choose θ ?
Applying cost function method used in linear regression.
J(θ) = 1/m Σ 1/2 (h(x) - y )2
But for logistic regression h(x) will be 1/1+e-z (which is non linear)
So that, J(θ) won’t converge to global minimum called ‘non -convex’
Hence —> this cost computing method can’t be used

Logistic regression cost function is as follows
cost(h(x),y) = { -log(h(x) 	if y = 1
	 -log(1-h(x))	if y = 0
If h(x) = 1 and y =1 then J(θ) = 0
If h(x) = 1 and y =0 then J(θ) approaching ∞

Intuition we are getting from the given cost is, if a hypothesis of rain predicted tomorrow h(x) = 1 but if it won’t rain y = 0 then we will penalise learning algorithm by very large cost. 

### —> Logistic Regression cost function
J(θ) = 1/m Σ cost(h(x),y) 
here, cost(h(x),y) = { -log(h(x)) 	if y = 1
		                  -log(1-h(x))	if y = 0
                      
		OR
cost(h(x),y) = -y log(h(x)) - (1-y) log (1 - h(x))
—> want min J(θ) for function θ
To optimise theta , we gonna use gradient descent,
Repeat {
θ:=θ-α @/@θ J(θ)
}

## Multiclass classification 
Email tagging
Climate forecast (Rain, Sunny, Windy)
Brain radio wave classification

Here we use one vs all methodology ,
Which means we will run binary classification for three times for training set which has three different classes.
Eg: Rain vs all , Sunny vs all , Windy vs all
And finally for a new input variable x to make prediction, we will pass the data into all 3 hypothesis and choose the one which give highest probability maxi h(x) 

## Fitting problem 
Some times based on the training set, they hypothesis we define may cause fitting problem for new example which is called ‘bias’ for under fitting and ‘variance’ for overfitting. 
We will need to find the correct higher order polynomial for our training set so that it can give the most accurate prediction.


## Ways to reduce number of feature :
— Manually
— Using feature selection algorithm(like correlation)

## Regularisation :
— Keep all feature but reduce magnitude 
To avoid the overfitting problem, we may need to simplify the hypothesis value by reducing the parameter θ for all the features(Except θ0 since it doesn’t come up with feature) . To achieve that , we will do mathematical technique by adding ‘Regularisation parameter’ with existing cost function J(θ) as below.
J(θ) = 1/2m * [(sum (h(x) -y)^2) + λ/m sumθj2]
λ- Regularisation parameter
Here setting the value for λ as minimum as possible may help to overcome the overfitting problem and will result the most accurate prediction.

**Note** : while applying gradient descent for regularised model, we will need to apply update rule for θ0 separately as it doesn’t have regularised parameter added. And for rest of them with regularised parameter gradient descent has to applied .


                                            ***Thank You!***
