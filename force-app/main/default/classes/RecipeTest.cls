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

    @istest
    static void AddListTest() {
        List<Recipe> lstRecipes = new List<Recipe>();
        Recipe newRecipe = new Recipe('gazpacho', 'fry garlic and onions, add tomatoes, cook 15 mins, cool');
        newRecipe.addIngredient('tomatoes', '3 lbs');
        newRecipe.addIngredient('garlic', '2 cloves');
        lstRecipes.add(newRecipe);

        System.assertEquals(newRecipe.IstIngredients.size(), 2) ;
    }

    @istest
    static void ConstructorThisTest() {
        Recipe newRecipe = new Recipe('gazpacho', 'fry garlic and onions, add tomatoes, cook 15 mins, cool');
        
        System.assertEquals(newRecipe.B_First, true);
    }

}