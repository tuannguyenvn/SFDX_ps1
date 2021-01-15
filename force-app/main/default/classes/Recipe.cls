public class Recipe {
   public string name;
   public string instructions;
   public final static integer MAX_TEMP;
   static {
       MAX_TEMP = 550;
   }
   private boolean bFirst = false;
   private static boolean bRecipesExist = false;	

   private List<Ingredient> lstIngredients;
    
   private class Ingredient {
       private string name;
       private string quantity;
       
       public Ingredient(string inName, string inQuantity) {
           name = inName;
           quantity = inQuantity;
       }
       
       public void printDescription() {
           system.debug('...' + name + ', ' + quantity);
       }
   }

   public List<Ingredient> IstIngredients {
        get {return lstIngredients;}
   }

   public Boolean B_First {
       get {return bFirst;}
   }

   public Recipe () {
    if (!bRecipesExist) {
        bRecipesExist = true;
        bFirst = true;        
    }

   }
   public Recipe (string recipName, string recipInstructions) {
        this();
        lstIngredients = new List<Ingredient>();
        name = recipName;
        instructions = recipInstructions;
    }

    public void printDescription () {
        System.debug('name: ' + name + 'instruction: ' +  instructions);
        for( Ingredient nextIngredient : lstIngredients) {
            nextIngredient.printDescription();
        }

        if( bFirst ) {
            system.debug('**********');
        }

		return;
    }

    public Boolean hasInstructions () {
        return String.isNotEmpty(this.instructions) ;
    }

    public void addIngredient(string ingredientName, string quantity) {
        lstIngredients.add(new Ingredient(ingredientName, quantity));
    }
}