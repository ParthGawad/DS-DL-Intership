import numpy as np
from sklearn.metrics import mean_squared_error
# For 2 values
class LogisticRegression : 
    def __init__(self, input_data, input_label, b0=0, b1 = 0):
        self.b0, self.b1 = b0,b1
        self.sigmoid = np.array()

    def fit(self, X, y) :
        X_mean = np.mean(X)
        y_mean = np.mean(y)
        ssxy, ssx = 0,0

        for _ in range(len(X)) :
            ssxy += (X[_] - X_mean) * (y[_] - y_mean)
            ssx += (X[_] - X_mean) ** 2
        
        self.b1 = ssxy / ssx
        self.b0 = y_mean - (self.b1 * X_mean)

        return self.b0, self.b1
    
    def predict(self, Xi) :
        z = self.b0 + (self.b1 * Xi)
        sigmoid = 1 / (1 + np.exp(-z))
        if sigmoid  >= 0.5 : 
            y_pred = 1
        else : 
            y_pred = 0
        return sigmoid,y_pred

if __name__ == '__main__' : 
    heights = np.array([
        [160],[172],[182],[180],[154]
    ])
    weights = np.array([
        72,76,77,83,76
    ])

    print(f'The Shape of x : {heights.shape} \ and the shape of y : {weights.shape}');
    lr = LogisticRegression()
    b0,b1 = lr.fit(X=heights, y=weights)
    print(f'The value of Intercept : {b0} \ The value of slope : {b1} \n')

    Xi = [[176]]
    y_hat = lr.predict(Xi)
    print(f'The weight of the person with the \ height of {Xi} is predicted as {y_hat}')

    # Sklearn model
    model = LogisticRegression()
    model.fit(heights,weights)
    y_pred = model.predict(Xi)
    print(y_pred)

# 23-06-25
    print(f'True Label : {weights}')
    print(f'Predicted Label : {y_hat}')

    def meanSquaredError(self) :
        error = self.y - self.y_hat
        squaredError = error ** 2
        return np.mean(squaredError)
    
    def gradientDescent(self, alpha=0.00005,epochs = 1): 
        error = self.y - self.y_hat
        n = len(self.X)
        for _ in range(epochs):
            del_b1 = (-2/n) * np.sum(self.X * error)
            del_b0 = (-2/n) * np.sum(error)
            self.b1 = alpha * del_b1
            self.b0 = alpha * del_b0
            print(f'Epoch : {_+1}st | B1 : {self.b1} | B0 : {self.b0}')
        return self.b0, self.b1;

    
    mse = meanSquaredError(y_true=weights, y_pred=y_hat)
    print(f'Hardcoded function : {mse}')

    skmse = mean_squared_error(y_true=weights, y_pred=y_hat)
    print(f'Sklearn Function : {skmse}')

    newb0 , newb1 = lr.gradientDescent(epochs=10)
    new_y_hat = lr.predict(heights)
    print(f'New Predictions : {new_y_hat}')

    newmse = lr.mean_squared_error();

    result = list()
    for _ in range(len(sigmoid)) : 
        if sigmoid[_] >= 0.5 : 
            y_pred = 1
        else :
            y_pred = 0
        result.append(y_pred)
    
    print(f'True Label : {y}')
    print(f'Pred label : {y_pred}')