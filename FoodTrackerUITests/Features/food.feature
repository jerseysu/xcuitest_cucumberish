Feature: FoodTracker Cucumberish Exapmle

Scenario: Verify Meal Caption
Given the app is running
When I select "Caprese Salad"
Then I should see Caprese Salad

Scenario Outline: Verify Meal Rating
When I select "<meal>"
And I rating as <star>
Then I should see "<meal>" rating as <star>

Examples:
|  meal                  |      star   |
|  Caprese Salad         |      2      |
|  Chicken and Potatoes  |      5      |
|  Pasta with Meatballs  |      1      |

