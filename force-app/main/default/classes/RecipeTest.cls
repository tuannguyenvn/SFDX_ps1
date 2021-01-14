@istest
public with sharing class RecipeTest {
    
    @testsetup static void SetUp() {
        
    } 
    @istest
    static void  CompareInitObj() {
        Recipe var1 = new Recipe();
        var1.name = 'gazpacho';
        var1.instructions = 'fry garlic and onions, add tomatoes, cook 15 mins, cool';

        Recipe var2 = new Recipe();
        var2.name = 'gazpacho';
        var2.instructions = 'fry garlic and onions, add tomatoes, cook 15 mins, cool';

        System.assertNotEquals(var1, var2);
    }

}