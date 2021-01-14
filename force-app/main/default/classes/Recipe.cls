public class Recipe {
   public string name;
   public string instructions;
   public final integer MAX_TEMP = 550;

   public Recipe () {
       
   }
   public Recipe (string recipName, string recipInstructions) {
        name = recipName;
        instructions = recipInstructions;
    }

    public void printDescription () {
        System.debug('name: ' + name + 'instruction: ' +  instructions);
    }

    public Boolean hasInstructions () {
        return String.isNotEmpty(this.instructions) ;
    }

    
}