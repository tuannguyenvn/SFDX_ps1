public class Recipe {
   public string name;
   public string instructions;
   public final integer MAX_TEMP = 550;

    public void printDescription () {
        System.debug('name: ' + name + 'instruction: ' +  instructions);
    }
}