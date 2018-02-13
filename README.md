# Time-prediction

This project was completed as a part of IDS 575 coursework.

Prediction of time taken for filling a vending machine based on product already stocked and the distance to be travelled

*Description:*

The UIC campus has numerous buildings with all of them accommodating a few vending machines of their own. Students and staff make use of them the whole time during a day. So it is essential that the vending machine remains filled almost all the time at least during the day. In the library, it is needed that they are filled up with stock even during nights because a lot of students stay back until late hours. Now let us analyse the service processes of the filling of the vending machines.

*Hypothesis:*

The aim here is to predict the time needed for the suppliers to fill the empty carts of the vending machine with the food and beverage products. This will involve two main factors for the suppliers, which are the distance to the vending machine from the source of these products and the number of products that need to be stocked each time.
So our variables would be the distance to the vending machine and the products that need to be stocked in the vending machine, while our target variable is the time taken to reach the vending machine and stocking it up.

*Data Source:*

The data is being picked from a portal for statistical science, the discipline of statistics. It is a simple data set with two variables and one target variable.

*Explanatory Variables:*

| S.No  | Variable Names | Description | Variable Data Type |
| ----- | ------------- |--------------  | ---------------- |
| 1  |  Distance  | Distance from source to vending machine | Decimal |
| 2  |  Products  | Number of products to be stocked | Integer |

*Target Variables:*

| S.No  | Target Variable Name | Description | Variable Data Type |
| ----- | ------------- |--------------  | ---------------- |
| 1  |  Time  | Time taken to travel and stock the products | DateTime |

*Method and Plan:*

I would use the multiple linear regression for this proposal to build a model using the relationship between the two explanatory variables and the response variable, by fitting a linear equation with the available data based on the correlations between these explanatory variables.
